`timescale 1 ns / 1 ps
//********************************************************************
// Moving the miniSpartan6+ project to Mojo v3
// Main difference: Line 62 of the .ucf file
// We have to specify the location of the BUFPLL

// In order to select the video source, I made some changes
// in div_encoder.v Line175~178


// The EDID does have an impact on the polarity of V_SYNC, sometimes 120hz is with the
// same polarity as 60hz, sometimes the opposite. So when switch between 'cedid.txt' and
// 'nedid.txt', any code that is related to V_SYNC polarity should be modified. (Line 441, 489)
// The latest verison is 'nedid.txt', it removed the option of 72HZ shown by Nvidia tool as
// Dr. Lau requires. So sticking to 'nedid.txt' should be fine.

// Current progress: display the following modes, 1. PC desktop 120Hz
//                                                2. PC desktop 60Hz
//                                                3. SL pattern 120Hz (clock from PC)
//                                                4. SL pattern 60Hz (clock from PC)
//																	
//                   mode that is already finished,(GO TO Line701, probably the last part)
//																  1. SL pattern 120Hz (clock from Si514) NOT EASY,
//																  the "reset" signal of the PLL_BASE module cascaded to BUFGMUX is the key
//																  2. UART implemented
// Aug. 1st 2018
//********************************************************************
//`define DIRECTPASS
`define EDID256
`define TIDLP
module dvi_demo (
  //input wire        rstbtn_n,    //The pink reset button
  input wire  clk100,      //50 MHz osicallator
  
  input wire  CLK_EXT,
  inout wire  PO_SDA,
  output wire PO_SCL,
  
  input wire [3:0]  RX0_TMDS,
  input wire [3:0]  RX0_TMDSB,
  //input wire [3:0]  RX1_TMDS,
  //input wire [3:0]  RX1_TMDSB,

  output wire [3:0] TX0_TMDS,
  output wire [3:0] TX0_TMDSB,
  //output wire [3:0] TX1_TMDS,
  //output wire [3:0] TX1_TMDSB,
  
  inout wire DDC_SCL,
  inout wire DDC_SDA,
  
  //BASLER1
  input wire  sync_in_1,
  input wire  sync_in_2,
  output wire sync_out_1,
  output wire sync_out_2,
  //BASLER2
  input wire  sync_in_1B2,
  input wire  sync_in_2B2,
  output wire sync_out_1B2,
  output wire sync_out_2B2,

  output wire [7:0] LED,
  output wire [1:0] test_pin,
  
  //UART with AVR
  input  wire RST_N,
  input  wire CCLK,
  input  wire AVR_RX_BUSY,
  input  wire UART_RX,
  output wire UART_TX,
  
  //SPI with AVR
  output SPI_MISO,
  input  SPI_SS,
  input  SPI_MOSI,
  input  SPI_SCK
);

  wire rstbtn_n;
  wire [1:0] SW;
  wire [29:0] sl_extc;
  wire po_hsync, po_vsync, po_de;
  
  wire gclk;
  wire clock_pix, clock_tmds;
  wire extc_serdesstrobe;
  wire dp_rstin;
  wire clkext;
  wire [15:0] pout, pvout;
  wire [7:0] hdata;
  
  wire dds_start;
  wire CLK_40M;
  
  reg rMSW;
  reg [1:0] rMODE = 2'b00;
  reg [1:0] oMODE = 2'b00;
  reg [7:0] lut [0:1023];
  
  integer i;
  integer outfile;
  
  initial
  begin
		rMSW = 0;
		$readmemh("ml750.txt", lut);
		outfile = $fopen("cout.txt");
		for(i=0; i<1024; i=i+1)begin
		$fdisplay(outfile, "%d:%h" , i, lut[i]); end
  end
  
  assign rstbtn_n = 1'b1;
  assign SW = 2'b00;

  ////////////////////////////////////////////////////
  // 25 MHz and switch debouncers
  ////////////////////////////////////////////////////
  wire clk25, clk25m;

  BUFIO2 #(.DIVIDE_BYPASS("FALSE"), .DIVIDE(3))								//5 
  sysclk_div (.DIVCLK(clk25m), .IOCLK(), .SERDESSTROBE(), .I(clk100));

  BUFG clk25_buf (.I(clk25m), .O(clk25));

  wire [1:0] sws;

  synchro #(.INITIALIZE("LOGIC0"))
  synchro_sws_0 (.async(SW[0]),.sync(sws[0]),.clk(clk25));

  synchro #(.INITIALIZE("LOGIC0"))
  synchro_sws_1 (.async(SW[1]),.sync(sws[1]),.clk(clk25));

  wire [1:0] select = sws;

  reg [1:0] select_q = 2'b00;
  reg [1:0] switch = 2'b00;
  always @ (posedge clk25) begin
    select_q <= select;

    switch[0] = select[0] ^ select_q[0];
    switch[1] = select[1] ^ select_q[1];
  end

`ifdef EDID256 
edid_256 OPTOMA(
				.CLOCK_50					(clk25),
				
				.SCL							(DDC_SCL),
				.SDA							(DDC_SDA),
				
				.SW							(),
				.dLED							()
    );
`else 
ddc_edid  DELL15(
					.CLOCK_50				(clk25),
					
					.SCL						(DDC_SCL),
					.SDA						(DDC_SDA),
					
					.dLED						()
);
`endif
  /////////////////////////
  //
  // Input Port 0
  //
  /////////////////////////
  wire rx0_pclk, rx0_pclkx2, rx0_pclkx10, rx0_pllclk0;
  wire rx0_plllckd;
  wire rx0_reset;
  wire rx0_serdesstrobe;
  wire rx0_hsync;          // hsync data
  wire rx0_vsync;          // vsync data
  wire rx0_de;             // data enable
  wire rx0_psalgnerr;      // channel phase alignment error
  wire [7:0] rx0_red;      // pixel data out
  wire [7:0] rx0_green;    // pixel data out
  wire [7:0] rx0_blue;     // pixel data out
  wire [29:0] rx0_sdata;
  wire rx0_blue_vld;
  wire rx0_green_vld;
  wire rx0_red_vld;
  wire rx0_blue_rdy;
  wire rx0_green_rdy;
  wire rx0_red_rdy;

  dvi_decoder dvi_rx0 (
    //These are input ports
    .tmdsclk_p   (RX0_TMDS[3]),
    .tmdsclk_n   (RX0_TMDSB[3]),
    .blue_p      (RX0_TMDS[0]),
    .green_p     (RX0_TMDS[1]),
    .red_p       (RX0_TMDS[2]),
    .blue_n      (RX0_TMDSB[0]),
    .green_n     (RX0_TMDSB[1]),
    .red_n       (RX0_TMDSB[2]),
    .exrst       (~rstbtn_n),

    //These are output ports
    .reset       (rx0_reset),
    .pclk        (rx0_pclk),
    .pclkx2      (rx0_pclkx2),
    .pclkx10     (rx0_pclkx10),
    .pllclk0     (rx0_pllclk0), // PLL x10 output
    .pllclk1     (rx0_pllclk1), // PLL x1 output
    .pllclk2     (rx0_pllclk2), // PLL x2 output
    .pll_lckd    (rx0_plllckd),
    .tmdsclk     (rx0_tmdsclk),
    .serdesstrobe(rx0_serdesstrobe),
    .hsync       (rx0_hsync),
    .vsync       (rx0_vsync),
    .de          (rx0_de),

    .blue_vld    (rx0_blue_vld),
    .green_vld   (rx0_green_vld),
    .red_vld     (rx0_red_vld),
    .blue_rdy    (rx0_blue_rdy),
    .green_rdy   (rx0_green_rdy),
    .red_rdy     (rx0_red_rdy),

    .psalgnerr   (rx0_psalgnerr),

    .sdout       (rx0_sdata),
    .red         (rx0_red),
    .green       (rx0_green),
    .blue        (rx0_blue)); 

    wire CLOCK100;
	 BUFG inbufg (.I(clk100), .O(CLOCK100));

  // TMDS output
`ifdef DIRECTPASS

  wire rstin         = rx0_reset;
  wire pclk          = rx0_pclk;
  wire pclkx2        = rx0_pclkx2;
  wire pclkx10       = rx0_pclkx10;
  wire serdesstrobe  = rx0_serdesstrobe;
  wire [29:0] s_data = rx0_sdata;
  
  wire [29:0] ssl_data = sl_data30b;
  wire [29:0] datain;

  //
  // Forward TMDS Clock Using OSERDES2 block
  //
  reg [4:0] tmdsclkint = 5'b00000;
  reg toggle = 1'b0;

  always @ (posedge pclkx2 or posedge rstin) begin
    if (rstin)
      toggle <= 1'b0;
    else
      toggle <= ~toggle;
  end

  always @ (posedge pclkx2) begin
    if (toggle)
      tmdsclkint <= 5'b11111;
    else
      tmdsclkint <= 5'b00000;
  end

  wire tmdsclk;

  serdes_n_to_1 #(
    .SF           (5))
  clkout (
    .iob_data_out (tmdsclk),
    .ioclk        (pclkx10),
    .serdesstrobe (serdesstrobe),
    .gclk         (pclkx2),
    .reset        (rstin),
    .datain       (tmdsclkint));

  OBUFDS TMDS3 (.I(tmdsclk), .O(TX0_TMDS[3]), .OB(TX0_TMDSB[3]));

  wire [4:0] tmds_data0, tmds_data1, tmds_data2;
  wire [2:0] tmdsint;

  //
  // Forward TMDS Data: 3 channels
  //
  serdes_n_to_1 #(.SF(5)) oserdes0 (
             .ioclk(pclkx10),
             .serdesstrobe(serdesstrobe),
             .reset(rstin),
             .gclk(pclkx2),
             .datain(tmds_data0),
             .iob_data_out(tmdsint[0])) ;

  serdes_n_to_1 #(.SF(5)) oserdes1 (
             .ioclk(pclkx10),
             .serdesstrobe(serdesstrobe),
             .reset(rstin),
             .gclk(pclkx2),
             .datain(tmds_data1),
             .iob_data_out(tmdsint[1])) ;

  serdes_n_to_1 #(.SF(5)) oserdes2 (
             .ioclk(pclkx10),
             .serdesstrobe(serdesstrobe),
             .reset(rstin),
             .gclk(pclkx2),
             .datain(tmds_data2),
             .iob_data_out(tmdsint[2])) ;

  OBUFDS TMDS0 (.I(tmdsint[0]), .O(TX0_TMDS[0]), .OB(TX0_TMDSB[0]));
  OBUFDS TMDS1 (.I(tmdsint[1]), .O(TX0_TMDS[1]), .OB(TX0_TMDSB[1]));
  OBUFDS TMDS2 (.I(tmdsint[2]), .O(TX0_TMDS[2]), .OB(TX0_TMDSB[2]));
 
  assign datain = (rMSW==1) ? ssl_data : s_data;

  convert_30to15_fifo pixel2x (
    .rst     (rstin),
    .clk     (pclk),
    .clkx2   (pclkx2),
    .datain  (ssl_data),															//datain: switch between sl and pc; s_data: always pc
    .dataout ({tmds_data2, tmds_data1, tmds_data0}));

`else
  /////////////////
  //
  // Output Port 0
  //
  /////////////////
  wire         tx0_de;
  wire         tx0_pclk;
  wire         tx0_pclkx2;
  wire         tx0_pclkx10;
  wire         tx0_serdesstrobe;
  wire         tx0_reset;
  wire [7:0]   tx0_blue;
  wire [7:0]   tx0_green;
  wire [7:0]   tx0_red;
  wire         tx0_hsync;
  wire         tx0_vsync;
  wire         tx0_pll_reset;
  
  /*assign tx0_de           = (select[0]) ? rx1_de    : rx0_de;
  assign tx0_blue         = (select[0]) ? rx1_blue  : rx0_blue;
  assign tx0_green        = (select[0]) ? rx1_green : rx0_green;
  assign tx0_red          = (select[0]) ? rx1_red   : rx0_red;
  assign tx0_hsync        = (select[0]) ? rx1_hsync : rx0_hsync;
  assign tx0_vsync        = (select[0]) ? rx1_vsync : rx0_vsync;
  assign tx0_pll_reset    =  switch[0] | ((select[0]) ? rx1_reset : rx0_reset);*/
  assign tx0_de           = (rMODE!=2'b00) ? rx0_de : po_de;
  assign tx0_blue         = rx0_blue;
  assign tx0_green        = rx0_green;
  assign tx0_red          = rx0_red;
  assign tx0_hsync        = (rMODE!=2'b00) ? rx0_hsync : po_hsync;
  assign tx0_vsync        = (rMODE!=2'b00) ? rx0_vsync : po_vsync;
  //assign tx0_pll_reset    = switch[0] | rx0_reset;
  assign tx0_pll_reset    = (rMODE==2'b00) ? (!dds_start | (rMODE!=oMODE)) : (rx0_reset | (rMODE!=oMODE));

  //////////////////////////////////////////////////////////////////
  // Instantiate a dedicate PLL for output port
  //////////////////////////////////////////////////////////////////
  wire tx0_clkfbout, tx0_clkfbin, tx0_plllckd;
  wire tx0_pllclk0, tx0_pllclk1, tx0_pllclk2;
  wire sel, clkmux;
  
  /*wire new_pllclk0, new_pllclk1, new_pllclk2;
  wire new_clkfbout, new_plllckd;
  wire new_pclk, new_pclkx2, new_pclkx10;
  wire new_serdesstrobe, new_bufpll_lock;*/

  PLL_BASE # (
    .CLKIN_PERIOD(10),
    .CLKFBOUT_MULT(10), //set VCO to 10x of CLKIN
    .CLKOUT0_DIVIDE(1),
    .CLKOUT1_DIVIDE(10),
    .CLKOUT2_DIVIDE(5),
    .COMPENSATION("SOURCE_SYNCHRONOUS")
  ) PLL_OSERDES_0 (
    .CLKFBOUT(tx0_clkfbout),
    .CLKOUT0(tx0_pllclk0),
    .CLKOUT1(tx0_pllclk1),
    .CLKOUT2(tx0_pllclk2),
    .CLKOUT3(),
    .CLKOUT4(),
    .CLKOUT5(),
    .LOCKED(tx0_plllckd),
    .CLKFBIN(tx0_clkfbin),
    .CLKIN(clkmux),
    .RST(tx0_pll_reset)
  );
  IBUFG si514(.O(clkext), .I(CLK_EXT));
  assign sel = (rMODE==2'b00) ? 1 : 0;
  BUFGMUX clkinbufg(
							.O		(clkmux), 
							.I0	(rx0_pllclk1),
							.I1	(clkext),
							.S		(sel)
	);
  //
  // This BUFGMUX directly selects between two RX PLL pclk outputs
  // This way we have a matched skew between the RX pclk clocks and the TX pclk
  //
  /*BUFGMUX tx0_bufg_pclk (.S(select[0]), .I1(rx1_pllclk1), .I0(rx0_pllclk1), .O(tx0_pclk));*/
  BUFG tx0_bufg_pclk (.I(tx0_pllclk1), .O(tx0_pclk));				//rx0_pllclk1

  //
  // This BUFG is needed in order to deskew between PLL clkin and clkout
  // So the tx0 pclkx2 and pclkx10 will have the same phase as the pclk input
  //
  BUFG tx0_clkfb_buf (.I(tx0_clkfbout), .O(tx0_clkfbin));

  //
  // regenerate pclkx2 for TX
  //
  BUFG tx0_pclkx2_buf (.I(tx0_pllclk2), .O(tx0_pclkx2));

  //
  // regenerate pclkx10 for TX
  //
  wire tx0_bufpll_lock;
  BUFPLL #(.DIVIDE(5)) tx0_ioclk_buf (.PLLIN(tx0_pllclk0), .GCLK(tx0_pclkx2), .LOCKED(tx0_plllckd),
           .IOCLK(tx0_pclkx10), .SERDESSTROBE(tx0_serdesstrobe), .LOCK(tx0_bufpll_lock));

  assign tx0_reset = ~tx0_bufpll_lock;
  
  /*************** add a new PLL_BASE ********************
                   after removing the PLL IP in i2c_master.v ************************/
	/*PLL_BASE # (
    .CLKIN_PERIOD(10),
    .CLKFBOUT_MULT(10),
    .CLKOUT0_DIVIDE(1),
    .CLKOUT1_DIVIDE(10),
    .CLKOUT2_DIVIDE(5),
    .COMPENSATION("INTERNAL")
  ) PLL_ISERDES (
    .CLKFBOUT(new_clkfbout),
    .CLKOUT0(new_pllclk0),
    .CLKOUT1(new_pllclk1),
    .CLKOUT2(new_pllclk2),
    .CLKOUT3(),
    .CLKOUT4(),
    .CLKOUT5(),
    .LOCKED(new_plllckd),
    .CLKFBIN(new_clkfbout),
    .CLKIN(clkext),
    .RST(0)
  );
  BUFG new_pclk_buf(.I(new_pllclk1), .O(new_pclk));
  BUFG new_pclkx2_buf(.I(new_pllclk2), .O(new_pclkx2));
  BUFPLL #(.DIVIDE(5)) new_ioclk_buf (
									.PLLIN(new_pllclk0),
									.GCLK(new_pclkx2),
									.LOCKED(new_plllckd),
									.IOCLK(new_pclkx10),
									.SERDESSTROBE(new_serdesstrobe),
									.LOCK(new_bufpll_lock)
									);*/
  /*************** end of new PLL_BASE (not work, too many PLL_ADVs)*******************/

  dvi_encoder_top dvi_tx0 (
    .pclk        (tx0_pclk),
    .pclkx2      (tx0_pclkx2),
    .pclkx10     (tx0_pclkx10),
    .serdesstrobe(tx0_serdesstrobe),
    .rstin       (tx0_reset),
    .blue_din    (tx0_blue),
    .green_din   (tx0_green),
    .red_din     (tx0_red),
    .hsync       (tx0_hsync),
    .vsync       (tx0_vsync),
    .de          (tx0_de),
    .TMDS        (TX0_TMDS),
    .TMDSB       (TX0_TMDSB),
	 
	 .sl_rgb		  ({8'h00, hdata, 8'h00}),
	 .enable_sel  (rMSW),
	 
	 .extc_30b	  (sl_extc),
	 .sl_extc	  ({8'h00, 8'hee, 8'h00}),
	 .mode_sel	  (rMODE)
	 );
	/* Add some logic that replaces the tx0_blue, tx0_green, tx0_red with 3 MUX */
  
`endif

  //////////////////////////////////////
  // Status LED
  //////////////////////////////////////
  reg [31:0] crx0 = 0;
  reg [31:0] cpll = 0;
  reg [31:0] cpll25 = 0;
  reg [31:0] ctmds = 0;
  /*always@(posedge CLK_EXT)
		crx0 = crx0 + 1;
  always@(posedge tx0_pllclk0)
	   cpll = cpll + 1;
  always@(posedge tx0_pclkx2)
	   cpll25 = cpll25 + 1;
  always@(posedge rx0_tmdsclk)
      ctmds = ctmds + 1;*/
		
  //assign LED[7:0] = {2'b00, MSW, crx0[15], cpll[5], cpll25[23], ctmds[24], rx0_psalgnerr};
  assign LED = {trig_synco1, sync_out_1, sync_in_1, sync_out_2, sync_in_2, lcntr[25], rMODE};
  
//******************* Below is the Structured Light output ***************************
wire sync_hs, sync_vs, de;
wire [7:0] cosd3;
wire [31:0] phase_i, phase_o;

wire [7:0] ired, igreen, iblue;
wire [7:0] pdata, vdata;
wire V_polarity, H_polarity;

reg [31:0] px_cntr = 0;
reg [7:0] pixelr_1st = 0;
reg [7:0] pixelg_1st = 0;
reg [7:0] pixelb_1st = 0;

/*******************************************************************************
After I observe the waveforms of rx0_hsync, rx0_vsync, rx0_de, I discovered that
when active pixels are being sent, rx0_hsync is logic low (0), rx0_de is logic
high (1), rx0_vsync is logic low (0). That's the polarities of them.
rx0_hsync -> negative;
rx0_vsync -> negative;
rx0_de    -> positive;
*******************************************************************************/
assign sync_hs = (H_polarity == 1'b1) ? rx0_hsync : ~rx0_hsync;
assign de = rx0_de;
//assign sync_vs = (rMODE==2'b01) ? ~rx0_vsync : ~rx0_vsync;
assign sync_vs = (V_polarity == 1'b1) ? rx0_vsync : ~rx0_vsync;
//******* the 4 lines of code above have been tested to be working ************
//************************* Use "ENABLE" bit to switch ************************
reg [15:0] frame1 = 0;
wire [31:0] phout;
always@(posedge rx0_pllclk1)
begin
		if(sync_vs)
			rMSW = sync_in_1;
		else
			rMSW = rMSW;
end

hdmi_sl  HDMI1_PC_CLK(
					.clock_pixel			(rx0_pllclk1),
					.clock_TMDS				(rx0_pllclk0),
					.iRed						(8'h00),
					.iGreen					(hdata),
					.iBlue					(8'h00),
									
					.SYNC_H					(sync_hs),
					.SYNC_V					(sync_vs),
					.DE						(de),
					
					.oRequest				(/*rstb*/),				//signal to reset the DDS
					.tmdso					(),
					.tmds_30b				()
);

ddsc UP_DOWN(
			.clk				(sync_hs),
			.sclr				(~sync_vs),
			
			.pinc_in			(phase_i),
			.poff_in			(phase_o),
			.cosine			(),
			.phase_out		(phout)
);
/*ddsc LEFT_RIGHT(
			.clk				(rx0_pllclk1),
			.sclr				(sync_hs),
			
			.pinc_in			(phase_i),
			.poff_in			(phase_o),
			.cosine			(),
			.phase_out		()
);*/
assign pdata = lut[phout[31:22]];//lut[pout[15:6]];
assign vdata = lut[pvout[15:6]];
assign hdata = ((frame1 < 28) || (frame1 >= 65535)) ? pdata : vdata;
/*always@(posedge rx0_pllclk1)
begin
		if(!cosd3[7])
				pdata = cosd3 + 128;
		else
				pdata = cosd3[6:0];
end*/
//************************* Record the 1st pixel in a frame *************************
reg new_data = 0;
always@(posedge rx0_pllclk1)
begin
		if(!sync_vs)
			px_cntr <= 0;
		else
		begin
			if(de)
				px_cntr <= px_cntr + 1;
			else
				px_cntr <= px_cntr;
		end
end

always@(posedge rx0_pllclk1)				//negedge: 800*600; posedge: 854*480 
begin
	if(px_cntr==0)								//1 or 2 does not work, as long as >= 3, all good
													//Condition: Dell 24' EDID, Windows7 PC, 800x600 resolution
													
													//1st pixel is px_cntr==2, Condition: Optoma EDID, Dell laptop Windows10, 1280x800 resolution. GREAT.
	begin
		if(de) begin
			pixelr_1st <= rx0_red;
			pixelg_1st <= rx0_green;
			pixelb_1st <= rx0_blue;
			new_data  <= 0;
		end
		else begin
			pixelr_1st <= pixelr_1st;
			pixelg_1st <= pixelg_1st;
			pixelb_1st <= pixelb_1st;
			new_data  <= 0;
		end
	end
	else if(px_cntr<3)
		new_data <= 1;
	else begin
		pixelr_1st <= pixelr_1st;
		pixelg_1st <= pixelg_1st;
		pixelb_1st <= pixelb_1st;
		new_data  <= 0;
	end
end

reg [29:0] lcntr = 0;
always@(posedge tx0_pclk)
	lcntr = lcntr + 1;
	
assign test_pin = {rx0_hsync, rx0_vsync};
//************ Serial Port used to return the 1st pixel value to PC ******************
wire [1:0] state;
wire [7:0] ir, jr, kr;
wire [7:0] ig, jg, kg;
wire [7:0] ib, jb, kb;

reg update = 0;
reg [3:0] n = 0;
reg [7:0] tdata [0:4];
initial begin
//NEW LINE: 8'h0a, CATRIAGE: 8'h0d, SPACE: 8'h20
tdata[0] = 8'h30;
tdata[1] = 8'h30;
tdata[2] = 8'h30;
tdata[3] = 8'h0a;
tdata[4] = 8'h0d;
end

assign ir = pixelr_1st/100;
assign jr = pixelr_1st%100/10;
assign kr = pixelr_1st%10;

assign ig = pixelg_1st/100;
assign jg = pixelg_1st%100/10;
assign kg = pixelg_1st%10;

assign ib = pixelb_1st/100;
assign jb = pixelb_1st%100/10;
assign kb = pixelb_1st%10;
/* This part was for the minispartan6+ board, not for Mojo(removed) */
/* Mojo board UART */
wire tx_busy;
wire new_spi;
wire [7:0] rx_spi;

reg new_tx_data = 0;
reg [9:0] m = 0;

avr_interface#(.CLK_RATE(50000000), .SERIAL_BAUD_RATE(500000))
INSTANTIATION1(
				 .clk								(CLOCK100),
				 .rst								(~RST_N),			 
				 .cclk							(CCLK),
				 
				 // AVR SPI Signals
				 .spi_miso						(SPI_MISO),
				 .spi_mosi						(SPI_MOSI),
				 .spi_sck						(SPI_SCK),
				 .spi_ss							(SPI_SS),
				 .spi_channel					(),
				 
				 // AVR Serial Signals
				 .tx								(UART_TX),
				 .rx								(UART_RX),
				 
				 // ADC Interface Signals
				 .channel						(),
				 .new_sample					(new_spi),
				 .sample							(),
				 .sample_channel				(),
				 
				 .spi_rcv						(rx_spi),
				 
				 // Serial TX User Interface
				 .tx_data						(tdata[n]),
				 .new_tx_data					(new_tx_data),			//trig the transmission of a new byte
				 .tx_busy						(tx_busy),				//1: being transmitting; 0: IDLE
				 .tx_block						(1'b1),
				 
				 // Serial Rx User Interface
				 .rx_data						(),
				 .new_rx_data					()							//indicate that just received a new byte

);

/*** SPI receiver used to load the LUT of the projector ***/
/*always@(posedge new_spi)
begin
	lut[m]  = rx_spi;
	m = m + 1;
end*/
/**********************************************************/
always@(posedge new_data or posedge new_tx_data)
begin
	if(new_data)
		n = 0;
	else
	begin
		if(n<=4)
			n = n + 1;
		else
			n = n;
	end
end

always@(posedge CLOCK100)
begin
	if(/*AVR_RX_BUSY | */tx_busy == 1) //the UART works well without the involvement of the AVR_RX_BUSY
		new_tx_data = 0;
	else if(n<=4)
		new_tx_data = 1;
	else
		new_tx_data = 0;
end
/*** End of UART ***/
always@(posedge clk100)
begin
		tdata[0] <= 48 + ir;
		tdata[1] <= 48 + jr;
		tdata[2] <= 48 + kr;
end
//************************************************************************************


//************ Logic for synchronization with the Prosilica camera *******************
//************ Ported from the project "twohdmi" that is on the XPS ******************
/************* 1. determine the polarities of H_SYNC & V_SYNC ********************/
reg [15:0] row_cntr   = 0;
reg [15:0] row_cntr_i = 0;
reg [15:0] row_cntr_H = 0;
reg [15:0] row_cntr_L = 0;

reg [15:0] column_cntr   = 0;
reg [15:0] column_cntr_i = 0;
reg [15:0] column_cntr_H = 0;
reg [15:0] column_cntr_L = 0;

always@(posedge rx0_hsync)
begin
	if(rx0_vsync)
		row_cntr = row_cntr + 1;
	else
		row_cntr = 0;
end
always@(negedge rx0_vsync)
	row_cntr_H = row_cntr;
always@(posedge rx0_hsync)
begin
	if(!rx0_vsync)
		row_cntr_i = row_cntr_i + 1;
	else
		row_cntr_i = 0;
end
always@(posedge rx0_vsync)
	row_cntr_L = row_cntr_i;
assign V_polarity = (row_cntr_H > row_cntr_L) ? 1'b1 : 1'b0;

always@(posedge rx0_pllclk1)
begin
	if(rx0_hsync)
		column_cntr = column_cntr + 1;
	else
		column_cntr = 0;
end
always@(negedge rx0_hsync)
	column_cntr_H = column_cntr;
always@(posedge rx0_pllclk1)
begin
	if(!rx0_hsync)
		column_cntr_i = column_cntr_i + 1;
	else
		column_cntr_i = 0;
end
always@(posedge rx0_hsync)
	column_cntr_L = column_cntr_i;
assign H_polarity = (column_cntr_H > column_cntr_L) ? 1'b1 : 1'b0;
/************************* 2. for PC topleft pixel *******************************/
wire sync1;

reg [7:0] last_pixel = 0;
reg trig_synco1 = 0;
reg trig_synco2 = 0;
reg sync_out_1pc, sync_out_2pc;

always@(posedge new_data)
begin
		last_pixel <= pixelr_1st;
		if(pixelr_1st != last_pixel)
		begin
			trig_synco1 <= 1;
		   if(pixelr_1st==8'h00)
				trig_synco2 <= 1;
			else
				trig_synco2 <= 0;
		end
		else begin
			trig_synco1 <= 0;
			if(pixelr_1st==8'h00)
				trig_synco2 <= 1;
			else
				trig_synco2 <= 0;
		end
end
always@(negedge sync_vs)				//negedge rx0_vsync
begin
	case ({trig_synco1, trig_synco2})
		2'b00: begin sync_out_1pc <= 0; sync_out_2pc <= 0; end
		2'b01: begin sync_out_1pc <= 0; sync_out_2pc <= 1; end
		2'b10: begin sync_out_1pc <= sync_vs; sync_out_2pc <= 0; end
		2'b11: begin sync_out_1pc <= sync_vs; sync_out_2pc <= 1; end
	endcase
end
/******* 3. for structured light (including both clock from PC and external oscillator)*******/
reg sync_out_2r = 0;
reg [1:0] delay_st = 2'b11;
reg stch = 0;
reg projector = 0;
reg [7:0] co_K;
reg [7:0] co_n;
reg [31:0] phase_incH, phase_incV, phase_incE, poff_H, poff_V, poff_E;
reg [31:0] phase_off_8 = 0;
reg [31:0] pout_m = 0; 
reg [31:0] pvout_m = 0;

reg tg = 0;
reg [15:0] frc = 0;
wire ret, re; 
//reg onc = 0;
wire sync_out_1slr;

wire SYNC_VS;
wire sync_out_1sl, sync_out_2sl;

always@(frame1)
begin
	if(frame1 % 8 == 1)
			sync_out_2r = 1'b1;
	else
			sync_out_2r = 1'b0;
end
assign sync_out_2sl = sync_out_2r;

assign SYNC_VS = (rMODE==2'b00) ? po_vsync : sync_vs;								//need to add a MUX if it is from external oscillator
always@(negedge SYNC_VS or negedge sync_in_1)
begin
	if(!sync_in_1)
		begin
			stch = 0;
			delay_st = 2'b11;
		end
	else if(!sync_in_2)
		begin
			stch = 0;
			delay_st = 2'b10;
		end
	else
	begin
		if(delay_st == 2'b11)
			begin
				delay_st = 2'b01;
				stch = 0;
			end
		else if(delay_st == 2'b10)
			begin
				delay_st =2'b00;
				if(frame1==65535)
					stch = 0;
				else
					stch = 1;
			end
		else if(delay_st == 2'b01)
			begin
				delay_st =2'b00;
				stch = 1;
			end
		else
			begin
				delay_st =2'b00;
				stch = 1;
			end
	end
end

edgedtct FRAME_TRIGGER_WAIT(
				.clk		(CLK_40M),
				.signl	(sync_in_2),
				.re		(re)
);
edgedtct CAMERA_TRIG(
				.clk		(CLK_40M),
				.signl	(sync_out_1sl),
				.re		(ret)
);
always@(posedge CLK_40M or negedge sync_in_1)
begin
	if(!sync_in_1)
		tg = sync_in_2;
	else if(re)
		tg = 1;
	else if(ret)
		tg = 0;
end
assign sync_out_1sl = (stch == 1'b1) ? SYNC_VS : 0;

reg stchp = 0;
reg [1:0] delay_stp = 2'b11;
always@(negedge SYNC_VS or negedge sync_in_1)
begin
	if(!sync_in_1)
		begin
			stchp = 0;
			delay_stp = 2'b11;
		end
	else if(!tg)
		begin
			stchp = 0;
			delay_stp = 2'b10;
		end
	else
	begin
		if(delay_stp == 2'b11)
			begin
				delay_stp = 2'b01;
				stchp = 0;
			end
		else if(delay_stp == 2'b10)
			begin
				delay_stp = 2'b00;
				if(frame1==65535)
					stchp = 0;
				else
					stchp = 1;
			end
		else if(delay_stp == 2'b01)
			begin
				delay_stp = 2'b00;
				stchp = 1;
			end
		else begin
			delay_stp = 2'b00;
			stchp = 1;
		end
	end
end
assign sync_out_1slr = (stchp==1'b1) ? SYNC_VS : 0;
/* Adjusted phase range to get rid of bending effects, modified on Aug. 13th, 
         refer to the email on 8/13/2018 titled "horizontal patterns" from Dr. Lau */
`ifdef TIDLP
//H_increment: 6826.66, V_increment: 6826.66 ^^^ R: [0, 480] [0, 480] ^^^ C: [0,960], [53, 907]
parameter PHASE_OFFSET08H = 32'd0;	         parameter PHASE_OFFSET18H = 32'd536870912;
parameter PHASE_OFFSET28H = 32'd1073741824;  parameter PHASE_OFFSET38H = 32'd1610612736;
parameter PHASE_OFFSET48H = 32'd2147483648;  parameter PHASE_OFFSET58H = 32'd2684354560;
parameter PHASE_OFFSET68H = 32'd3221225472;  parameter PHASE_OFFSET78H = 32'd3758096384;

parameter PHASE_OFFSET08V = 16'd3618;	 parameter PHASE_OFFSET18V = 16'd10906;
parameter PHASE_OFFSET28V = 16'd18193;  parameter PHASE_OFFSET38V = 16'd25481;
parameter PHASE_OFFSET48V = 16'd32768;  parameter PHASE_OFFSET58V = 16'd40055;
parameter PHASE_OFFSET68V = 16'd47343;  parameter PHASE_OFFSET78V = 16'd54630;

parameter PHASE_INC_H1  = 32'd8947849;     	parameter PHASE_INC_V1  = 16'd68;
parameter PHASE_INC_H6  = 32'd53687091;		parameter PHASE_INC_V6  = 16'd410;
parameter PHASE_INC_H30 = 32'd268435456;		parameter PHASE_INC_V30 = 16'd2048;

`else		//800*600
//H_increment: 6826.66, V_increment: 6826.66 ^^^ R: [0,720] [60, 660] ^^^ C: [0,960], [80, 880]
parameter PHASE_OFFSET08H = 16'd5461;	 parameter PHASE_OFFSET18H = 16'd12288;
parameter PHASE_OFFSET28H = 16'd19115;  parameter PHASE_OFFSET38H = 16'd25941;
parameter PHASE_OFFSET48H = 16'd32768;  parameter PHASE_OFFSET58H = 16'd39595;
parameter PHASE_OFFSET68H = 16'd46421;  parameter PHASE_OFFSET78H = 16'd53248;

parameter PHASE_OFFSET08V = 16'd5461;	 parameter PHASE_OFFSET18V = 16'd12288;
parameter PHASE_OFFSET28V = 16'd19115;  parameter PHASE_OFFSET38V = 16'd25941;
parameter PHASE_OFFSET48V = 16'd32768;  parameter PHASE_OFFSET58V = 16'd39595;
parameter PHASE_OFFSET68V = 16'd46421;  parameter PHASE_OFFSET78V = 16'd53248;

parameter PHASE_INC_H1  = 16'd91;       parameter PHASE_INC_V1  = 16'd68;
parameter PHASE_INC_H6  = 16'd546;		 parameter PHASE_INC_V6  = 16'd410;
parameter PHASE_INC_H30 = 16'd2731;		 parameter PHASE_INC_V30 = 16'd2048;
`endif

always@(frame1)
begin
		case(co_n)
			0: begin poff_H <= PHASE_OFFSET08H;		poff_V <= PHASE_OFFSET08V; poff_E <= 16'd0; end
			1:	begin poff_H <= PHASE_OFFSET18H;		poff_V <= PHASE_OFFSET18V; poff_E <= 16'd8192; end
			2: begin poff_H <= PHASE_OFFSET28H;		poff_V <= PHASE_OFFSET28V; poff_E <= 16'd16384; end
			3: begin poff_H <= PHASE_OFFSET38H;		poff_V <= PHASE_OFFSET38V; poff_E <= 16'd24576; end
			4: begin poff_H <= PHASE_OFFSET48H;		poff_V <= PHASE_OFFSET48V; poff_E <= 16'd32768; end
			5: begin poff_H <= PHASE_OFFSET58H;		poff_V <= PHASE_OFFSET58V; poff_E <= 16'd40960; end
			6: begin poff_H <= PHASE_OFFSET68H;		poff_V <= PHASE_OFFSET68V; poff_E <= 16'd49152; end
			7: begin poff_H <= PHASE_OFFSET78H;		poff_V <= PHASE_OFFSET78V; poff_E <= 16'd57344; end
			default: begin poff_H <= 16'd0;	poff_V <= 16'd0; end
		endcase
end

always@(frame1)
begin
   if(frame1 < 28)
   begin
		co_n <= frame1 % 8;
		co_K <= (frame1 / 8) + 1;
	end
	else if(frame1 >= 65535)
	begin
		co_n <= 0;
		co_K <= 1;
	end
	else
	begin
		co_n <= (frame1 - 28) % 8;
		co_K <= ((frame1 - 28) / 8) + 1;
	end
end


always@(frame1)
begin
		case(co_K)
		  1: begin phase_incH <= PHASE_INC_H1; 		phase_incV <= PHASE_INC_V1;  phase_incE <= 16'd136; end
		  2: begin phase_incH <= PHASE_INC_H6; 		phase_incV <= PHASE_INC_V6;  phase_incE <= 16'd819; end
		  3: begin phase_incH <= PHASE_INC_H30;		phase_incV <= PHASE_INC_V30; phase_incE <= 16'd4096; end
		  default: begin phase_incH <= 16'd0;	phase_incV <= 16'd0; end
		endcase
end
assign phase_i = ((frame1 < 24) || (frame1 >= 65535)) ? phase_incH : (((frame1 > 27) && (frame1 < 52)) ? phase_incV : 16'd0);
assign phase_o = ((frame1 < 24) || (frame1 >= 65535)) ? poff_H : (((frame1 > 27) && (frame1 < 52)) ? poff_V : phase_off_8);

always@(frame1)
begin
		if((frame1==25)||(frame1==27)||(frame1==53)||(frame1==55))
				phase_off_8 <= 32'd2147483648;
		else if((frame1==24)||(frame1==26)||(frame1==52)||(frame1==54))
				phase_off_8 <= 32'd0;
		else
				phase_off_8 <= 32'd0;
end

always@(posedge sync_hs or negedge sync_vs)				//horizontal stripes
begin
	if(!sync_vs)
		pout_m = phase_o;
	else
	begin
		pout_m = pout_m + phase_i;
	end
end
always@(posedge rx0_pllclk1 or negedge sync_hs)		//vertical stripes
begin
	if(!sync_hs)
		pvout_m = phase_o;
	else
	begin
		pvout_m = pvout_m + phase_i;
	end
end
assign pout  = pout_m[15:0];
assign pvout = pvout_m[15:0];
//***************************************************************************************************	 

always@(posedge CLK_40M)
begin
	if(!sync_in_1)
		frc = 0;
	else if(ret)
		frc = frc + 1;
	else
		frc = frc;
end
always@(negedge SYNC_VS or negedge sync_in_1)
begin
	if(!sync_in_1)
		frame1 = 65535;
	else if(!sync_in_2)				//!tg
	begin
		if(frame1==65535)
			frame1 = 65535;
		else
			frame1 = frame1;
	end
	else
	begin
		if(frame1==65535)
			frame1 = 0;
		else
			frame1 = frc + 1;
	end
end
/************* conbine the output 4 wires between FPGA and camera ***********/
assign sync_out_1 = (sync_in_1==1) ? sync_out_1slr : sync_out_1pc;
assign sync_out_2 = (sync_in_1==1) ? sync_out_2sl : sync_out_2pc;

assign sync_out_1B2 = rx0_vsync;
assign sync_out_2B2 = (sync_in_1B2==1) ? sync_out_2 : ((sync_in_2B2==1) ? 1 : 0);
/************************ 5. watchdog timer that is 
									  used to determine the clock source *************/
reg [31:0] wdt_timer = 0;
reg rcs = 0;
reg [7:0] fc = 0;

always@(posedge clk100)
begin
	if(wdt_timer < 50000000)			//if no clock in 1 second, reset
	begin
		wdt_timer <= wdt_timer + 1;
		rcs       <= 0;
	end
	else
	begin
		wdt_timer <= 0;
		rcs       <= 1;
	end
end
always@(posedge sync_vs or posedge rcs)
begin
	if(rcs == 1)
		fc = 0;
	else
		fc = fc + 1;
end
always@(posedge clk100)
begin
	if(wdt_timer == 49999990)
	begin
		if(fc > 100) begin
			oMODE = rMODE;
			rMODE = 2'b10;		//120Hz clock from PC
		end
		else if(fc < 10) begin
			oMODE = rMODE;
			rMODE = 2'b00;		//disconnected from PC, apply programmable oscillator
		end
		else begin
			oMODE = rMODE;
			rMODE = 2'b01;		//60Hz clock from PC
		end
	end
	else
		rMODE = rMODE;
end
/***** 6. structured light patterns generated from external programmable oscillator *****/
wire goo;
wire [7:0] cosd3e;
wire [7:0] hdata_e;
wire [15:0] pout_meh;
wire pll_locked, wlock;
wire [15:0] phase_ie, phase_oe;

reg [7:0] zdata = 0;
reg [31:0] pout_me = 0;

i2c_master	PROGRAMMABLE_OSC(
								.CLOCK_IN				(CLOCK100),
								.CLOCK_OUT1				(CLK_40M),				//40Mhz clock
					
								.SCL						(PO_SCL),
								.SDA						(PO_SDA),
					
								.DDS_START				(dds_start),
								.wLED						()
);
/************** Bypassed by LUT ****************/
ddsc BOTTOM_UP(
			.clk				(po_hsync),
			.sclr				((!dds_start) || (!goo)),
			
			.pinc_in			(phase_i),
			.poff_in			(phase_o),
			.cosine			(cosd3e),
			.phase_out		()
);
/**********************************************/
always@(posedge clkext)
begin
		if(!cosd3e[7])
				zdata = cosd3e + 128;
		else
				zdata = cosd3e[6:0];
end

always@(posedge po_hsync or negedge po_vsync)				//horizontal stripes
begin
	if(!po_vsync)
		pout_me = phase_oe;
	else
		pout_me = pout_me + phase_ie;
end
assign pout_meh = pout_me[15:0];
assign hdata_e = lut[pout_meh[15:6]];

assign phase_ie = ((frame1 < 24) || ((frame1 > 27) && (frame1 < 52))) ? phase_incE : 16'd0;
assign phase_oe = ((frame1 < 24) || ((frame1 > 27) && (frame1 < 52))) ? poff_E : phase_off_8;

hdmi_top HDMI1_EXT_CLK(
					.clock_pixel			(tx0_pclk),
					.clock_TMDS				(tx0_pclkx10),
					.HDMI_START				(dds_start),
					
					.iRed						(8'h00),
					.iGreen					(hdata_e),				//zdata
					.iBlue					(8'h00),
					
					.oRequest				(goo),
					.SYNC_H					(po_hsync),
					.SYNC_V					(po_vsync),
					.DE						(po_de),
					
					.tmds_30b				(sl_extc),
					.LED						()
);
endmodule