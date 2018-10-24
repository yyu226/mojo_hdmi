`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
//////////////////////////////////////////////////////////////////////////////////
module hdmi_sl(
					clock_pixel,
					clock_TMDS,
					iRed,
					iGreen,
					iBlue,
					
					SYNC_H,
					SYNC_V,
					DE,
					
					oRequest,
					tmdso,
					tmds_30b
    );
	 
`ifdef RESO854
	parameter HAPIX = 11'd854;
`else
	parameter HAPIX = 11'd800;
`endif	 
//********** VGA para of 800*600 **********
	 /*parameter HAPIX = 11'd800;
	 parameter HFPOR = 11'd40;
	 parameter HSPUL = 11'd128;
	 parameter HBPOR = 11'd88;
	 
	 parameter VAPIX = 11'd600;
	 parameter VFPOR = 11'd1;
	 parameter VSPUL = 11'd4;
	 parameter VBPOR = 11'd23;*/
	 
//*********** 800*600@120 *********
	 /*parameter HAPIX = 11'd800;
	 parameter HFPOR = 11'd48;
	 parameter HSPUL = 11'd32;
	 parameter HBPOR = 11'd80;
	 
	 parameter VAPIX = 11'd600;
	 parameter VFPOR = 11'd3;
	 parameter VSPUL = 11'd4;
	 parameter VBPOR = 11'd29;*/

//******** I\O List **********
input clock_pixel;
input clock_TMDS;
input [7:0] iRed;
input [7:0] iGreen;
input [7:0] iBlue;

input SYNC_H;
input SYNC_V;
input DE;

output oRequest;
output [2:0]  tmdso;
output [29:0] tmds_30b;
//output TMDSp_clock, TMDSn_clock;
//***** Reg List *****
reg [10:0] contX, contY;

reg [3:0] TMDS_modulo;
reg shift_LOAD;
reg [9:0] TMDS_shift_red, TMDS_shift_green, TMDS_shift_blue;
//***** Wire List *****
wire [9:0] TMDS_red, TMDS_green, TMDS_blue;
wire actvA;

initial
begin
		contX <= 0;
		contY <= 0;
		
		TMDS_modulo <= 0;
		shift_LOAD <= 0;
		TMDS_shift_red <= 0;
		TMDS_shift_green <= 0;
		TMDS_shift_blue <= 0;
end

//*****###################### RTL code ######################*****
always@(negedge clock_pixel)
begin
		if(!DE)
			contX = 0;
		else
			contX = contX + 1;
end
assign actvA = ((contX<=HAPIX)&&(contX>0)) ? 1 : 0;
//assign actvA = DE;
always@(posedge DE or negedge SYNC_V)
begin
	if(!SYNC_V)
		contY = 0;
	else
		contY = contY + 1;
end

assign oRequest = (contY > 0) ? 1 : 0;

assign syncH = ~SYNC_H;
assign syncV = ~SYNC_V;

//************* Test Pattern 1 ******************
assign red = {contX[5:0] & {6{contY[4:3] == ~contX[4:3]}}, 2'b00};
assign green = contX[7:0] & {8{contY[6]}};
assign blue = contY[7:0];
//************* Test Pattern 2 ******************
/*assign W = {8{contX[7:0]==contY[7:0]}};
assign A = {8{contX[7:5]==3'h2 && contY[7:5]==3'h2}};

always @(posedge clock_pixel) red <= ({contX[5:0] & {6{contY[4:3]==~contX[4:3]}}, 2'b00} | W) & ~A;
always @(posedge clock_pixel) green <= (contX[7:0] & {8{contY[6]}} | W) & ~A;
always @(posedge clock_pixel) blue <= contY[7:0] | W | A;*/
//***********************************************



TMDS_encoder  iRED  (.clk(clock_pixel), .VD(iRed),    .CD(2'b00), 		   .VDE(actvA), .TMDS(TMDS_red));
TMDS_encoder  iGREEN(.clk(clock_pixel), .VD(iGreen),  .CD(2'b00), 			.VDE(actvA), .TMDS(TMDS_green));
TMDS_encoder  iBLUE (.clk(clock_pixel), .VD(iBlue),   .CD({syncV, syncH}), .VDE(actvA), .TMDS(TMDS_blue));

always@(posedge clock_TMDS)
begin
		TMDS_shift_red   <= shift_LOAD ? TMDS_red   : TMDS_shift_red[9:1];
		TMDS_shift_green <= shift_LOAD ? TMDS_green : TMDS_shift_green[9:1];
		TMDS_shift_blue  <= shift_LOAD ? TMDS_blue  : TMDS_shift_blue[9:1];
		
		TMDS_modulo <= (TMDS_modulo == 9) ? 4'd0 : TMDS_modulo + 1;
end
always@(posedge clock_TMDS)
		shift_LOAD <= (TMDS_modulo == 9);
//*********** Differential Output ***************
assign tmdso = {TMDS_shift_red[0], TMDS_shift_green[0], TMDS_shift_blue[0]};
assign tmds_30b = {TMDS_red[9:5], TMDS_green[9:5], TMDS_blue[9:5],
						 TMDS_red[4:0], TMDS_green[4:0], TMDS_blue[4:0]};
/*OBUFDS mRED  (.I(TMDS_shift_red[0]),   .O(tmds_sl_p[2]), .OB(tmds_sl_n[2]));
OBUFDS mGREEN(.I(TMDS_shift_green[0]), .O(tmds_sl_p[1]), .OB(tmds_sl_n[1]));
OBUFDS mBLUE (.I(TMDS_shift_blue[0]),  .O(tmds_sl_p[0]), .OB(tmds_sl_n[0]));
OBUFDS mCLOCK(.I(clock_pixel), .O(tmds_sl_p[3]), .OB(tmds_sl_n[3]));*/
endmodule
