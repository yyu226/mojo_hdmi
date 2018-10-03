`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Test the use of DDC-EDID emulator
//I2C device address 0x50
//Copy the EDID of the OPTOMA projector
//
//This version works, every PC or laptop detects it!
//////////////////////////////////////////////////////////////////////////////////
module edid_256(
				CLOCK_50,
				
				SCL,
				SDA,
				
				SW,
				dLED
    );
//********************* Port Declearation **************
input CLOCK_50;
inout  SCL;
inout  SDA;
input [3:0] SW;
output [7:0] dLED;
//********************* Registers & Wires **************
reg [4:0] cSTATE;
reg [4:0] nSTATE;

reg oe_scl, oe_sda;
reg START;
reg ddata;

reg [6:0] addr;
reg rRW;

reg [3:0] cbit, cbit81, cbit75;
reg [7:0] cbyte, cbyte81, cbyte75;
reg [7:0] rdda, rdda81,rdda75;

reg STOP, SSTOP;

reg [7:0] dEPRM  [0:255];
reg [7:0] rSP_81 [0:16];
reg [7:0] rSP_75 [0:5];
reg rLED0, rLED1, rLED2, rLED3, rLED4, rLED5, rLED6, rLED7;
reg ACK;
reg offset_Ra1, offset_R75;
//******************** ROM Look-up table ***************
//********************* Initialization *****************
initial
begin
	oe_scl <= 0;
	oe_sda <= 0;

	START  <= 0;
	cSTATE <= 0;
	nSTATE <= 0;
	
	ddata  <= 0;
	rRW    <= 0;
	addr   <= 0;
	
	cbit   <= 0; cbit81  <= 0; cbit75  <= 0;
	cbyte  <= 0; cbyte81 <= 0; cbyte75 <= 0;
	rdda   <= 0; rdda81  <= 0; rdda75  <= 0;
	STOP   <= 0;
	SSTOP  <= 0;
	
	rLED0  <= 0; rLED1  <= 0; rLED2  <= 0; rLED3  <= 0;
	rLED4  <= 0; rLED5  <= 0; rLED6  <= 0; rLED7  <= 0;
	ACK    <= 0;
	offset_Ra1 <= 0; offset_R75 <= 0;
	
	//********************** OPTOMA projector *****************************************
	/*dEPRM[0]  <= 8'h00; dEPRM[1]  <= 8'hff; dEPRM[2]  <= 8'hff; dEPRM[3]  <= 8'hff; 
	dEPRM[4]  <= 8'hff; dEPRM[5]  <= 8'hff; dEPRM[6]  <= 8'hff; dEPRM[7]  <= 8'h00; 
	dEPRM[8]  <= 8'h3e; dEPRM[9]  <= 8'h14; dEPRM[10] <= 8'h00; dEPRM[11] <= 8'h05; 
	dEPRM[12] <= 8'h54; dEPRM[13] <= 8'h01; dEPRM[14] <= 8'h00; dEPRM[15] <= 8'h00;
	
	dEPRM[16] <= 8'h03; dEPRM[17] <= 8'h16; dEPRM[18] <= 8'h01; dEPRM[19] <= 8'h03; 
	dEPRM[20] <= 8'h80; dEPRM[21] <= 8'h00; dEPRM[22] <= 8'h00; dEPRM[23] <= 8'h78; 
	dEPRM[24] <= 8'h0a; dEPRM[25] <= 8'haf; dEPRM[26] <= 8'he5; dEPRM[27] <= 8'hab; 
	dEPRM[28] <= 8'h54; dEPRM[29] <= 8'h35; dEPRM[30] <= 8'hb5; dEPRM[31] <= 8'h23;
	
	dEPRM[32] <= 8'h14; dEPRM[33] <= 8'h50; dEPRM[34] <= 8'h54; dEPRM[35] <= 8'hbf; 
	dEPRM[36] <= 8'hef; dEPRM[37] <= 8'h80; dEPRM[38] <= 8'hb3; dEPRM[39] <= 8'h00; 
	dEPRM[40] <= 8'h95; dEPRM[41] <= 8'h00; dEPRM[42] <= 8'h81; dEPRM[43] <= 8'h00; 
	dEPRM[44] <= 8'h81; dEPRM[45] <= 8'hfc; dEPRM[46] <= 8'h61; dEPRM[47] <= 8'h7c;
	
	dEPRM[48] <= 8'h45; dEPRM[49] <= 8'h7c; dEPRM[50] <= 8'h81; dEPRM[51] <= 8'h40; 
	dEPRM[52] <= 8'h81; dEPRM[53] <= 8'h80; dEPRM[54] <= 8'h9e; dEPRM[55] <= 8'h20; 
	dEPRM[56] <= 8'h00; dEPRM[57] <= 8'h90; dEPRM[58] <= 8'h51; dEPRM[59] <= 8'h20; 
	dEPRM[60] <= 8'h1f; dEPRM[61] <= 8'h30; dEPRM[62] <= 8'h48; dEPRM[63] <= 8'h80;
	
	
	dEPRM[64] <= 8'h36; dEPRM[65] <= 8'h00; dEPRM[66] <= 8'h00; dEPRM[67] <= 8'h00; 
	dEPRM[68] <= 8'h00; dEPRM[69] <= 8'h00; dEPRM[70] <= 8'h00; dEPRM[71] <= 8'h18; 
	dEPRM[72] <= 8'h00; dEPRM[73] <= 8'h00; dEPRM[74] <= 8'h00; dEPRM[75] <= 8'hff; 
	dEPRM[76] <= 8'h00; dEPRM[77] <= 8'h51; dEPRM[78] <= 8'h38; dEPRM[79] <= 8'h4c;
	
	dEPRM[80] <= 8'h4b; dEPRM[81] <= 8'h32; dEPRM[82] <= 8'h30; dEPRM[83] <= 8'h33; 
	dEPRM[84] <= 8'h41; dEPRM[85] <= 8'h30; dEPRM[86] <= 8'h33; dEPRM[87] <= 8'h34; 
	dEPRM[88] <= 8'h30; dEPRM[89] <= 8'h0a; dEPRM[90] <= 8'h00; dEPRM[91] <= 8'h00; 
	dEPRM[92] <= 8'h00; dEPRM[93] <= 8'hfd; dEPRM[94] <= 8'h00; dEPRM[95] <= 8'h32;
	
	dEPRM[96]  <= 8'h78; dEPRM[97]  <= 8'h0f; dEPRM[98]  <= 8'h64; dEPRM[99]  <= 8'h0f; 
	dEPRM[100] <= 8'h00; dEPRM[101] <= 8'h0a; dEPRM[102] <= 8'h20; dEPRM[103] <= 8'h20; 
	dEPRM[104] <= 8'h20; dEPRM[105] <= 8'h20; dEPRM[106] <= 8'h20; dEPRM[107] <= 8'h20; 
	dEPRM[108] <= 8'h00; dEPRM[109] <= 8'h00; dEPRM[110] <= 8'h00; dEPRM[111] <= 8'hfc;
	
	dEPRM[112] <= 8'h00; dEPRM[113] <= 8'h4f; dEPRM[114] <= 8'h70; dEPRM[115] <= 8'h74; 
	dEPRM[116] <= 8'h6f; dEPRM[117] <= 8'h6d; dEPRM[118] <= 8'h61; dEPRM[119] <= 8'h20; 
	dEPRM[120] <= 8'h57; dEPRM[121] <= 8'h58; dEPRM[122] <= 8'h47; dEPRM[123] <= 8'h41; 
	dEPRM[124] <= 8'h0a; dEPRM[125] <= 8'h20; dEPRM[126] <= 8'h01; dEPRM[127] <= 8'h44;
	
	//************************ Extended 128 bytes *************************************
	
	dEPRM[128] <= 8'h02; dEPRM[129] <= 8'h03; dEPRM[130] <= 8'h23; dEPRM[131] <= 8'hf2; 
	dEPRM[132] <= 8'h4e; dEPRM[133] <= 8'h06; dEPRM[134] <= 8'h15; dEPRM[135] <= 8'h02; 
	dEPRM[136] <= 8'h11; dEPRM[137] <= 8'h84; dEPRM[138] <= 8'h93; dEPRM[139] <= 8'h05; 
	dEPRM[140] <= 8'h14; dEPRM[141] <= 8'h10; dEPRM[142] <= 8'h1f; dEPRM[143] <= 8'h01;
	
	dEPRM[144] <= 8'h20; dEPRM[145] <= 8'h21; dEPRM[146] <= 8'h22; dEPRM[147] <= 8'h23; 
	dEPRM[148] <= 8'h09; dEPRM[149] <= 8'h07; dEPRM[150] <= 8'h07; dEPRM[151] <= 8'h83; 
	dEPRM[152] <= 8'h01; dEPRM[153] <= 8'h00; dEPRM[154] <= 8'h00; dEPRM[155] <= 8'h67; 
	dEPRM[156] <= 8'h03; dEPRM[157] <= 8'h0c; dEPRM[158] <= 8'h00; dEPRM[159] <= 8'h10;
	
	dEPRM[160] <= 8'h00; dEPRM[161] <= 8'h38; dEPRM[162] <= 8'h2d; dEPRM[163] <= 8'h01; 
	dEPRM[164] <= 8'h1d; dEPRM[165] <= 8'h00; dEPRM[166] <= 8'h72; dEPRM[167] <= 8'h51; 
	dEPRM[168] <= 8'hd0; dEPRM[169] <= 8'h1e; dEPRM[170] <= 8'h20; dEPRM[171] <= 8'h6e; 
	dEPRM[172] <= 8'h28; dEPRM[173] <= 8'h55; dEPRM[174] <= 8'h00; dEPRM[175] <= 8'h00;
	
	dEPRM[176] <= 8'h00; dEPRM[177] <= 8'h00; dEPRM[178] <= 8'h00; dEPRM[179] <= 8'h00; 
	dEPRM[180] <= 8'h1e; dEPRM[181] <= 8'h01; dEPRM[182] <= 8'h1d; dEPRM[183] <= 8'h00; 
	dEPRM[184] <= 8'hbc; dEPRM[185] <= 8'h52; dEPRM[186] <= 8'hd0; dEPRM[187] <= 8'h1e; 
	dEPRM[188] <= 8'h20; dEPRM[189] <= 8'hb8; dEPRM[190] <= 8'h28; dEPRM[191] <= 8'h55;
	
	dEPRM[192] <= 8'h40; dEPRM[193] <= 8'h00; dEPRM[194] <= 8'h00; dEPRM[195] <= 8'h00; 
	dEPRM[196] <= 8'h00; dEPRM[197] <= 8'h00; dEPRM[198] <= 8'h1e; dEPRM[199] <= 8'h01; 
	dEPRM[200] <= 8'h1d; dEPRM[201] <= 8'h80; dEPRM[202] <= 8'h18; dEPRM[203] <= 8'h71; 
	dEPRM[204] <= 8'h1c; dEPRM[205] <= 8'h16; dEPRM[206] <= 8'h20; dEPRM[207] <= 8'h58;
	
	dEPRM[208] <= 8'h2c; dEPRM[209] <= 8'h25; dEPRM[210] <= 8'h00; dEPRM[211] <= 8'h00; 
	dEPRM[212] <= 8'h00; dEPRM[213] <= 8'h00; dEPRM[214] <= 8'h00; dEPRM[215] <= 8'h00; 
	dEPRM[216] <= 8'h9e; dEPRM[217] <= 8'h8c; dEPRM[218] <= 8'h0a; dEPRM[219] <= 8'hd0; 
	dEPRM[220] <= 8'h8a; dEPRM[221] <= 8'h20; dEPRM[222] <= 8'he0; dEPRM[223] <= 8'h2d;
	
	dEPRM[224] <= 8'h10; dEPRM[225] <= 8'h10; dEPRM[226] <= 8'h3e; dEPRM[227] <= 8'h96; 
	dEPRM[228] <= 8'h00; dEPRM[229] <= 8'h00; dEPRM[230] <= 8'h00; dEPRM[231] <= 8'h00; 
	dEPRM[232] <= 8'h00; dEPRM[233] <= 8'h00; dEPRM[234] <= 8'h18; dEPRM[235] <= 8'h02; 
	dEPRM[236] <= 8'h3a; dEPRM[237] <= 8'h80; dEPRM[238] <= 8'h18; dEPRM[239] <= 8'h71;
	
	dEPRM[240] <= 8'h38; dEPRM[241] <= 8'h2d; dEPRM[242] <= 8'h40; dEPRM[243] <= 8'h58; 
	dEPRM[244] <= 8'h2c; dEPRM[245] <= 8'h45; dEPRM[246] <= 8'h00; dEPRM[247] <= 8'h00; 
	dEPRM[248] <= 8'h00; dEPRM[249] <= 8'h00; dEPRM[250] <= 8'h00; dEPRM[251] <= 8'h00; 
	dEPRM[252] <= 8'h1e; dEPRM[253] <= 8'h00; dEPRM[254] <= 8'h00; dEPRM[255] <= 8'h7f;*/
	
	$readmemh("re856.txt", dEPRM);			//aedid.txt : dell 1504 128-bit
														//bedid.txt : Ying's prjct
														//cedid.txt : YYU226, only support 800*600 (Good @ 120Hz)
														//nedid.txt : revised version of 'cedid.txt', nvidia only shows 60 and 120 Hz options
														//tiedid.txt: based on the TI DLP projector's EDID, because Dr. Lau wants to show all the resolutions within the SPARTAN6's limit (not working)
														//mixedid.txt: 1st 128 bytes of "nedid" + 2nd 128 bytes of TI DLP (display the resolution list but not working)
														//m1edid.txt: updated EDID that has all the resolutions Dr. Lau wants (Good one, for custom projectors)
														//ticopy.txt: a revised copy of tiedid, couldn't make it work ..................!!!!!!!!!!!!!!!!!!!!!!!!!!
	//rSP_75[0] <= 8'h2e; rSP_75[1] <= 8'h96; rSP_75[2] <= 8'hb6; 
	//rSP_75[3] <= 8'h84; rSP_75[4] <= 8'hae; rSP_75[5] <= 8'h83;
	
	//***************** TI DLP projector (not support 800*600@120Hz) ****************
	/*dEPRM[0]  <= 8'h00; dEPRM[1]  <= 8'hff; dEPRM[2]  <= 8'hff; dEPRM[3]  <= 8'hff; 
	dEPRM[4]  <= 8'hff; dEPRM[5]  <= 8'hff; dEPRM[6]  <= 8'hff; dEPRM[7]  <= 8'h00; 
	dEPRM[8]  <= 8'h11; dEPRM[9]  <= 8'h90; dEPRM[10] <= 8'h50; dEPRM[11] <= 8'h50; 
	dEPRM[12] <= 8'h01; dEPRM[13] <= 8'h00; dEPRM[14] <= 8'h00; dEPRM[15] <= 8'h00;
	
	dEPRM[16] <= 8'h08; dEPRM[17] <= 8'h13; dEPRM[18] <= 8'h01; dEPRM[19] <= 8'h03; 
	dEPRM[20] <= 8'h80; dEPRM[21] <= 8'hc0; dEPRM[22] <= 8'h6c; dEPRM[23] <= 8'ha0; 
	dEPRM[24] <= 8'h2a; dEPRM[25] <= 8'hee; dEPRM[26] <= 8'h95; dEPRM[27] <= 8'ha3; 
	dEPRM[28] <= 8'h54; dEPRM[29] <= 8'h4c; dEPRM[30] <= 8'h99; dEPRM[31] <= 8'h26;
	
	dEPRM[32] <= 8'h0f; dEPRM[33] <= 8'h50; dEPRM[34] <= 8'h54; dEPRM[35] <= 8'h21; 
	dEPRM[36] <= 8'h08; dEPRM[37] <= 8'h00; dEPRM[38] <= 8'h01; dEPRM[39] <= 8'h01; 
	dEPRM[40] <= 8'h01; dEPRM[41] <= 8'h01; dEPRM[42] <= 8'h01; dEPRM[43] <= 8'h01; 
	dEPRM[44] <= 8'h01; dEPRM[45] <= 8'h01; dEPRM[46] <= 8'h01; dEPRM[47] <= 8'h01;
	
	dEPRM[48] <= 8'h01; dEPRM[49] <= 8'h01; dEPRM[50] <= 8'h01; dEPRM[51] <= 8'h01; 
	dEPRM[52] <= 8'h01; dEPRM[53] <= 8'h01; dEPRM[54] <= 8'h01; dEPRM[55] <= 8'h1d; 
	dEPRM[56] <= 8'h00; dEPRM[57] <= 8'h72; dEPRM[58] <= 8'h51; dEPRM[59] <= 8'hd0; 
	dEPRM[60] <= 8'h1e; dEPRM[61] <= 8'h20; dEPRM[62] <= 8'h6e; dEPRM[63] <= 8'h28;
	
	
	dEPRM[64] <= 8'h55; dEPRM[65] <= 8'h00; dEPRM[66] <= 8'h00; dEPRM[67] <= 8'hd0; 
	dEPRM[68] <= 8'h52; dEPRM[69] <= 8'h00; dEPRM[70] <= 8'h00; dEPRM[71] <= 8'h1e; 
	dEPRM[72] <= 8'h8c; dEPRM[73] <= 8'h0a; dEPRM[74] <= 8'hd0; dEPRM[75] <= 8'h8a; 
	dEPRM[76] <= 8'h20; dEPRM[77] <= 8'he0; dEPRM[78] <= 8'h2d; dEPRM[79] <= 8'h10;
	
	dEPRM[80] <= 8'h10; dEPRM[81] <= 8'h3e; dEPRM[82] <= 8'h96; dEPRM[83] <= 8'h00; 
	dEPRM[84] <= 8'hd0; dEPRM[85] <= 8'he0; dEPRM[86] <= 8'h21; dEPRM[87] <= 8'h00; 
	dEPRM[88] <= 8'h00; dEPRM[89] <= 8'h1e; dEPRM[90] <= 8'h00; dEPRM[91] <= 8'h00; 
	dEPRM[92] <= 8'h00; dEPRM[93] <= 8'hfc; dEPRM[94] <= 8'h00; dEPRM[95] <= 8'h49;
	
	dEPRM[96]  <= 8'h54; dEPRM[97]  <= 8'h45; dEPRM[98]  <= 8'h36; dEPRM[99]  <= 8'h38; 
	dEPRM[100] <= 8'h30; dEPRM[101] <= 8'h31; dEPRM[102] <= 8'h20; dEPRM[103] <= 8'h0a; 
	dEPRM[104] <= 8'h20; dEPRM[105] <= 8'h20; dEPRM[106] <= 8'h20; dEPRM[107] <= 8'h20; 
	dEPRM[108] <= 8'h00; dEPRM[109] <= 8'h00; dEPRM[110] <= 8'h00; dEPRM[111] <= 8'hfd;
	
	dEPRM[112] <= 8'h00; dEPRM[113] <= 8'h30; dEPRM[114] <= 8'h7a; dEPRM[115] <= 8'h1e; 
	dEPRM[116] <= 8'h5a; dEPRM[117] <= 8'h0f; dEPRM[118] <= 8'h00; dEPRM[119] <= 8'h0a; 
	dEPRM[120] <= 8'h20; dEPRM[121] <= 8'h20; dEPRM[122] <= 8'h20; dEPRM[123] <= 8'h20; 
	dEPRM[124] <= 8'h20; dEPRM[125] <= 8'h20; dEPRM[126] <= 8'h01; dEPRM[127] <= 8'h54;
	
	//************************ Extended 128 bytes *************************************
	
	dEPRM[128] <= 8'h02; dEPRM[129] <= 8'h03; dEPRM[130] <= 8'h29; dEPRM[131] <= 8'h41; 
	dEPRM[132] <= 8'h83; dEPRM[133] <= 8'h01; dEPRM[134] <= 8'h00; dEPRM[135] <= 8'h00; 
	dEPRM[136] <= 8'h6e; dEPRM[137] <= 8'h03; dEPRM[138] <= 8'h0c; dEPRM[139] <= 8'h00; 
	dEPRM[140] <= 8'h10; dEPRM[141] <= 8'h00; dEPRM[142] <= 8'h00; dEPRM[143] <= 8'h1e;
	
	dEPRM[144] <= 8'h20; dEPRM[145] <= 8'hc0; dEPRM[146] <= 8'h04; dEPRM[147] <= 8'h00; 
	dEPRM[148] <= 8'h01; dEPRM[149] <= 8'h0e; dEPRM[150] <= 8'h7f; dEPRM[151] <= 8'h4d; 
	dEPRM[152] <= 8'h01; dEPRM[153] <= 8'h02; dEPRM[154] <= 8'h03; dEPRM[155] <= 8'h84; 
	dEPRM[156] <= 8'h11; dEPRM[157] <= 8'h12; dEPRM[158] <= 8'h13; dEPRM[159] <= 8'h2a;
	
	dEPRM[160] <= 8'h30; dEPRM[161] <= 8'h3c; dEPRM[162] <= 8'h3d; dEPRM[163] <= 8'h3e; 
	dEPRM[164] <= 8'h2f; dEPRM[165] <= 8'h23; dEPRM[166] <= 8'h09; dEPRM[167] <= 8'h07; 
	dEPRM[168] <= 8'h07; dEPRM[169] <= 8'h16; dEPRM[170] <= 8'h0d; dEPRM[171] <= 8'h60; 
	dEPRM[172] <= 8'h6a; dEPRM[173] <= 8'h30; dEPRM[174] <= 8'he0; dEPRM[175] <= 8'h5f;
	
	dEPRM[176] <= 8'h10; dEPRM[177] <= 8'h04; dEPRM[178] <= 8'h28; dEPRM[179] <= 8'hff; 
	dEPRM[180] <= 8'h07; dEPRM[181] <= 8'h60; dEPRM[182] <= 8'he0; dEPRM[183] <= 8'h31; 
	dEPRM[184] <= 8'h00; dEPRM[185] <= 8'h00; dEPRM[186] <= 8'h1e; dEPRM[187] <= 8'h44; 
	dEPRM[188] <= 8'h0c; dEPRM[189] <= 8'h56; dEPRM[190] <= 8'h36; dEPRM[191] <= 8'h30;
	
	dEPRM[192] <= 8'he0; dEPRM[193] <= 8'h60; dEPRM[194] <= 8'h10; dEPRM[195] <= 8'hea; 
	dEPRM[196] <= 8'h28; dEPRM[197] <= 8'h0f; dEPRM[198] <= 8'hc3; dEPRM[199] <= 8'h56; 
	dEPRM[200] <= 8'he0; dEPRM[201] <= 8'h31; dEPRM[202] <= 8'h00; dEPRM[203] <= 8'h00; 
	dEPRM[204] <= 8'h1e; dEPRM[205] <= 8'h47; dEPRM[206] <= 8'h09; dEPRM[207] <= 8'h80;
	
	dEPRM[208] <= 8'h30; dEPRM[209] <= 8'h20; dEPRM[210] <= 8'he0; dEPRM[211] <= 8'h5f; 
	dEPRM[212] <= 8'h10; dEPRM[213] <= 8'he4; dEPRM[214] <= 8'h28; dEPRM[215] <= 8'hff; 
	dEPRM[216] <= 8'hcf; dEPRM[217] <= 8'h80; dEPRM[218] <= 8'he0; dEPRM[219] <= 8'h21; 
	dEPRM[220] <= 8'h00; dEPRM[221] <= 8'h00; dEPRM[222] <= 8'h3e; dEPRM[223] <= 8'h9e;
	
	dEPRM[224] <= 8'h20; dEPRM[225] <= 8'h00; dEPRM[226] <= 8'h90; dEPRM[227] <= 8'h51; 
	dEPRM[228] <= 8'h20; dEPRM[229] <= 8'h1f; dEPRM[230] <= 8'h30; dEPRM[231] <= 8'h48; 
	dEPRM[232] <= 8'h80; dEPRM[233] <= 8'h36; dEPRM[234] <= 8'h00; dEPRM[235] <= 8'h00; 
	dEPRM[236] <= 8'h20; dEPRM[237] <= 8'h53; dEPRM[238] <= 8'h00; dEPRM[239] <= 8'h00;
	
	dEPRM[240] <= 8'h1a; dEPRM[241] <= 8'h00; dEPRM[242] <= 8'h00; dEPRM[243] <= 8'h00; 
	dEPRM[244] <= 8'h00; dEPRM[245] <= 8'h00; dEPRM[246] <= 8'h00; dEPRM[247] <= 8'h00; 
	dEPRM[248] <= 8'h00; dEPRM[249] <= 8'h00; dEPRM[250] <= 8'h00; dEPRM[251] <= 8'h00; 
	dEPRM[252] <= 8'h00; dEPRM[253] <= 8'h00; dEPRM[254] <= 8'h00; dEPRM[255] <= 8'hc7;*/
	
	
	//****************************** DELL 24' monitor ************************************
	/*dEPRM[0]  <= 8'h00; dEPRM[1]  <= 8'hff; dEPRM[2]  <= 8'hff; dEPRM[3]  <= 8'hff; 
	dEPRM[4]  <= 8'hff; dEPRM[5]  <= 8'hff; dEPRM[6]  <= 8'hff; dEPRM[7]  <= 8'h00; 
	dEPRM[8]  <= 8'h10; dEPRM[9]  <= 8'hac; dEPRM[10] <= 8'h2c; dEPRM[11] <= 8'ha0; 
	dEPRM[12] <= 8'h53; dEPRM[13] <= 8'h4d; dEPRM[14] <= 8'h54; dEPRM[15] <= 8'h31;
	
	dEPRM[16] <= 8'h0d; dEPRM[17] <= 8'h12; dEPRM[18] <= 8'h01; dEPRM[19] <= 8'h03; 
	dEPRM[20] <= 8'h80; dEPRM[21] <= 8'h34; dEPRM[22] <= 8'h20; dEPRM[23] <= 8'h78; 
	dEPRM[24] <= 8'hea; dEPRM[25] <= 8'hb3; dEPRM[26] <= 8'h25; dEPRM[27] <= 8'hac; 
	dEPRM[28] <= 8'h51; dEPRM[29] <= 8'h30; dEPRM[30] <= 8'hb4; dEPRM[31] <= 8'h26;
	
	dEPRM[32] <= 8'h10; dEPRM[33] <= 8'h50; dEPRM[34] <= 8'h54; dEPRM[35] <= 8'ha5; 
	dEPRM[36] <= 8'h4b; dEPRM[37] <= 8'h00; dEPRM[38] <= 8'h81; dEPRM[39] <= 8'h80; 
	dEPRM[40] <= 8'ha9; dEPRM[41] <= 8'h40; dEPRM[42] <= 8'h71; dEPRM[43] <= 8'h4f; 
	dEPRM[44] <= 8'h01; dEPRM[45] <= 8'h01; dEPRM[46] <= 8'h01; dEPRM[47] <= 8'h01;
	
	dEPRM[48] <= 8'h01; dEPRM[49] <= 8'h01; dEPRM[50] <= 8'h01; dEPRM[51] <= 8'h01; 
	dEPRM[52] <= 8'h01; dEPRM[53] <= 8'h01; dEPRM[54] <= 8'h28; dEPRM[55] <= 8'h3c; 
	dEPRM[56] <= 8'h80; dEPRM[57] <= 8'ha0; dEPRM[58] <= 8'h70; dEPRM[59] <= 8'hb0; 
	dEPRM[60] <= 8'h23; dEPRM[61] <= 8'h40; dEPRM[62] <= 8'h30; dEPRM[63] <= 8'h20;
	
	
	dEPRM[64] <= 8'h36; dEPRM[65] <= 8'h00; dEPRM[66] <= 8'h07; dEPRM[67] <= 8'h44; 
	dEPRM[68] <= 8'h21; dEPRM[69] <= 8'h00; dEPRM[70] <= 8'h00; dEPRM[71] <= 8'h1a; 
	dEPRM[72] <= 8'h00; dEPRM[73] <= 8'h00; dEPRM[74] <= 8'h00; dEPRM[75] <= 8'hff; 
	dEPRM[76] <= 8'h00; dEPRM[77] <= 8'h4a; dEPRM[78] <= 8'h55; dEPRM[79] <= 8'h34;
	
	dEPRM[80] <= 8'h33; dEPRM[81] <= 8'h36; dEPRM[82] <= 8'h38; dEPRM[83] <= 8'h33; 
	dEPRM[84] <= 8'h51; dEPRM[85] <= 8'h31; dEPRM[86] <= 8'h54; dEPRM[87] <= 8'h4d; 
	dEPRM[88] <= 8'h53; dEPRM[89] <= 8'h0a; dEPRM[90] <= 8'h00; dEPRM[91] <= 8'h00; 
	dEPRM[92] <= 8'h00; dEPRM[93] <= 8'hfc; dEPRM[94] <= 8'h00; dEPRM[95] <= 8'h44;
	
	dEPRM[96]  <= 8'h45; dEPRM[97]  <= 8'h4c; dEPRM[98]  <= 8'h4c; dEPRM[99]  <= 8'h20; 
	dEPRM[100] <= 8'h32; dEPRM[101] <= 8'h34; dEPRM[102] <= 8'h30; dEPRM[103] <= 8'h38; 
	dEPRM[104] <= 8'h57; dEPRM[105] <= 8'h46; dEPRM[106] <= 8'h50; dEPRM[107] <= 8'h0a; 
	dEPRM[108] <= 8'h00; dEPRM[109] <= 8'h00; dEPRM[110] <= 8'h00; dEPRM[111] <= 8'hfd;
	
	dEPRM[112] <= 8'h00; dEPRM[113] <= 8'h38; dEPRM[114] <= 8'h4c; dEPRM[115] <= 8'h1e; 
	dEPRM[116] <= 8'h53; dEPRM[117] <= 8'h11; dEPRM[118] <= 8'h00; dEPRM[119] <= 8'h0a; 
	dEPRM[120] <= 8'h20; dEPRM[121] <= 8'h20; dEPRM[122] <= 8'h20; dEPRM[123] <= 8'h20; 
	dEPRM[124] <= 8'h20; dEPRM[125] <= 8'h20; dEPRM[126] <= 8'h01; dEPRM[127] <= 8'hc0;
	
	//************************ Extended 128 bytes *************************************
	
	dEPRM[128] <= 8'h02; dEPRM[129] <= 8'h03; dEPRM[130] <= 8'h1b; dEPRM[131] <= 8'hf1; 
	dEPRM[132] <= 8'h48; dEPRM[133] <= 8'h90; dEPRM[134] <= 8'h05; dEPRM[135] <= 8'h04; 
	dEPRM[136] <= 8'h03; dEPRM[137] <= 8'h02; dEPRM[138] <= 8'h07; dEPRM[139] <= 8'h16; 
	dEPRM[140] <= 8'h01; dEPRM[141] <= 8'h23; dEPRM[142] <= 8'h09; dEPRM[143] <= 8'h07;
	
	dEPRM[144] <= 8'h07; dEPRM[145] <= 8'h65; dEPRM[146] <= 8'h03; dEPRM[147] <= 8'h0c; 
	dEPRM[148] <= 8'h00; dEPRM[149] <= 8'h10; dEPRM[150] <= 8'h00; dEPRM[151] <= 8'h83; 
	dEPRM[152] <= 8'h01; dEPRM[153] <= 8'h00; dEPRM[154] <= 8'h00; dEPRM[155] <= 8'h02; 
	dEPRM[156] <= 8'h3a; dEPRM[157] <= 8'h80; dEPRM[158] <= 8'h18; dEPRM[159] <= 8'h71;
	
	dEPRM[160] <= 8'h38; dEPRM[161] <= 8'h2d; dEPRM[162] <= 8'h40; dEPRM[163] <= 8'h58; 
	dEPRM[164] <= 8'h2c; dEPRM[165] <= 8'h45; dEPRM[166] <= 8'h00; dEPRM[167] <= 8'h07; 
	dEPRM[168] <= 8'h44; dEPRM[169] <= 8'h21; dEPRM[170] <= 8'h00; dEPRM[171] <= 8'h00; 
	dEPRM[172] <= 8'h1e; dEPRM[173] <= 8'h01; dEPRM[174] <= 8'h1d; dEPRM[175] <= 8'h80;
	
	dEPRM[176] <= 8'h18; dEPRM[177] <= 8'h71; dEPRM[178] <= 8'h1c; dEPRM[179] <= 8'h16; 
	dEPRM[180] <= 8'h20; dEPRM[181] <= 8'h58; dEPRM[182] <= 8'h2c; dEPRM[183] <= 8'h25; 
	dEPRM[184] <= 8'h00; dEPRM[185] <= 8'h07; dEPRM[186] <= 8'h44; dEPRM[187] <= 8'h21; 
	dEPRM[188] <= 8'h00; dEPRM[189] <= 8'h00; dEPRM[190] <= 8'h9e; dEPRM[191] <= 8'h01;
	
	dEPRM[192] <= 8'h1d; dEPRM[193] <= 8'h00; dEPRM[194] <= 8'h72; dEPRM[195] <= 8'h51; 
	dEPRM[196] <= 8'hd0; dEPRM[197] <= 8'h1e; dEPRM[198] <= 8'h20; dEPRM[199] <= 8'h6e; 
	dEPRM[200] <= 8'h28; dEPRM[201] <= 8'h55; dEPRM[202] <= 8'h00; dEPRM[203] <= 8'h07; 
	dEPRM[204] <= 8'h44; dEPRM[205] <= 8'h21; dEPRM[206] <= 8'h00; dEPRM[207] <= 8'h00;
	
	dEPRM[208] <= 8'h1e; dEPRM[209] <= 8'h8c; dEPRM[210] <= 8'h0a; dEPRM[211] <= 8'hd0; 
	dEPRM[212] <= 8'h8a; dEPRM[213] <= 8'h20; dEPRM[214] <= 8'he0; dEPRM[215] <= 8'h2d; 
	dEPRM[216] <= 8'h10; dEPRM[217] <= 8'h10; dEPRM[218] <= 8'h3e; dEPRM[219] <= 8'h96; 
	dEPRM[220] <= 8'h00; dEPRM[221] <= 8'h07; dEPRM[222] <= 8'h44; dEPRM[223] <= 8'h21;
	
	dEPRM[224] <= 8'h00; dEPRM[225] <= 8'h00; dEPRM[226] <= 8'h18; dEPRM[227] <= 8'h00; 
	dEPRM[228] <= 8'h00; dEPRM[229] <= 8'h00; dEPRM[230] <= 8'h00; dEPRM[231] <= 8'h00; 
	dEPRM[232] <= 8'h00; dEPRM[233] <= 8'h00; dEPRM[234] <= 8'h00; dEPRM[235] <= 8'h00; 
	dEPRM[236] <= 8'h00; dEPRM[237] <= 8'h00; dEPRM[238] <= 8'h00; dEPRM[239] <= 8'h00;
	
	dEPRM[240] <= 8'h00; dEPRM[241] <= 8'h00; dEPRM[242] <= 8'h00; dEPRM[243] <= 8'h00; 
	dEPRM[244] <= 8'h00; dEPRM[245] <= 8'h00; dEPRM[246] <= 8'h00; dEPRM[247] <= 8'h00; 
	dEPRM[248] <= 8'h00; dEPRM[249] <= 8'h00; dEPRM[250] <= 8'h00; dEPRM[251] <= 8'h00; 
	dEPRM[252] <= 8'h00; dEPRM[253] <= 8'h00; dEPRM[254] <= 8'h00; dEPRM[255] <= 8'h47;*/
	
	rSP_75[0] <= 8'hc7; rSP_75[1] <= 8'h48; rSP_75[2] <= 8'hbf; 
	rSP_75[3] <= 8'h26; rSP_75[4] <= 8'ha1; rSP_75[5] <= 8'h00;
	
	//********************** Common param *****************************
	rSP_81[0]  <= 8'h44; rSP_81[1]  <= 8'h50; rSP_81[2]  <= 8'h2d;
	rSP_81[3]  <= 8'h48; rSP_81[4]  <= 8'h44; rSP_81[5]  <= 8'h4d;
	rSP_81[6]  <= 8'h49; rSP_81[7]  <= 8'h20; rSP_81[8]  <= 8'h41;
	rSP_81[9]  <= 8'h44; rSP_81[10] <= 8'h41; rSP_81[11] <= 8'h50;
	rSP_81[12] <= 8'h54; rSP_81[13] <= 8'h4f; rSP_81[14] <= 8'h52;
	rSP_81[15] <= 8'h04; rSP_81[16] <= 8'ha0;
	
end

assign dLED[0] = rLED0;
assign dLED[1] = rLED1;
assign dLED[2] = rLED2;
assign dLED[3] = rLED3;

assign dLED[4] = rLED4;
assign dLED[5] = rLED5;
assign dLED[6] = rLED6;
assign dLED[7] = rLED7;
always@(posedge CLOCK_50)
begin
	rLED7 <= SW[3];
	rLED6 <= SW[2];
	rLED5 <= SW[1];
	rLED4 <= SW[0];
end
/********************** FSM ****************************
//ST 0 : Wait for a START condition
//ST 1 : 
//ST 2 : 
//ST 3 : 
//ST 8 : R/W bit by Master
//ST 9 : ACK bit by Slave
//ST 11: Received a NACK
//ST 12: Wait for a STOP condition
//ST 13~22: Master write 0x00 to Slave
//ST 23: Read contents @ I2C address 0x81
//ST 24: Read contents @ I2C address 0x75
******************************************************/
always@(posedge SCL or posedge START /*or posedge STOP */or posedge SSTOP)							//right click "Synthesize-XST" -> "Process Properties" -> "Synthesis Options" -> "Advanced" level -> last line
begin
		if(START)
			cSTATE <= 1;
		else if(SSTOP)										//designed to handle the test pattern at the very beginning of the request
			cSTATE <= 0;
		//else if(STOP)
			//cSTATE <= 0;
		else
			cSTATE <= nSTATE;
end

always@(cSTATE or ACK)
begin
		case (cSTATE)
			0: nSTATE <= 0;								//IDLE state
			
			1: nSTATE <= 2;
			2: nSTATE <= 3;
			3: nSTATE <= 4;
			4: nSTATE <= 5;
			5: nSTATE <= 6;
			6: nSTATE <= 7;
			7: nSTATE <= 8;
			8: nSTATE <= 9;
			9: begin
					if({addr, rRW}==8'hA1)
					begin
						nSTATE <= 10;
						rLED1  <= 1;
					end
				   else if({addr, rRW}==8'hA0)
					begin
						nSTATE <= 13;
						rLED2  <= 1;
					end
					else if({addr, rRW}==8'h81)				//followd by 17 bytes info. different from monitor to monitor
						nSTATE <= 23;
					else if({addr, rRW}==8'h80)				//always followed by 0x00
						nSTATE <= 13;
					else if({addr, rRW}==8'h75)				//followed by 5+1 bytes info.
						nSTATE <= 24;
					else if({addr, rRW}==8'h74)				//followed by 0x00 or 0x40
						nSTATE <= 13;
					else
					begin
						nSTATE <= 11;						//received unexpected command, hope it won't happen
						rLED0  <= 1;
					end
				end
		  10: begin
					if(ACK)									//one transmition is done, wait for STOP condition
					begin
						nSTATE <= 12;
						rLED3  <= 1;
					end
					else					
						nSTATE <= 10;
			   end
		  11: nSTATE <= 12;
			
		  /* Transmision has finished, either wrong ADDRESS or the end of expected bytes */
	     12: begin
					nSTATE <= 0;
					//rLED4  <= 1;
				end							//waiting for STOP condition
		  
		  
		  13: nSTATE <= 14;				//ACK bit
		  14: nSTATE <= 15;
		  15: nSTATE <= 16;
		  16: nSTATE <= 17;
		  17: nSTATE <= 18;
		  18: nSTATE <= 19;
		  19: nSTATE <= 20;
		  20: nSTATE <= 21;
		  21: begin
					if({addr, rRW}==8'h80) begin
						offset_Ra1 <= 1; nSTATE <= 22; end
					else if({addr, rRW}==8'h40) begin
						offset_R75 <= 1; nSTATE <= 22; end
					else if({addr, rRW}==8'h00) begin
						offset_Ra1 <= 0;
						offset_R75 <= 0;
						nSTATE <= 22;
					end				
					else
						nSTATE <= 11;			//what follows 0xA0 is not 0x00, not supposed to happen
			   end
		  22: nSTATE <= 0;				//no STOP condition here, directly goes to next START condition
		  
		  23: begin
					if(ACK) nSTATE <= 12;
					else    nSTATE <= 23;
				end
				
		  24: begin
					if(ACK) nSTATE <= 12;
					else    nSTATE <= 24;
				end
		  default: nSTATE <= 0;
		endcase
end

always@(posedge SCL)
begin
		case (cSTATE)
			0: oe_scl <= 0;
		
			1: begin
					oe_scl  <= 0;
					addr[6] <= SDA;
				end
			2: addr[5] <= SDA;
			3: addr[4] <= SDA;
			4: addr[3] <= SDA;
			5: addr[2] <= SDA;
			6: addr[1] <= SDA;
			7: addr[0] <= SDA;
			8: begin
					rRW    <= SDA;								//should be "1", receiving data
					oe_scl <= 0; 
				end
			9: oe_scl <= 0;									//ACK bit output
		  10: oe_scl <= 0;
				
		  11: oe_scl <= 0;
		  12: oe_scl <= 0;
		  
		  13: addr[6] <= SDA;
		  14: addr[5] <= SDA;
		  15: addr[4] <= SDA;
		  16: addr[3] <= SDA;
		  17: addr[2] <= SDA;
		  18: addr[1] <= SDA;
		  19: addr[0] <= SDA;
		  20: rRW     <= SDA;
		  21: oe_scl  <= 0;
		  22: oe_scl  <= 0;
		  
		  23: oe_scl <= 0;
		  24: oe_scl <= 0;
		  default: oe_scl <= 0;
		endcase
end
always@(negedge SCL)
begin
		case (cSTATE)
			0: oe_sda <= 0;
			
			1: oe_sda <= 0;
			2: oe_sda <= 0;
			3: oe_sda <= 0;
			4: oe_sda <= 0;
			5: oe_sda <= 0;
			6: oe_sda <= 0;
			7: oe_sda <= 0;
			8: oe_sda <= 0;
			9: oe_sda <= 1'b1;
		  10: begin
					if(cbit==8)					//read ACK bit
						oe_sda <= 0;
					else
						oe_sda <= 1;
				end
				
		  11: oe_sda <= 0;
		  12: oe_sda <= 0;
		  
		  13: oe_sda <= 0;
		  14: oe_sda <= 0;
		  15: oe_sda <= 0;
		  16: oe_sda <= 0;
		  17: oe_sda <= 0;
		  18: oe_sda <= 0;
		  19: oe_sda <= 0;
		  20: oe_sda <= 0;
		  21: oe_sda <= 1;					//ACK
		  22: oe_sda <= 0;
		  
		  23: begin
					if(cbit81==8) oe_sda <= 0;
					else          oe_sda <= 1;
				end
				
		  24: begin
					if(cbit75==8) oe_sda <= 0;
					else          oe_sda <= 1;
				end
		  default: oe_sda <= 0;
		endcase
end
/******************* FSM input signals *****************/
assign SCL = oe_scl ? 1'b0 : 1'bZ;
assign SDA = oe_sda ? ddata: 1'bZ;

always@(posedge CLOCK_50)
begin
		if((cSTATE==0)&SCL&!SDA)
			START = 1;
		else if((cSTATE==1)&!SCL)
			START = 0;
		else
			START = START;
end
always@(posedge CLOCK_50)
begin
		if((cSTATE==12)&SCL&SDA)
		begin
			//rLED7 = 1;
			STOP  = 1;
		end
		else if(cSTATE==0)
			STOP = 0;
		else
			STOP = STOP;
end
always@(posedge SDA or posedge START)
begin
	if(START)
		SSTOP = 0;
	else if(SCL)
		SSTOP = 1;
	else
		SSTOP = 0;
end
always@(posedge SCL)
begin
		if((cSTATE==10)&&(cbit==8))									//ACK goes high once the Master has received the number of bytes it expects, then the Master sends ADDRESS 0xA1 again
			ACK = SDA;
		else if((cSTATE==23)&&(cbit81==8))
		   ACK = SDA;
		else if((cSTATE==24)&&(cbit75==8))
		   ACK = SDA;
		else if(cSTATE==1)
			ACK = 0;
end
/************** Start Reveiving 128 bytes **************/
always@(negedge SCL)
begin
	if(cSTATE==9)															//ACK bit of the ADDRESS byte
	begin
			if(({addr,rRW}==8'hA0)||({addr,rRW}==8'hA1))
				ddata <=#1 0;
			else
				ddata <=#1 0;
	end
	else if(cSTATE==21)
			ddata <=#1 0; 
	else if(cSTATE==10)
		case (cbit)
			0: begin
					if(!ACK)
						ddata <=#1 rdda[7];
					else
						ddata <=#1 1'bZ;
				end
			1: ddata <=#1 rdda[6];
			2: ddata <=#1 rdda[5];
			3: ddata <=#1 rdda[4];
			4: ddata <=#1 rdda[3];
			5: ddata <=#1 rdda[2];
			6: ddata <=#1 rdda[1];
			7: ddata <=#1 rdda[0];
			8: ddata <=#1 1'bZ;								//ACK bit from the Master  IF ddata <= 1'bZ; , there is a spike in the waveform also last byte shows NACK from Master
			default: ddata <=#1 1'b1;
		endcase
	else if(cSTATE==23)
		case (cbit81)
			0: begin
					if(!ACK)
						ddata <=#1 rdda81[7];
					else
						ddata <=#1 1'bZ;
				end
			1: ddata <=#1 rdda81[6];
			2: ddata <=#1 rdda81[5];
			3: ddata <=#1 rdda81[4];
			4: ddata <=#1 rdda81[3];
			5: ddata <=#1 rdda81[2];
			6: ddata <=#1 rdda81[1];
			7: ddata <=#1 rdda81[0];
			8: ddata <=#1 1'bZ;								//ACK bit from the Master  IF ddata <= 1'bZ; , there is a spike in the waveform also last byte shows NACK from Master
			default: ddata <=#1 1'b1;
		endcase
	else if(cSTATE==24)
		case (cbit75)
			0: begin
					if(!ACK)
						ddata <=#1 rdda75[7];
					else
						ddata <=#1 1'bZ;
				end
			1: ddata <=#1 rdda75[6];
			2: ddata <=#1 rdda75[5];
			3: ddata <=#1 rdda75[4];
			4: ddata <=#1 rdda75[3];
			5: ddata <=#1 rdda75[2];
			6: ddata <=#1 rdda75[1];
			7: ddata <=#1 rdda75[0];
			8: ddata <=#1 1'bZ;								//ACK bit from the Master  IF ddata <= 1'bZ; , there is a spike in the waveform also last byte shows NACK from Master
			default: ddata <=#1 1'b1;
		endcase
	else
		ddata <=#1 1'b0;
end
always@(posedge SCL)
begin
		if(cSTATE==10)
		begin
			if(cbit==8)
			begin
				cbyte <= cbyte + 1;
				cbit  <= 0;
				rdda  <= dEPRM[cbyte+1];
			end
			else
			begin
				cbyte <= cbyte;
				cbit  <= cbit + 1;
			end
		end
		else
		begin
			cbit  <= 0;
			if(offset_Ra1)
			begin
				rdda <= dEPRM[128];
				cbyte <= 128;
			end
			else
			begin
				rdda <= dEPRM[0];
				cbyte <= 0;
			end
		end
end
always@(posedge SCL)
begin
	if(cSTATE==23)
	begin
		if(cbit81==8)
		begin
			cbyte81 <= cbyte81 + 1;
			cbit81  <= 0;
			rdda81  <= rSP_81[cbyte81+1];
		end
		else
		begin
			cbyte81 <= cbyte81;
			cbit81  <= cbit81 + 1;
		end
	end
	else
	begin
		cbit81  <= 0;
		rdda81  <= rSP_81[0];
		cbyte81 <= 0;
	end
end
always@(posedge SCL)
begin
	if(cSTATE==24)
	begin
		if(cbit75==8)
		begin
			cbyte75 <= cbyte75 + 1;
			cbit75  <= 0;
			rdda75  <= rSP_75[cbyte75+1];
		end
		else
		begin
			cbyte75 <= cbyte75;
			cbit75  <= cbit75 + 1;
		end
	end
	else
	begin
		cbit75 <= 0;
		if(offset_R75) begin
			rdda75 <= rSP_75[5]; cbyte75 <= 5; end
		else begin
			rdda75 <= rSP_75[0]; cbyte75 <= 0; end
	end
end
endmodule
