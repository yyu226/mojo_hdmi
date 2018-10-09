`timescale 1ns / 1ps
`define FWVGA 
module i2c_master(
					input CLOCK_IN,
					output CLOCK_OUT1,
					
					output SCL,
					inout  SDA,
					
					output reg DDS_START,
					output [7:0] wLED
    );

/************ Parameters List ******************************/
`ifdef FWVGA
parameter REG_N1  = 8'h00;
parameter REG_N2  = 8'h23;
parameter REG_N3  = 8'hb0;
parameter REG_N4  = 8'h0b;
parameter REG_N5  = 8'h89;
parameter REG_N6  = 8'h58;
parameter REG_N7  = 8'h08;
parameter REG_N8  = 8'h44;
parameter REG_N9  = 8'h00;
parameter REG_N10 = 8'h01;
parameter REG_N11 = 8'h04;
`else //800*600@120hz 73.25Mhz
parameter REG_N1  = 8'h00;
parameter REG_N2  = 8'h33;
parameter REG_N3  = 8'he4;
parameter REG_N4  = 8'hd1;
parameter REG_N5  = 8'hdf;
parameter REG_N6  = 8'h96;
parameter REG_N7  = 8'h08;
parameter REG_N8  = 8'h1e;
parameter REG_N9  = 8'h00;
parameter REG_N10 = 8'h01;
parameter REG_N11 = 8'h04;
`endif
parameter STAND_BY = 0;
parameter START_C  = 1;
parameter SLV_ADDR = 2;
parameter REG_ADDR = 3;
parameter REG_DATA = 4;
parameter STOP_C1  = 5;
parameter STOP_C2  = 6;
parameter NOT_ACK  = 7;								//it does happen, sometimes the programmable oscillator returens NACK 
parameter UW_STOP1 = 8;
parameter UW_STOP2 = 9;
/************ Wire and Register declearation ***************/
wire clk_40m, clk_100m;

reg START;

reg clk_400k;
reg sda_oe;
reg rsda, rscl;
reg [5:0] divc;
reg [3:0] kSLV, kREG, kDATA;

reg [7:0] aslave;
reg [7:0] areg, dreg;
reg [3:0] state, next;

reg [3:0] rLED;
reg [7:0] toc;

reg [31:0] delay_cntr;
/****************** Logic Description ********************/
initial
begin
		clk_400k <= 0;
		
		START <= 0;
		
		divc 	 <= 0;
		sda_oe <= 0;
		rsda   <= 0;
		rscl   <= 0;
		
		state <= 0;
		next  <= 0;
		kSLV  <= 0;
		kREG  <= 0;
		kDATA <= 0;
		
		areg  <= 0;
		dreg  <= 0;
		
		aslave <= 8'b10101010;				//{7'h55, 1'b0}
		areg   <= 0;
		dreg   <= 0;
		rLED   <= 0;
		toc    <= 0;
		delay_cntr <= 0;
end


assign wLED[7:4] = toc;
assign wLED[3:0] = rLED[3:0];

assign SDA = (sda_oe==1) ? rsda : 1'bZ;
assign SCL = ((state==STAND_BY)|(state==START_C)|(state==STOP_C2)|(state==UW_STOP2)) ? rscl : (((state==SLV_ADDR)&(kSLV==0)) ? 0 : clk_400k);

dcm PIXEL_CLOCK(
			.CLK_IN1				(CLOCK_IN),
			.CLK_OUT1			(clk_40m),
			.CLK_OUT2			(clk_100m)
);

assign CLOCK_OUT1 = clk_100m;

always@(posedge clk_40m)
begin
		if(divc==49)
		begin
			divc <= 0;
			clk_400k <= ~clk_400k;
		end
		else
			divc <= divc + 1;
end

always@(posedge clk_40m)				//{70000000, 180000000}(28 frames), {90000000, 250000000}(56 frames vertical and horizontal)
												//{80000000, 201000000}(8 frames, dual-projector dual-frequency) ALL these based on clk_40m
begin
		if(delay_cntr < 90000000)							//the power on delay MUST be such long 60000000
		begin
			delay_cntr <= delay_cntr + 1;
			START <= 0;
			DDS_START <= 0;
		end
		else if(delay_cntr < 240000000)
		begin
			delay_cntr <= delay_cntr + 1;
			START <= 1;
			DDS_START <= 0;
		end
		else
		begin
			delay_cntr <= delay_cntr;
			START <= 1;
			DDS_START <= 1;
		end
end

always@(negedge clk_400k)
begin
		case (state)
			STAND_BY: begin 
							 rscl   <= 1;
							 sda_oe <= 1;
							 rsda   <= 1;
							 case(toc)
								0: begin areg <= 8'h84; dreg <= REG_N1; end
								1: begin areg <= 8'h00; dreg <= REG_N2; end
								2: begin areg <= 8'h05; dreg <= REG_N3; end
								3: begin areg <= 8'h06; dreg <= REG_N4; end
								4: begin areg <= 8'h07; dreg <= REG_N5; end
								5: begin areg <= 8'h08; dreg <= REG_N6; end
								6: begin areg <= 8'h09; dreg <= REG_N7; end
								7: begin areg <= 8'h0a; dreg <= REG_N8; end
								8: begin areg <= 8'h0b; dreg <= REG_N9; end
								9: begin areg <= 8'h84; dreg <= REG_N10; end
							  10: begin areg <= 8'h84; dreg <= REG_N11; end
							  default: begin areg <= 8'h84; dreg <= 8'h04; end
							 endcase
						 end
			START_C : begin 
							 rscl   <= 1;
							 sda_oe <= 1;
							 rsda   <= 0;
						 end
			SLV_ADDR: begin 
							 rscl   <= 1;
							 rsda   <= aslave[7-kSLV];
							 rLED[3] <= 1;
							 if(kSLV<=7)
								sda_oe <= 1;
							 else
								sda_oe <= 0;
						 end
			REG_ADDR: begin
							 rscl   <= 1;
							 rsda   <= areg[7-kREG];
							 rLED[2] <= 1;
							 if(kREG<=7)
								sda_oe <= 1;
							 else
								sda_oe <= 0;
						 end
			REG_DATA: begin
							 rscl   <= 1;
							 rsda   <= dreg[7-kDATA];
							 rLED[1] <= 1;
							 if(kDATA<=7)
								sda_oe <= 1;
							 else
								sda_oe <= 0;
						 end
			STOP_C1 : begin
							 rscl   <= 1;
							 sda_oe <= 1;
							 rsda   <= 0;
							 rLED[0] <= 1;
						 end
			STOP_C2 : begin
							 rscl   <= 1;
							 sda_oe <= 1;
							 rsda   <= 1;
							 toc    <= toc + 1;							//number of registers have been configured, total of 11
						 end
						 
			NOT_ACK : begin
							 rscl   <= 1;
							 sda_oe <= 0;
							 rsda   <= 0;
						 end
			UW_STOP1: begin
							 rscl   <= 1;
							 sda_oe <= 1;
							 rsda   <= 0;
						 end
			UW_STOP2: begin
							 rscl   <= 1;
							 sda_oe <= 1;
							 rsda   <= 1;
						 end
			default : begin
							 rscl   <= 1;
							 sda_oe <= 1;
							 rsda   <= 1;
						 end
		endcase						
end

always@(posedge clk_400k)
begin
		if(state==STAND_BY)
		begin
				kSLV  <= 0;
				kREG  <= 0;
				kDATA <= 0;
		end
		else if(state==SLV_ADDR)
				kSLV <= kSLV + 1;
		else if(state==REG_ADDR)
				kREG <= kREG + 1;
		else if(state==REG_DATA)
				kDATA <= kDATA + 1;
end

always@(posedge clk_400k)
begin
		state <= next;
end

always@(*)
begin
		case (state)
			STAND_BY: begin
								if(START==0)
									next <= STAND_BY;
								else
								begin
									if(toc<11)
										next <= START_C;
									else
										next <= STAND_BY;
								end
						 end
			START_C : next <= SLV_ADDR;
			SLV_ADDR: begin
								if(kSLV<8)
									next <= SLV_ADDR;
								else
								begin
									if((SDA==0)&&(sda_oe==0))
										next <= REG_ADDR;
									else
										next <= NOT_ACK;
								end
						 end
			REG_ADDR: begin
								if(kREG<8)
									next <= REG_ADDR;
								else
								begin
									if((SDA==0)&&(sda_oe==0))
										next <= REG_DATA;
									else
										next <= NOT_ACK;
								end
						 end
			REG_DATA: begin
								if(kDATA<8)
									next <= REG_DATA;
								else
								begin
									if((SDA==0)&&(sda_oe==0))
										next <= STOP_C1;
									else
										next <= NOT_ACK;
								end
						 end
			STOP_C1 : next <= STOP_C2;
			STOP_C2 : next <= STAND_BY;
			
			NOT_ACK : next <= UW_STOP1;
			UW_STOP1: next <= UW_STOP2;
			UW_STOP2: next <= STAND_BY;
			default : next <= STAND_BY;
		endcase
end

endmodule
