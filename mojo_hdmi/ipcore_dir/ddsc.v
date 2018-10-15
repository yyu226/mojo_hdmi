////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.68d
//  \   \         Application: netgen
//  /   /         Filename: ddsc.v
// /___/   /\     Timestamp: Thu Oct 04 16:27:39 2018
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog "C:/Users/Ying Yu/Desktop/Mojo_v3/mojo_hdmi/ipcore_dir/tmp/_cg/ddsc.ngc" "C:/Users/Ying Yu/Desktop/Mojo_v3/mojo_hdmi/ipcore_dir/tmp/_cg/ddsc.v" 
// Device	: 6slx9tqg144-3
// Input file	: C:/Users/Ying Yu/Desktop/Mojo_v3/mojo_hdmi/ipcore_dir/tmp/_cg/ddsc.ngc
// Output file	: C:/Users/Ying Yu/Desktop/Mojo_v3/mojo_hdmi/ipcore_dir/tmp/_cg/ddsc.v
// # of Modules	: 1
// Design Name	: ddsc
// Xilinx        : C:\Xilinx\14.6\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module ddsc (
  clk, sclr, pinc_in, poff_in, cosine, phase_out
)/* synthesis syn_black_box syn_noprune=1 */;
  input clk;
  input sclr;
  input [31 : 0] pinc_in;
  input [31 : 0] poff_in;
  output [7 : 0] cosine;
  output [31 : 0] phase_out;
  
  // synthesis translate_off
  
  wire sig00000001;
  wire sig00000002;
  wire sig00000003;
  wire sig00000004;
  wire sig00000005;
  wire sig00000006;
  wire sig00000007;
  wire sig00000008;
  wire sig00000009;
  wire sig0000000a;
  wire sig0000000b;
  wire sig0000000c;
  wire sig0000000d;
  wire sig0000000e;
  wire sig0000000f;
  wire sig00000010;
  wire sig00000011;
  wire sig00000012;
  wire sig00000013;
  wire sig00000014;
  wire sig00000015;
  wire sig00000016;
  wire sig00000017;
  wire sig00000018;
  wire sig00000019;
  wire sig0000001a;
  wire sig0000001b;
  wire sig0000001c;
  wire sig0000001d;
  wire sig0000001e;
  wire sig0000001f;
  wire sig00000020;
  wire sig00000021;
  wire sig00000022;
  wire sig00000023;
  wire sig00000024;
  wire sig00000025;
  wire sig00000026;
  wire sig00000027;
  wire sig00000028;
  wire sig00000029;
  wire sig0000002a;
  wire sig0000002b;
  wire sig0000002c;
  wire sig0000002d;
  wire sig0000002e;
  wire sig0000002f;
  wire sig00000030;
  wire sig00000031;
  wire sig00000032;
  wire sig00000033;
  wire sig00000034;
  wire sig00000035;
  wire sig00000036;
  wire sig00000037;
  wire sig00000038;
  wire sig00000039;
  wire sig0000003a;
  wire sig0000003b;
  wire sig0000003c;
  wire sig0000003d;
  wire sig0000003e;
  wire sig0000003f;
  wire sig00000040;
  wire sig00000041;
  wire sig00000042;
  wire sig00000043;
  wire sig00000044;
  wire sig00000045;
  wire sig00000046;
  wire sig00000047;
  wire sig00000048;
  wire sig00000049;
  wire sig0000004a;
  wire sig0000004b;
  wire sig0000004c;
  wire sig0000004d;
  wire sig0000004e;
  wire sig0000004f;
  wire sig00000050;
  wire sig00000051;
  wire sig00000052;
  wire sig00000053;
  wire sig00000054;
  wire sig00000055;
  wire sig00000056;
  wire sig00000057;
  wire sig00000058;
  wire sig00000059;
  wire sig0000005a;
  wire sig0000005b;
  wire sig0000005c;
  wire sig0000005d;
  wire sig0000005e;
  wire sig0000005f;
  wire sig00000060;
  wire sig00000061;
  wire sig00000062;
  wire sig00000063;
  wire sig00000064;
  wire sig00000065;
  wire sig00000066;
  wire sig00000067;
  wire sig00000068;
  wire sig00000069;
  wire sig0000006a;
  wire sig0000006b;
  wire sig0000006c;
  wire sig0000006d;
  wire sig0000006e;
  wire sig0000006f;
  wire sig00000070;
  wire sig00000071;
  wire sig00000072;
  wire sig00000073;
  wire sig00000074;
  wire sig00000075;
  wire sig00000076;
  wire sig00000077;
  wire sig00000078;
  wire sig00000079;
  wire sig0000007a;
  wire sig0000007b;
  wire sig0000007c;
  wire sig0000007d;
  wire sig0000007e;
  wire sig0000007f;
  wire sig00000080;
  wire sig00000081;
  wire sig00000082;
  wire sig00000083;
  wire sig00000084;
  wire sig00000085;
  wire sig00000086;
  wire sig00000087;
  wire sig00000088;
  wire sig00000089;
  wire sig0000008a;
  wire sig0000008b;
  wire sig0000008c;
  wire sig0000008d;
  wire sig0000008e;
  wire sig0000008f;
  wire sig00000090;
  wire sig00000091;
  wire sig00000092;
  wire sig00000093;
  wire sig00000094;
  wire sig00000095;
  wire sig00000096;
  wire sig00000097;
  wire sig00000098;
  wire sig00000099;
  wire sig0000009a;
  wire sig0000009b;
  wire sig0000009c;
  wire sig0000009d;
  wire sig0000009e;
  wire sig0000009f;
  wire sig000000a0;
  wire sig000000a1;
  wire sig000000a2;
  wire sig000000a3;
  wire sig000000a4;
  wire sig000000a5;
  wire sig000000a6;
  wire sig000000a7;
  wire sig000000a8;
  wire sig000000a9;
  wire sig000000aa;
  wire sig000000ab;
  wire sig000000ac;
  wire sig000000ad;
  wire sig000000ae;
  wire sig000000af;
  wire sig000000b0;
  wire sig000000b1;
  wire sig000000b2;
  wire sig000000b3;
  wire sig000000b4;
  wire sig000000b5;
  wire sig000000b6;
  wire sig000000b7;
  wire sig000000b8;
  wire sig000000b9;
  wire sig000000ba;
  wire sig000000bb;
  wire sig000000bc;
  wire sig000000bd;
  wire sig000000be;
  wire sig000000bf;
  wire sig000000c0;
  wire sig000000c1;
  wire sig000000c2;
  wire sig000000c3;
  wire sig000000c4;
  wire sig000000c5;
  wire sig000000c6;
  wire \blk00000044/sig00000166 ;
  wire \blk00000044/sig00000165 ;
  wire \blk00000044/sig00000164 ;
  wire \blk00000044/sig00000163 ;
  wire \blk00000044/sig00000162 ;
  wire \blk00000044/sig00000161 ;
  wire \blk00000044/sig00000160 ;
  wire \blk00000044/sig0000015f ;
  wire \blk00000044/sig0000015e ;
  wire \blk00000044/sig0000015d ;
  wire \blk00000044/sig0000015c ;
  wire \blk00000044/sig0000015b ;
  wire \blk00000044/sig0000015a ;
  wire \blk00000044/sig00000159 ;
  wire \blk00000044/sig00000158 ;
  wire \blk00000044/sig00000157 ;
  wire \blk00000044/sig00000156 ;
  wire \blk00000044/sig00000155 ;
  wire \blk00000044/sig00000154 ;
  wire \blk00000044/sig00000153 ;
  wire \blk00000044/sig00000152 ;
  wire \blk00000044/sig00000151 ;
  wire \blk00000044/sig00000150 ;
  wire \blk00000044/sig0000014f ;
  wire \blk00000044/sig0000014e ;
  wire \blk00000044/sig0000014d ;
  wire \blk00000044/sig0000014c ;
  wire \blk00000044/sig0000014b ;
  wire \blk00000044/sig0000014a ;
  wire \blk00000044/sig00000149 ;
  wire \blk00000044/sig00000148 ;
  wire \blk00000044/sig00000147 ;
  wire \blk00000044/sig00000146 ;
  wire \blk00000044/sig00000145 ;
  wire \blk00000044/sig00000144 ;
  wire \blk00000044/sig00000143 ;
  wire \blk00000044/sig00000142 ;
  wire \blk00000044/sig00000141 ;
  wire \blk00000044/sig00000140 ;
  wire \blk00000044/sig0000013f ;
  wire \blk00000044/sig0000013e ;
  wire \blk00000044/sig0000013d ;
  wire \blk00000044/sig0000013c ;
  wire \blk00000044/sig0000013b ;
  wire \blk00000044/sig0000013a ;
  wire \blk00000044/sig00000139 ;
  wire \blk00000044/sig00000138 ;
  wire \blk00000044/sig00000137 ;
  wire \blk00000044/sig00000136 ;
  wire \blk00000044/sig00000135 ;
  wire \blk00000044/sig00000134 ;
  wire \blk00000044/sig00000133 ;
  wire \blk00000044/sig00000132 ;
  wire \blk00000044/sig00000131 ;
  wire \blk00000044/sig00000130 ;
  wire \blk00000044/sig0000012f ;
  wire \blk00000044/sig0000012e ;
  wire \blk00000044/sig0000012d ;
  wire \blk00000044/sig0000012c ;
  wire \blk00000044/sig0000012b ;
  wire \blk00000044/sig0000012a ;
  wire \blk00000044/sig00000129 ;
  wire \blk00000044/sig00000128 ;
  wire \blk000000a5/sig00000207 ;
  wire \blk000000a5/sig00000206 ;
  wire \blk000000a5/sig00000205 ;
  wire \blk000000a5/sig00000204 ;
  wire \blk000000a5/sig00000203 ;
  wire \blk000000a5/sig00000202 ;
  wire \blk000000a5/sig00000201 ;
  wire \blk000000a5/sig00000200 ;
  wire \blk000000a5/sig000001ff ;
  wire \blk000000a5/sig000001fe ;
  wire \blk000000a5/sig000001fd ;
  wire \blk000000a5/sig000001fc ;
  wire \blk000000a5/sig000001fb ;
  wire \blk000000a5/sig000001fa ;
  wire \blk000000a5/sig000001f9 ;
  wire \blk000000a5/sig000001f8 ;
  wire \blk000000a5/sig000001f7 ;
  wire \blk000000a5/sig000001f6 ;
  wire \blk000000a5/sig000001f5 ;
  wire \blk000000a5/sig000001f4 ;
  wire \blk000000a5/sig000001f3 ;
  wire \blk000000a5/sig000001f2 ;
  wire \blk000000a5/sig000001f1 ;
  wire \blk000000a5/sig000001f0 ;
  wire \blk000000a5/sig000001ef ;
  wire \blk000000a5/sig000001ee ;
  wire \blk000000a5/sig000001ed ;
  wire \blk000000a5/sig000001ec ;
  wire \blk000000a5/sig000001eb ;
  wire \blk000000a5/sig000001ea ;
  wire \blk000000a5/sig000001e9 ;
  wire \blk000000a5/sig000001e8 ;
  wire \blk000000a5/sig000001e7 ;
  wire \blk000000a5/sig000001e6 ;
  wire \blk000000a5/sig000001e5 ;
  wire \blk000000a5/sig000001e4 ;
  wire \blk000000a5/sig000001e3 ;
  wire \blk000000a5/sig000001e2 ;
  wire \blk000000a5/sig000001e1 ;
  wire \blk000000a5/sig000001e0 ;
  wire \blk000000a5/sig000001df ;
  wire \blk000000a5/sig000001de ;
  wire \blk000000a5/sig000001dd ;
  wire \blk000000a5/sig000001dc ;
  wire \blk000000a5/sig000001db ;
  wire \blk000000a5/sig000001da ;
  wire \blk000000a5/sig000001d9 ;
  wire \blk000000a5/sig000001d8 ;
  wire \blk000000a5/sig000001d7 ;
  wire \blk000000a5/sig000001d6 ;
  wire \blk000000a5/sig000001d5 ;
  wire \blk000000a5/sig000001d4 ;
  wire \blk000000a5/sig000001d3 ;
  wire \blk000000a5/sig000001d2 ;
  wire \blk000000a5/sig000001d1 ;
  wire \blk000000a5/sig000001d0 ;
  wire \blk000000a5/sig000001cf ;
  wire \blk000000a5/sig000001ce ;
  wire \blk000000a5/sig000001cd ;
  wire \blk000000a5/sig000001cc ;
  wire \blk000000a5/sig000001cb ;
  wire \blk000000a5/sig000001ca ;
  wire \blk000000a5/sig000001c9 ;
  wire \NLW_blk00000167_DOADO<15>_UNCONNECTED ;
  wire \NLW_blk00000167_DOADO<14>_UNCONNECTED ;
  wire \NLW_blk00000167_DOADO<13>_UNCONNECTED ;
  wire \NLW_blk00000167_DOADO<12>_UNCONNECTED ;
  wire \NLW_blk00000167_DOADO<11>_UNCONNECTED ;
  wire \NLW_blk00000167_DOADO<10>_UNCONNECTED ;
  wire \NLW_blk00000167_DOADO<9>_UNCONNECTED ;
  wire \NLW_blk00000167_DOADO<8>_UNCONNECTED ;
  wire \NLW_blk00000167_DOADO<7>_UNCONNECTED ;
  wire \NLW_blk00000167_DOADO<6>_UNCONNECTED ;
  wire \NLW_blk00000167_DOADO<5>_UNCONNECTED ;
  wire \NLW_blk00000167_DOADO<4>_UNCONNECTED ;
  wire \NLW_blk00000167_DOADO<3>_UNCONNECTED ;
  wire \NLW_blk00000167_DOADO<2>_UNCONNECTED ;
  wire \NLW_blk00000167_DOADO<1>_UNCONNECTED ;
  wire \NLW_blk00000167_DOADO<0>_UNCONNECTED ;
  wire \NLW_blk00000167_DOPADOP<1>_UNCONNECTED ;
  wire \NLW_blk00000167_DOPADOP<0>_UNCONNECTED ;
  wire \NLW_blk00000167_DOPBDOP<1>_UNCONNECTED ;
  wire \NLW_blk00000167_DOPBDOP<0>_UNCONNECTED ;
  wire \NLW_blk00000167_ADDRAWRADDR<2>_UNCONNECTED ;
  wire \NLW_blk00000167_ADDRAWRADDR<1>_UNCONNECTED ;
  wire \NLW_blk00000167_ADDRAWRADDR<0>_UNCONNECTED ;
  wire \NLW_blk00000167_DIPBDIP<1>_UNCONNECTED ;
  wire \NLW_blk00000167_DIPBDIP<0>_UNCONNECTED ;
  wire \NLW_blk00000167_DIBDI<15>_UNCONNECTED ;
  wire \NLW_blk00000167_DIBDI<14>_UNCONNECTED ;
  wire \NLW_blk00000167_DIBDI<13>_UNCONNECTED ;
  wire \NLW_blk00000167_DIBDI<12>_UNCONNECTED ;
  wire \NLW_blk00000167_DIBDI<11>_UNCONNECTED ;
  wire \NLW_blk00000167_DIBDI<10>_UNCONNECTED ;
  wire \NLW_blk00000167_DIBDI<9>_UNCONNECTED ;
  wire \NLW_blk00000167_DIBDI<8>_UNCONNECTED ;
  wire \NLW_blk00000167_DIBDI<7>_UNCONNECTED ;
  wire \NLW_blk00000167_DIBDI<6>_UNCONNECTED ;
  wire \NLW_blk00000167_DIBDI<5>_UNCONNECTED ;
  wire \NLW_blk00000167_DIBDI<4>_UNCONNECTED ;
  wire \NLW_blk00000167_DIBDI<3>_UNCONNECTED ;
  wire \NLW_blk00000167_DIBDI<2>_UNCONNECTED ;
  wire \NLW_blk00000167_DIBDI<1>_UNCONNECTED ;
  wire \NLW_blk00000167_DIBDI<0>_UNCONNECTED ;
  wire \NLW_blk00000167_DIADI<15>_UNCONNECTED ;
  wire \NLW_blk00000167_DIADI<14>_UNCONNECTED ;
  wire \NLW_blk00000167_DIADI<13>_UNCONNECTED ;
  wire \NLW_blk00000167_DIADI<12>_UNCONNECTED ;
  wire \NLW_blk00000167_DIADI<11>_UNCONNECTED ;
  wire \NLW_blk00000167_DIADI<10>_UNCONNECTED ;
  wire \NLW_blk00000167_DIADI<9>_UNCONNECTED ;
  wire \NLW_blk00000167_DIADI<8>_UNCONNECTED ;
  wire \NLW_blk00000167_ADDRBRDADDR<2>_UNCONNECTED ;
  wire \NLW_blk00000167_ADDRBRDADDR<1>_UNCONNECTED ;
  wire \NLW_blk00000167_ADDRBRDADDR<0>_UNCONNECTED ;
  wire \NLW_blk00000167_DOBDO<15>_UNCONNECTED ;
  wire \NLW_blk00000167_DOBDO<14>_UNCONNECTED ;
  wire \NLW_blk00000167_DOBDO<13>_UNCONNECTED ;
  wire \NLW_blk00000167_DOBDO<12>_UNCONNECTED ;
  wire \NLW_blk00000167_DOBDO<11>_UNCONNECTED ;
  wire \NLW_blk00000167_DOBDO<10>_UNCONNECTED ;
  wire \NLW_blk00000167_DOBDO<9>_UNCONNECTED ;
  wire \NLW_blk00000167_DOBDO<8>_UNCONNECTED ;
  wire \NLW_blk00000167_DIPADIP<1>_UNCONNECTED ;
  wire [31 : 0] \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 ;
  assign
    phase_out[31] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [31],
    phase_out[30] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [30],
    phase_out[29] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [29],
    phase_out[28] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [28],
    phase_out[27] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [27],
    phase_out[26] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [26],
    phase_out[25] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [25],
    phase_out[24] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [24],
    phase_out[23] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [23],
    phase_out[22] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [22],
    phase_out[21] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [21],
    phase_out[20] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [20],
    phase_out[19] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [19],
    phase_out[18] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [18],
    phase_out[17] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [17],
    phase_out[16] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [16],
    phase_out[15] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [15],
    phase_out[14] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [14],
    phase_out[13] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [13],
    phase_out[12] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [12],
    phase_out[11] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [11],
    phase_out[10] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [10],
    phase_out[9] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [9],
    phase_out[8] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [8],
    phase_out[7] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [7],
    phase_out[6] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [6],
    phase_out[5] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [5],
    phase_out[4] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [4],
    phase_out[3] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [3],
    phase_out[2] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [2],
    phase_out[1] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [1],
    phase_out[0] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [0];
  VCC   blk00000001 (
    .P(sig00000001)
  );
  GND   blk00000002 (
    .G(sig00000002)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000003 (
    .C(clk),
    .D(poff_in[31]),
    .Q(sig00000084)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000004 (
    .C(clk),
    .D(poff_in[30]),
    .Q(sig00000083)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000005 (
    .C(clk),
    .D(poff_in[29]),
    .Q(sig00000082)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000006 (
    .C(clk),
    .D(poff_in[28]),
    .Q(sig00000081)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000007 (
    .C(clk),
    .D(poff_in[27]),
    .Q(sig00000080)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000008 (
    .C(clk),
    .D(poff_in[26]),
    .Q(sig0000007f)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000009 (
    .C(clk),
    .D(poff_in[25]),
    .Q(sig0000007e)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000000a (
    .C(clk),
    .D(poff_in[24]),
    .Q(sig0000007d)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000000b (
    .C(clk),
    .D(poff_in[23]),
    .Q(sig0000007c)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000000c (
    .C(clk),
    .D(poff_in[22]),
    .Q(sig0000007b)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000000d (
    .C(clk),
    .D(poff_in[21]),
    .Q(sig0000007a)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000000e (
    .C(clk),
    .D(poff_in[20]),
    .Q(sig00000079)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000000f (
    .C(clk),
    .D(poff_in[19]),
    .Q(sig00000078)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000010 (
    .C(clk),
    .D(poff_in[18]),
    .Q(sig00000077)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000011 (
    .C(clk),
    .D(poff_in[17]),
    .Q(sig00000076)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000012 (
    .C(clk),
    .D(poff_in[16]),
    .Q(sig00000075)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000013 (
    .C(clk),
    .D(poff_in[15]),
    .Q(sig00000074)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000014 (
    .C(clk),
    .D(poff_in[14]),
    .Q(sig00000073)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000015 (
    .C(clk),
    .D(poff_in[13]),
    .Q(sig00000072)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000016 (
    .C(clk),
    .D(poff_in[12]),
    .Q(sig00000071)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000017 (
    .C(clk),
    .D(poff_in[11]),
    .Q(sig00000070)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000018 (
    .C(clk),
    .D(poff_in[10]),
    .Q(sig0000006f)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000019 (
    .C(clk),
    .D(poff_in[9]),
    .Q(sig0000006e)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000001a (
    .C(clk),
    .D(poff_in[8]),
    .Q(sig0000006d)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000001b (
    .C(clk),
    .D(poff_in[7]),
    .Q(sig0000006c)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000001c (
    .C(clk),
    .D(poff_in[6]),
    .Q(sig0000006b)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000001d (
    .C(clk),
    .D(poff_in[5]),
    .Q(sig0000006a)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000001e (
    .C(clk),
    .D(poff_in[4]),
    .Q(sig00000069)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000001f (
    .C(clk),
    .D(poff_in[3]),
    .Q(sig00000068)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000020 (
    .C(clk),
    .D(poff_in[2]),
    .Q(sig00000067)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000021 (
    .C(clk),
    .D(poff_in[1]),
    .Q(sig00000066)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000022 (
    .C(clk),
    .D(poff_in[0]),
    .Q(sig00000065)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000023 (
    .C(clk),
    .D(sig0000000b),
    .R(sclr),
    .Q(sig000000a5)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000024 (
    .C(clk),
    .D(sig0000000c),
    .R(sclr),
    .Q(sig000000a4)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000025 (
    .C(clk),
    .D(sig0000000d),
    .R(sclr),
    .Q(sig000000a3)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000026 (
    .C(clk),
    .D(sig0000000e),
    .R(sclr),
    .Q(sig000000a2)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000027 (
    .C(clk),
    .D(sig0000000f),
    .R(sclr),
    .Q(sig000000a1)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000028 (
    .C(clk),
    .D(sig00000010),
    .R(sclr),
    .Q(sig000000a0)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000029 (
    .C(clk),
    .D(sig00000011),
    .R(sclr),
    .Q(sig0000009f)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk0000002a (
    .C(clk),
    .D(sig00000012),
    .R(sclr),
    .Q(sig0000009e)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk0000002b (
    .C(clk),
    .D(sig00000013),
    .R(sclr),
    .Q(sig0000009d)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk0000002c (
    .C(clk),
    .D(sig00000014),
    .R(sclr),
    .Q(sig0000009c)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk0000002d (
    .C(clk),
    .D(sig00000015),
    .R(sclr),
    .Q(sig0000009b)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk0000002e (
    .C(clk),
    .D(sig00000016),
    .R(sclr),
    .Q(sig0000009a)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk0000002f (
    .C(clk),
    .D(sig00000017),
    .R(sclr),
    .Q(sig00000099)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000030 (
    .C(clk),
    .D(sig00000018),
    .R(sclr),
    .Q(sig00000098)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000031 (
    .C(clk),
    .D(sig00000019),
    .R(sclr),
    .Q(sig00000097)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000032 (
    .C(clk),
    .D(sig0000001a),
    .R(sclr),
    .Q(sig00000096)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000033 (
    .C(clk),
    .D(sig0000001b),
    .R(sclr),
    .Q(sig00000095)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000034 (
    .C(clk),
    .D(sig0000001c),
    .R(sclr),
    .Q(sig00000094)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000035 (
    .C(clk),
    .D(sig0000001d),
    .R(sclr),
    .Q(sig00000093)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000036 (
    .C(clk),
    .D(sig0000001e),
    .R(sclr),
    .Q(sig00000092)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000037 (
    .C(clk),
    .D(sig0000001f),
    .R(sclr),
    .Q(sig00000091)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000038 (
    .C(clk),
    .D(sig00000020),
    .R(sclr),
    .Q(sig00000090)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000039 (
    .C(clk),
    .D(sig00000021),
    .R(sclr),
    .Q(sig0000008f)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk0000003a (
    .C(clk),
    .D(sig00000022),
    .R(sclr),
    .Q(sig0000008e)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk0000003b (
    .C(clk),
    .D(sig00000023),
    .R(sclr),
    .Q(sig0000008d)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk0000003c (
    .C(clk),
    .D(sig00000024),
    .R(sclr),
    .Q(sig0000008c)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk0000003d (
    .C(clk),
    .D(sig00000025),
    .R(sclr),
    .Q(sig0000008b)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk0000003e (
    .C(clk),
    .D(sig00000026),
    .R(sclr),
    .Q(sig0000008a)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk0000003f (
    .C(clk),
    .D(sig00000027),
    .R(sclr),
    .Q(sig00000089)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000040 (
    .C(clk),
    .D(sig00000028),
    .R(sclr),
    .Q(sig00000088)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000041 (
    .C(clk),
    .D(sig00000029),
    .R(sclr),
    .Q(sig00000087)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000042 (
    .C(clk),
    .D(sig0000002a),
    .R(sclr),
    .Q(sig00000086)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000043 (
    .C(clk),
    .D(sig0000002b),
    .R(sclr),
    .Q(sig00000085)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000106 (
    .C(clk),
    .D(sig0000004c),
    .Q(sig000000a6)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000107 (
    .C(clk),
    .D(sig0000004b),
    .Q(sig00000003)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000108 (
    .C(clk),
    .D(sig0000004a),
    .Q(sig00000004)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000109 (
    .C(clk),
    .D(sig00000049),
    .Q(sig00000005)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000010a (
    .C(clk),
    .D(sig00000048),
    .Q(sig00000006)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000010b (
    .C(clk),
    .D(sig00000047),
    .Q(sig00000007)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000010c (
    .C(clk),
    .D(sig00000046),
    .Q(sig00000008)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000010d (
    .C(clk),
    .D(sig00000045),
    .Q(sig00000009)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000010e (
    .C(clk),
    .D(sig00000044),
    .Q(sig0000000a)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000010f (
    .C(clk),
    .D(sig00000043),
    .Q(sig00000064)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000110 (
    .C(clk),
    .D(sig00000042),
    .Q(sig00000063)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000111 (
    .C(clk),
    .D(sig00000041),
    .Q(sig00000062)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000112 (
    .C(clk),
    .D(sig00000040),
    .Q(sig00000061)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000113 (
    .C(clk),
    .D(sig0000003f),
    .Q(sig00000060)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000114 (
    .C(clk),
    .D(sig0000003e),
    .Q(sig0000005f)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000115 (
    .C(clk),
    .D(sig0000003d),
    .Q(sig0000005e)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000116 (
    .C(clk),
    .D(sig0000003c),
    .Q(sig0000005d)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000117 (
    .C(clk),
    .D(sig0000003b),
    .Q(sig0000005c)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000118 (
    .C(clk),
    .D(sig0000003a),
    .Q(sig0000005b)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000119 (
    .C(clk),
    .D(sig00000039),
    .Q(sig0000005a)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000011a (
    .C(clk),
    .D(sig00000038),
    .Q(sig00000059)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000011b (
    .C(clk),
    .D(sig00000037),
    .Q(sig00000058)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000011c (
    .C(clk),
    .D(sig00000036),
    .Q(sig00000057)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000011d (
    .C(clk),
    .D(sig00000035),
    .Q(sig00000056)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000011e (
    .C(clk),
    .D(sig00000034),
    .Q(sig00000055)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000011f (
    .C(clk),
    .D(sig00000033),
    .Q(sig00000054)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000120 (
    .C(clk),
    .D(sig00000032),
    .Q(sig00000053)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000121 (
    .C(clk),
    .D(sig00000031),
    .Q(sig00000052)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000122 (
    .C(clk),
    .D(sig00000030),
    .Q(sig00000051)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000123 (
    .C(clk),
    .D(sig0000002f),
    .Q(sig00000050)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000124 (
    .C(clk),
    .D(sig0000002e),
    .Q(sig0000004f)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000125 (
    .C(clk),
    .D(sig0000002d),
    .Q(sig0000004e)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000126 (
    .C(clk),
    .D(sig0000002c),
    .Q(sig0000004d)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000127 (
    .C(clk),
    .D(sig000000c6),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [31])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000128 (
    .C(clk),
    .D(sig000000c5),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [30])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000129 (
    .C(clk),
    .D(sig000000c4),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [29])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000012a (
    .C(clk),
    .D(sig000000c3),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [28])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000012b (
    .C(clk),
    .D(sig000000c2),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [27])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000012c (
    .C(clk),
    .D(sig000000c1),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [26])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000012d (
    .C(clk),
    .D(sig000000c0),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [25])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000012e (
    .C(clk),
    .D(sig000000bf),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [24])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000012f (
    .C(clk),
    .D(sig000000be),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [23])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000130 (
    .C(clk),
    .D(sig000000bd),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [22])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000131 (
    .C(clk),
    .D(sig000000bc),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [21])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000132 (
    .C(clk),
    .D(sig000000bb),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [20])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000133 (
    .C(clk),
    .D(sig000000ba),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [19])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000134 (
    .C(clk),
    .D(sig000000b9),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [18])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000135 (
    .C(clk),
    .D(sig000000b8),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [17])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000136 (
    .C(clk),
    .D(sig000000b7),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [16])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000137 (
    .C(clk),
    .D(sig000000b6),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [15])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000138 (
    .C(clk),
    .D(sig000000b5),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [14])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000139 (
    .C(clk),
    .D(sig000000b4),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [13])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000013a (
    .C(clk),
    .D(sig000000b3),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [12])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000013b (
    .C(clk),
    .D(sig000000b2),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [11])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000013c (
    .C(clk),
    .D(sig000000b1),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [10])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000013d (
    .C(clk),
    .D(sig000000b0),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [9])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000013e (
    .C(clk),
    .D(sig000000af),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [8])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000013f (
    .C(clk),
    .D(sig000000ae),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [7])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000140 (
    .C(clk),
    .D(sig000000ad),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [6])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000141 (
    .C(clk),
    .D(sig000000ac),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [5])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000142 (
    .C(clk),
    .D(sig000000ab),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [4])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000143 (
    .C(clk),
    .D(sig000000aa),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [3])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000144 (
    .C(clk),
    .D(sig000000a9),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [2])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000145 (
    .C(clk),
    .D(sig000000a8),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [1])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000146 (
    .C(clk),
    .D(sig000000a7),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_2 [0])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000147 (
    .C(clk),
    .D(sig00000003),
    .Q(sig000000c6)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000148 (
    .C(clk),
    .D(sig00000004),
    .Q(sig000000c5)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000149 (
    .C(clk),
    .D(sig00000005),
    .Q(sig000000c4)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000014a (
    .C(clk),
    .D(sig00000006),
    .Q(sig000000c3)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000014b (
    .C(clk),
    .D(sig00000007),
    .Q(sig000000c2)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000014c (
    .C(clk),
    .D(sig00000008),
    .Q(sig000000c1)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000014d (
    .C(clk),
    .D(sig00000009),
    .Q(sig000000c0)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000014e (
    .C(clk),
    .D(sig0000000a),
    .Q(sig000000bf)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000014f (
    .C(clk),
    .D(sig00000064),
    .Q(sig000000be)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000150 (
    .C(clk),
    .D(sig00000063),
    .Q(sig000000bd)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000151 (
    .C(clk),
    .D(sig00000062),
    .Q(sig000000bc)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000152 (
    .C(clk),
    .D(sig00000061),
    .Q(sig000000bb)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000153 (
    .C(clk),
    .D(sig00000060),
    .Q(sig000000ba)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000154 (
    .C(clk),
    .D(sig0000005f),
    .Q(sig000000b9)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000155 (
    .C(clk),
    .D(sig0000005e),
    .Q(sig000000b8)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000156 (
    .C(clk),
    .D(sig0000005d),
    .Q(sig000000b7)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000157 (
    .C(clk),
    .D(sig0000005c),
    .Q(sig000000b6)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000158 (
    .C(clk),
    .D(sig0000005b),
    .Q(sig000000b5)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000159 (
    .C(clk),
    .D(sig0000005a),
    .Q(sig000000b4)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000015a (
    .C(clk),
    .D(sig00000059),
    .Q(sig000000b3)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000015b (
    .C(clk),
    .D(sig00000058),
    .Q(sig000000b2)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000015c (
    .C(clk),
    .D(sig00000057),
    .Q(sig000000b1)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000015d (
    .C(clk),
    .D(sig00000056),
    .Q(sig000000b0)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000015e (
    .C(clk),
    .D(sig00000055),
    .Q(sig000000af)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000015f (
    .C(clk),
    .D(sig00000054),
    .Q(sig000000ae)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000160 (
    .C(clk),
    .D(sig00000053),
    .Q(sig000000ad)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000161 (
    .C(clk),
    .D(sig00000052),
    .Q(sig000000ac)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000162 (
    .C(clk),
    .D(sig00000051),
    .Q(sig000000ab)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000163 (
    .C(clk),
    .D(sig00000050),
    .Q(sig000000aa)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000164 (
    .C(clk),
    .D(sig0000004f),
    .Q(sig000000a9)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000165 (
    .C(clk),
    .D(sig0000004e),
    .Q(sig000000a8)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000166 (
    .C(clk),
    .D(sig0000004d),
    .Q(sig000000a7)
  );
  RAMB8BWER #(
    .INIT_00 ( 256'h585653514F4C4A4745423F3D3A3734322F2C292623201D1A1714110E0B080502 ),
    .INIT_01 ( 256'h7E7E7E7E7D7D7C7C7B7B7A7978777675747371706E6D6B6A68666462605E5C5A ),
    .INIT_02 ( 256'h5A5C5E60626466686A6B6D6E7071737475767778797A7B7B7C7C7D7D7E7E7E7E ),
    .INIT_03 ( 256'h0205080B0E1114171A1D202326292C2F3234373A3D3F4245474A4C4F51535658 ),
    .INIT_04 ( 256'hA8AAADAFB1B4B6B9BBBEC1C3C6C9CCCED1D4D7DADDE0E3E6E9ECEFF2F5F8FBFE ),
    .INIT_05 ( 256'h82828282838384848585868788898A8B8C8D8F9092939596989A9C9EA0A2A4A6 ),
    .INIT_06 ( 256'hA6A4A2A09E9C9A9896959392908F8D8C8B8A8988878685858484838382828282 ),
    .INIT_07 ( 256'hFEFBF8F5F2EFECE9E6E3E0DDDAD7D4D1CECCC9C6C3C1BEBBB9B6B4B1AFADAAA8 ),
    .INIT_08 ( 256'h5A5C5E60626466686A6B6D6E7071737475767778797A7B7B7C7C7D7D7E7E7E7E ),
    .INIT_09 ( 256'h0205080B0E1114171A1D202326292C2F3234373A3D3F4245474A4C4F51535658 ),
    .INIT_0A ( 256'hA8AAADAFB1B4B6B9BBBEC1C3C6C9CCCED1D4D7DADDE0E3E6E9ECEFF2F5F8FBFE ),
    .INIT_0B ( 256'h82828282838384848585868788898A8B8C8D8F9092939596989A9C9EA0A2A4A6 ),
    .INIT_0C ( 256'hA6A4A2A09E9C9A9896959392908F8D8C8B8A8988878685858484838382828282 ),
    .INIT_0D ( 256'hFEFBF8F5F2EFECE9E6E3E0DDDAD7D4D1CECCC9C6C3C1BEBBB9B6B4B1AFADAAA8 ),
    .INIT_0E ( 256'h585653514F4C4A4745423F3D3A3734322F2C292623201D1A1714110E0B080502 ),
    .INIT_0F ( 256'h7E7E7E7E7D7D7C7C7B7B7A7978777675747371706E6D6B6A68666462605E5C5A ),
    .INIT_A ( 18'h00000 ),
    .INIT_B ( 18'h00000 ),
    .WRITE_MODE_A ( "WRITE_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ),
    .DATA_WIDTH_A ( 9 ),
    .DATA_WIDTH_B ( 9 ),
    .DOA_REG ( 1 ),
    .DOB_REG ( 1 ),
    .EN_RSTRAM_A ( "TRUE" ),
    .EN_RSTRAM_B ( "TRUE" ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_10 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_11 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_12 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_13 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_14 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_15 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_16 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_17 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_18 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_19 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .RAM_MODE ( "TDP" ),
    .RST_PRIORITY_A ( "CE" ),
    .RST_PRIORITY_B ( "CE" ),
    .RSTTYPE ( "SYNC" ),
    .SRVAL_A ( 18'h00000 ),
    .SRVAL_B ( 18'h00000 ),
    .INIT_FILE ( "NONE" ),
    .SIM_COLLISION_CHECK ( "ALL" ))
  blk00000167 (
    .RSTBRST(sig00000002),
    .ENBRDEN(sig00000001),
    .REGCEA(sig00000001),
    .ENAWREN(sig00000001),
    .CLKAWRCLK(clk),
    .CLKBRDCLK(clk),
    .REGCEBREGCE(sig00000001),
    .RSTA(sig00000002),
    .WEAWEL({sig00000002, sig00000002}),
    .DOADO({\NLW_blk00000167_DOADO<15>_UNCONNECTED , \NLW_blk00000167_DOADO<14>_UNCONNECTED , \NLW_blk00000167_DOADO<13>_UNCONNECTED , 
\NLW_blk00000167_DOADO<12>_UNCONNECTED , \NLW_blk00000167_DOADO<11>_UNCONNECTED , \NLW_blk00000167_DOADO<10>_UNCONNECTED , 
\NLW_blk00000167_DOADO<9>_UNCONNECTED , \NLW_blk00000167_DOADO<8>_UNCONNECTED , \NLW_blk00000167_DOADO<7>_UNCONNECTED , 
\NLW_blk00000167_DOADO<6>_UNCONNECTED , \NLW_blk00000167_DOADO<5>_UNCONNECTED , \NLW_blk00000167_DOADO<4>_UNCONNECTED , 
\NLW_blk00000167_DOADO<3>_UNCONNECTED , \NLW_blk00000167_DOADO<2>_UNCONNECTED , \NLW_blk00000167_DOADO<1>_UNCONNECTED , 
\NLW_blk00000167_DOADO<0>_UNCONNECTED }),
    .DOPADOP({\NLW_blk00000167_DOPADOP<1>_UNCONNECTED , \NLW_blk00000167_DOPADOP<0>_UNCONNECTED }),
    .DOPBDOP({\NLW_blk00000167_DOPBDOP<1>_UNCONNECTED , \NLW_blk00000167_DOPBDOP<0>_UNCONNECTED }),
    .WEBWEU({sig00000002, sig00000002}),
    .ADDRAWRADDR({sig00000002, sig00000002, sig00000003, sig00000004, sig00000005, sig00000006, sig00000007, sig00000008, sig00000009, sig0000000a, 
\NLW_blk00000167_ADDRAWRADDR<2>_UNCONNECTED , \NLW_blk00000167_ADDRAWRADDR<1>_UNCONNECTED , \NLW_blk00000167_ADDRAWRADDR<0>_UNCONNECTED }),
    .DIPBDIP({\NLW_blk00000167_DIPBDIP<1>_UNCONNECTED , \NLW_blk00000167_DIPBDIP<0>_UNCONNECTED }),
    .DIBDI({\NLW_blk00000167_DIBDI<15>_UNCONNECTED , \NLW_blk00000167_DIBDI<14>_UNCONNECTED , \NLW_blk00000167_DIBDI<13>_UNCONNECTED , 
\NLW_blk00000167_DIBDI<12>_UNCONNECTED , \NLW_blk00000167_DIBDI<11>_UNCONNECTED , \NLW_blk00000167_DIBDI<10>_UNCONNECTED , 
\NLW_blk00000167_DIBDI<9>_UNCONNECTED , \NLW_blk00000167_DIBDI<8>_UNCONNECTED , \NLW_blk00000167_DIBDI<7>_UNCONNECTED , 
\NLW_blk00000167_DIBDI<6>_UNCONNECTED , \NLW_blk00000167_DIBDI<5>_UNCONNECTED , \NLW_blk00000167_DIBDI<4>_UNCONNECTED , 
\NLW_blk00000167_DIBDI<3>_UNCONNECTED , \NLW_blk00000167_DIBDI<2>_UNCONNECTED , \NLW_blk00000167_DIBDI<1>_UNCONNECTED , 
\NLW_blk00000167_DIBDI<0>_UNCONNECTED }),
    .DIADI({\NLW_blk00000167_DIADI<15>_UNCONNECTED , \NLW_blk00000167_DIADI<14>_UNCONNECTED , \NLW_blk00000167_DIADI<13>_UNCONNECTED , 
\NLW_blk00000167_DIADI<12>_UNCONNECTED , \NLW_blk00000167_DIADI<11>_UNCONNECTED , \NLW_blk00000167_DIADI<10>_UNCONNECTED , 
\NLW_blk00000167_DIADI<9>_UNCONNECTED , \NLW_blk00000167_DIADI<8>_UNCONNECTED , sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002}),
    .ADDRBRDADDR({sig00000002, sig00000001, sig00000003, sig00000004, sig00000005, sig00000006, sig00000007, sig00000008, sig00000009, sig0000000a, 
\NLW_blk00000167_ADDRBRDADDR<2>_UNCONNECTED , \NLW_blk00000167_ADDRBRDADDR<1>_UNCONNECTED , \NLW_blk00000167_ADDRBRDADDR<0>_UNCONNECTED }),
    .DOBDO({\NLW_blk00000167_DOBDO<15>_UNCONNECTED , \NLW_blk00000167_DOBDO<14>_UNCONNECTED , \NLW_blk00000167_DOBDO<13>_UNCONNECTED , 
\NLW_blk00000167_DOBDO<12>_UNCONNECTED , \NLW_blk00000167_DOBDO<11>_UNCONNECTED , \NLW_blk00000167_DOBDO<10>_UNCONNECTED , 
\NLW_blk00000167_DOBDO<9>_UNCONNECTED , \NLW_blk00000167_DOBDO<8>_UNCONNECTED , cosine[7], cosine[6], cosine[5], cosine[4], cosine[3], cosine[2], 
cosine[1], cosine[0]}),
    .DIPADIP({\NLW_blk00000167_DIPADIP<1>_UNCONNECTED , sig00000002})
  );
  XORCY   \blk00000044/blk000000a4  (
    .CI(\blk00000044/sig00000165 ),
    .LI(\blk00000044/sig00000166 ),
    .O(sig0000000c)
  );
  MUXCY   \blk00000044/blk000000a3  (
    .CI(\blk00000044/sig00000165 ),
    .DI(sig000000a4),
    .S(\blk00000044/sig00000166 ),
    .O(sig0000000b)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk000000a2  (
    .I0(sig000000a4),
    .I1(pinc_in[31]),
    .O(\blk00000044/sig00000166 )
  );
  XORCY   \blk00000044/blk000000a1  (
    .CI(\blk00000044/sig00000163 ),
    .LI(\blk00000044/sig00000164 ),
    .O(sig0000000d)
  );
  MUXCY   \blk00000044/blk000000a0  (
    .CI(\blk00000044/sig00000163 ),
    .DI(sig000000a3),
    .S(\blk00000044/sig00000164 ),
    .O(\blk00000044/sig00000165 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk0000009f  (
    .I0(sig000000a3),
    .I1(pinc_in[30]),
    .O(\blk00000044/sig00000164 )
  );
  XORCY   \blk00000044/blk0000009e  (
    .CI(\blk00000044/sig00000161 ),
    .LI(\blk00000044/sig00000162 ),
    .O(sig0000000e)
  );
  MUXCY   \blk00000044/blk0000009d  (
    .CI(\blk00000044/sig00000161 ),
    .DI(sig000000a2),
    .S(\blk00000044/sig00000162 ),
    .O(\blk00000044/sig00000163 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk0000009c  (
    .I0(sig000000a2),
    .I1(pinc_in[29]),
    .O(\blk00000044/sig00000162 )
  );
  XORCY   \blk00000044/blk0000009b  (
    .CI(\blk00000044/sig0000015f ),
    .LI(\blk00000044/sig00000160 ),
    .O(sig0000000f)
  );
  MUXCY   \blk00000044/blk0000009a  (
    .CI(\blk00000044/sig0000015f ),
    .DI(sig000000a1),
    .S(\blk00000044/sig00000160 ),
    .O(\blk00000044/sig00000161 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk00000099  (
    .I0(sig000000a1),
    .I1(pinc_in[28]),
    .O(\blk00000044/sig00000160 )
  );
  XORCY   \blk00000044/blk00000098  (
    .CI(\blk00000044/sig0000015d ),
    .LI(\blk00000044/sig0000015e ),
    .O(sig00000010)
  );
  MUXCY   \blk00000044/blk00000097  (
    .CI(\blk00000044/sig0000015d ),
    .DI(sig000000a0),
    .S(\blk00000044/sig0000015e ),
    .O(\blk00000044/sig0000015f )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk00000096  (
    .I0(pinc_in[27]),
    .I1(sig000000a0),
    .O(\blk00000044/sig0000015e )
  );
  XORCY   \blk00000044/blk00000095  (
    .CI(\blk00000044/sig0000015b ),
    .LI(\blk00000044/sig0000015c ),
    .O(sig00000011)
  );
  MUXCY   \blk00000044/blk00000094  (
    .CI(\blk00000044/sig0000015b ),
    .DI(sig0000009f),
    .S(\blk00000044/sig0000015c ),
    .O(\blk00000044/sig0000015d )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk00000093  (
    .I0(pinc_in[26]),
    .I1(sig0000009f),
    .O(\blk00000044/sig0000015c )
  );
  XORCY   \blk00000044/blk00000092  (
    .CI(\blk00000044/sig00000159 ),
    .LI(\blk00000044/sig0000015a ),
    .O(sig00000012)
  );
  MUXCY   \blk00000044/blk00000091  (
    .CI(\blk00000044/sig00000159 ),
    .DI(sig0000009e),
    .S(\blk00000044/sig0000015a ),
    .O(\blk00000044/sig0000015b )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk00000090  (
    .I0(pinc_in[25]),
    .I1(sig0000009e),
    .O(\blk00000044/sig0000015a )
  );
  XORCY   \blk00000044/blk0000008f  (
    .CI(\blk00000044/sig00000157 ),
    .LI(\blk00000044/sig00000158 ),
    .O(sig00000013)
  );
  MUXCY   \blk00000044/blk0000008e  (
    .CI(\blk00000044/sig00000157 ),
    .DI(sig0000009d),
    .S(\blk00000044/sig00000158 ),
    .O(\blk00000044/sig00000159 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk0000008d  (
    .I0(pinc_in[24]),
    .I1(sig0000009d),
    .O(\blk00000044/sig00000158 )
  );
  XORCY   \blk00000044/blk0000008c  (
    .CI(\blk00000044/sig00000155 ),
    .LI(\blk00000044/sig00000156 ),
    .O(sig00000014)
  );
  MUXCY   \blk00000044/blk0000008b  (
    .CI(\blk00000044/sig00000155 ),
    .DI(sig0000009c),
    .S(\blk00000044/sig00000156 ),
    .O(\blk00000044/sig00000157 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk0000008a  (
    .I0(pinc_in[23]),
    .I1(sig0000009c),
    .O(\blk00000044/sig00000156 )
  );
  XORCY   \blk00000044/blk00000089  (
    .CI(\blk00000044/sig00000153 ),
    .LI(\blk00000044/sig00000154 ),
    .O(sig00000015)
  );
  MUXCY   \blk00000044/blk00000088  (
    .CI(\blk00000044/sig00000153 ),
    .DI(sig0000009b),
    .S(\blk00000044/sig00000154 ),
    .O(\blk00000044/sig00000155 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk00000087  (
    .I0(pinc_in[22]),
    .I1(sig0000009b),
    .O(\blk00000044/sig00000154 )
  );
  XORCY   \blk00000044/blk00000086  (
    .CI(\blk00000044/sig00000151 ),
    .LI(\blk00000044/sig00000152 ),
    .O(sig00000016)
  );
  MUXCY   \blk00000044/blk00000085  (
    .CI(\blk00000044/sig00000151 ),
    .DI(sig0000009a),
    .S(\blk00000044/sig00000152 ),
    .O(\blk00000044/sig00000153 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk00000084  (
    .I0(pinc_in[21]),
    .I1(sig0000009a),
    .O(\blk00000044/sig00000152 )
  );
  XORCY   \blk00000044/blk00000083  (
    .CI(\blk00000044/sig0000014f ),
    .LI(\blk00000044/sig00000150 ),
    .O(sig00000017)
  );
  MUXCY   \blk00000044/blk00000082  (
    .CI(\blk00000044/sig0000014f ),
    .DI(sig00000099),
    .S(\blk00000044/sig00000150 ),
    .O(\blk00000044/sig00000151 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk00000081  (
    .I0(pinc_in[20]),
    .I1(sig00000099),
    .O(\blk00000044/sig00000150 )
  );
  XORCY   \blk00000044/blk00000080  (
    .CI(\blk00000044/sig0000014d ),
    .LI(\blk00000044/sig0000014e ),
    .O(sig00000018)
  );
  MUXCY   \blk00000044/blk0000007f  (
    .CI(\blk00000044/sig0000014d ),
    .DI(sig00000098),
    .S(\blk00000044/sig0000014e ),
    .O(\blk00000044/sig0000014f )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk0000007e  (
    .I0(pinc_in[19]),
    .I1(sig00000098),
    .O(\blk00000044/sig0000014e )
  );
  XORCY   \blk00000044/blk0000007d  (
    .CI(\blk00000044/sig0000014b ),
    .LI(\blk00000044/sig0000014c ),
    .O(sig00000019)
  );
  MUXCY   \blk00000044/blk0000007c  (
    .CI(\blk00000044/sig0000014b ),
    .DI(sig00000097),
    .S(\blk00000044/sig0000014c ),
    .O(\blk00000044/sig0000014d )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk0000007b  (
    .I0(pinc_in[18]),
    .I1(sig00000097),
    .O(\blk00000044/sig0000014c )
  );
  XORCY   \blk00000044/blk0000007a  (
    .CI(\blk00000044/sig00000149 ),
    .LI(\blk00000044/sig0000014a ),
    .O(sig0000001a)
  );
  MUXCY   \blk00000044/blk00000079  (
    .CI(\blk00000044/sig00000149 ),
    .DI(sig00000096),
    .S(\blk00000044/sig0000014a ),
    .O(\blk00000044/sig0000014b )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk00000078  (
    .I0(pinc_in[17]),
    .I1(sig00000096),
    .O(\blk00000044/sig0000014a )
  );
  XORCY   \blk00000044/blk00000077  (
    .CI(\blk00000044/sig00000147 ),
    .LI(\blk00000044/sig00000148 ),
    .O(sig0000001b)
  );
  MUXCY   \blk00000044/blk00000076  (
    .CI(\blk00000044/sig00000147 ),
    .DI(sig00000095),
    .S(\blk00000044/sig00000148 ),
    .O(\blk00000044/sig00000149 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk00000075  (
    .I0(pinc_in[16]),
    .I1(sig00000095),
    .O(\blk00000044/sig00000148 )
  );
  XORCY   \blk00000044/blk00000074  (
    .CI(\blk00000044/sig00000145 ),
    .LI(\blk00000044/sig00000146 ),
    .O(sig0000001c)
  );
  MUXCY   \blk00000044/blk00000073  (
    .CI(\blk00000044/sig00000145 ),
    .DI(sig00000094),
    .S(\blk00000044/sig00000146 ),
    .O(\blk00000044/sig00000147 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk00000072  (
    .I0(pinc_in[15]),
    .I1(sig00000094),
    .O(\blk00000044/sig00000146 )
  );
  XORCY   \blk00000044/blk00000071  (
    .CI(\blk00000044/sig00000143 ),
    .LI(\blk00000044/sig00000144 ),
    .O(sig0000001d)
  );
  MUXCY   \blk00000044/blk00000070  (
    .CI(\blk00000044/sig00000143 ),
    .DI(sig00000093),
    .S(\blk00000044/sig00000144 ),
    .O(\blk00000044/sig00000145 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk0000006f  (
    .I0(pinc_in[14]),
    .I1(sig00000093),
    .O(\blk00000044/sig00000144 )
  );
  XORCY   \blk00000044/blk0000006e  (
    .CI(\blk00000044/sig00000141 ),
    .LI(\blk00000044/sig00000142 ),
    .O(sig0000001e)
  );
  MUXCY   \blk00000044/blk0000006d  (
    .CI(\blk00000044/sig00000141 ),
    .DI(sig00000092),
    .S(\blk00000044/sig00000142 ),
    .O(\blk00000044/sig00000143 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk0000006c  (
    .I0(pinc_in[13]),
    .I1(sig00000092),
    .O(\blk00000044/sig00000142 )
  );
  XORCY   \blk00000044/blk0000006b  (
    .CI(\blk00000044/sig0000013f ),
    .LI(\blk00000044/sig00000140 ),
    .O(sig0000001f)
  );
  MUXCY   \blk00000044/blk0000006a  (
    .CI(\blk00000044/sig0000013f ),
    .DI(sig00000091),
    .S(\blk00000044/sig00000140 ),
    .O(\blk00000044/sig00000141 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk00000069  (
    .I0(pinc_in[12]),
    .I1(sig00000091),
    .O(\blk00000044/sig00000140 )
  );
  XORCY   \blk00000044/blk00000068  (
    .CI(\blk00000044/sig0000013d ),
    .LI(\blk00000044/sig0000013e ),
    .O(sig00000020)
  );
  MUXCY   \blk00000044/blk00000067  (
    .CI(\blk00000044/sig0000013d ),
    .DI(sig00000090),
    .S(\blk00000044/sig0000013e ),
    .O(\blk00000044/sig0000013f )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk00000066  (
    .I0(pinc_in[11]),
    .I1(sig00000090),
    .O(\blk00000044/sig0000013e )
  );
  XORCY   \blk00000044/blk00000065  (
    .CI(\blk00000044/sig0000013b ),
    .LI(\blk00000044/sig0000013c ),
    .O(sig00000021)
  );
  MUXCY   \blk00000044/blk00000064  (
    .CI(\blk00000044/sig0000013b ),
    .DI(sig0000008f),
    .S(\blk00000044/sig0000013c ),
    .O(\blk00000044/sig0000013d )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk00000063  (
    .I0(pinc_in[10]),
    .I1(sig0000008f),
    .O(\blk00000044/sig0000013c )
  );
  XORCY   \blk00000044/blk00000062  (
    .CI(\blk00000044/sig00000139 ),
    .LI(\blk00000044/sig0000013a ),
    .O(sig00000022)
  );
  MUXCY   \blk00000044/blk00000061  (
    .CI(\blk00000044/sig00000139 ),
    .DI(sig0000008e),
    .S(\blk00000044/sig0000013a ),
    .O(\blk00000044/sig0000013b )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk00000060  (
    .I0(pinc_in[9]),
    .I1(sig0000008e),
    .O(\blk00000044/sig0000013a )
  );
  XORCY   \blk00000044/blk0000005f  (
    .CI(\blk00000044/sig00000137 ),
    .LI(\blk00000044/sig00000138 ),
    .O(sig00000023)
  );
  MUXCY   \blk00000044/blk0000005e  (
    .CI(\blk00000044/sig00000137 ),
    .DI(sig0000008d),
    .S(\blk00000044/sig00000138 ),
    .O(\blk00000044/sig00000139 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk0000005d  (
    .I0(pinc_in[8]),
    .I1(sig0000008d),
    .O(\blk00000044/sig00000138 )
  );
  XORCY   \blk00000044/blk0000005c  (
    .CI(\blk00000044/sig00000135 ),
    .LI(\blk00000044/sig00000136 ),
    .O(sig00000024)
  );
  MUXCY   \blk00000044/blk0000005b  (
    .CI(\blk00000044/sig00000135 ),
    .DI(sig0000008c),
    .S(\blk00000044/sig00000136 ),
    .O(\blk00000044/sig00000137 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk0000005a  (
    .I0(pinc_in[7]),
    .I1(sig0000008c),
    .O(\blk00000044/sig00000136 )
  );
  XORCY   \blk00000044/blk00000059  (
    .CI(\blk00000044/sig00000133 ),
    .LI(\blk00000044/sig00000134 ),
    .O(sig00000025)
  );
  MUXCY   \blk00000044/blk00000058  (
    .CI(\blk00000044/sig00000133 ),
    .DI(sig0000008b),
    .S(\blk00000044/sig00000134 ),
    .O(\blk00000044/sig00000135 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk00000057  (
    .I0(pinc_in[6]),
    .I1(sig0000008b),
    .O(\blk00000044/sig00000134 )
  );
  XORCY   \blk00000044/blk00000056  (
    .CI(\blk00000044/sig00000131 ),
    .LI(\blk00000044/sig00000132 ),
    .O(sig00000026)
  );
  MUXCY   \blk00000044/blk00000055  (
    .CI(\blk00000044/sig00000131 ),
    .DI(sig0000008a),
    .S(\blk00000044/sig00000132 ),
    .O(\blk00000044/sig00000133 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk00000054  (
    .I0(pinc_in[5]),
    .I1(sig0000008a),
    .O(\blk00000044/sig00000132 )
  );
  XORCY   \blk00000044/blk00000053  (
    .CI(\blk00000044/sig0000012f ),
    .LI(\blk00000044/sig00000130 ),
    .O(sig00000027)
  );
  MUXCY   \blk00000044/blk00000052  (
    .CI(\blk00000044/sig0000012f ),
    .DI(sig00000089),
    .S(\blk00000044/sig00000130 ),
    .O(\blk00000044/sig00000131 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk00000051  (
    .I0(pinc_in[4]),
    .I1(sig00000089),
    .O(\blk00000044/sig00000130 )
  );
  XORCY   \blk00000044/blk00000050  (
    .CI(\blk00000044/sig0000012d ),
    .LI(\blk00000044/sig0000012e ),
    .O(sig00000028)
  );
  MUXCY   \blk00000044/blk0000004f  (
    .CI(\blk00000044/sig0000012d ),
    .DI(sig00000088),
    .S(\blk00000044/sig0000012e ),
    .O(\blk00000044/sig0000012f )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk0000004e  (
    .I0(pinc_in[3]),
    .I1(sig00000088),
    .O(\blk00000044/sig0000012e )
  );
  XORCY   \blk00000044/blk0000004d  (
    .CI(\blk00000044/sig0000012b ),
    .LI(\blk00000044/sig0000012c ),
    .O(sig00000029)
  );
  MUXCY   \blk00000044/blk0000004c  (
    .CI(\blk00000044/sig0000012b ),
    .DI(sig00000087),
    .S(\blk00000044/sig0000012c ),
    .O(\blk00000044/sig0000012d )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk0000004b  (
    .I0(pinc_in[2]),
    .I1(sig00000087),
    .O(\blk00000044/sig0000012c )
  );
  XORCY   \blk00000044/blk0000004a  (
    .CI(\blk00000044/sig00000129 ),
    .LI(\blk00000044/sig0000012a ),
    .O(sig0000002a)
  );
  MUXCY   \blk00000044/blk00000049  (
    .CI(\blk00000044/sig00000129 ),
    .DI(sig00000086),
    .S(\blk00000044/sig0000012a ),
    .O(\blk00000044/sig0000012b )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk00000048  (
    .I0(pinc_in[1]),
    .I1(sig00000086),
    .O(\blk00000044/sig0000012a )
  );
  XORCY   \blk00000044/blk00000047  (
    .CI(sig00000002),
    .LI(\blk00000044/sig00000128 ),
    .O(sig0000002b)
  );
  MUXCY   \blk00000044/blk00000046  (
    .CI(sig00000002),
    .DI(sig00000085),
    .S(\blk00000044/sig00000128 ),
    .O(\blk00000044/sig00000129 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000044/blk00000045  (
    .I0(pinc_in[0]),
    .I1(sig00000085),
    .O(\blk00000044/sig00000128 )
  );
  XORCY   \blk000000a5/blk00000105  (
    .CI(\blk000000a5/sig00000206 ),
    .LI(\blk000000a5/sig00000207 ),
    .O(sig0000004b)
  );
  MUXCY   \blk000000a5/blk00000104  (
    .CI(\blk000000a5/sig00000206 ),
    .DI(sig000000a4),
    .S(\blk000000a5/sig00000207 ),
    .O(sig0000004c)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk00000103  (
    .I0(sig000000a4),
    .I1(sig00000084),
    .O(\blk000000a5/sig00000207 )
  );
  XORCY   \blk000000a5/blk00000102  (
    .CI(\blk000000a5/sig00000204 ),
    .LI(\blk000000a5/sig00000205 ),
    .O(sig0000004a)
  );
  MUXCY   \blk000000a5/blk00000101  (
    .CI(\blk000000a5/sig00000204 ),
    .DI(sig000000a3),
    .S(\blk000000a5/sig00000205 ),
    .O(\blk000000a5/sig00000206 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk00000100  (
    .I0(sig000000a3),
    .I1(sig00000083),
    .O(\blk000000a5/sig00000205 )
  );
  XORCY   \blk000000a5/blk000000ff  (
    .CI(\blk000000a5/sig00000202 ),
    .LI(\blk000000a5/sig00000203 ),
    .O(sig00000049)
  );
  MUXCY   \blk000000a5/blk000000fe  (
    .CI(\blk000000a5/sig00000202 ),
    .DI(sig000000a2),
    .S(\blk000000a5/sig00000203 ),
    .O(\blk000000a5/sig00000204 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000fd  (
    .I0(sig000000a2),
    .I1(sig00000082),
    .O(\blk000000a5/sig00000203 )
  );
  XORCY   \blk000000a5/blk000000fc  (
    .CI(\blk000000a5/sig00000200 ),
    .LI(\blk000000a5/sig00000201 ),
    .O(sig00000048)
  );
  MUXCY   \blk000000a5/blk000000fb  (
    .CI(\blk000000a5/sig00000200 ),
    .DI(sig000000a1),
    .S(\blk000000a5/sig00000201 ),
    .O(\blk000000a5/sig00000202 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000fa  (
    .I0(sig000000a1),
    .I1(sig00000081),
    .O(\blk000000a5/sig00000201 )
  );
  XORCY   \blk000000a5/blk000000f9  (
    .CI(\blk000000a5/sig000001fe ),
    .LI(\blk000000a5/sig000001ff ),
    .O(sig00000047)
  );
  MUXCY   \blk000000a5/blk000000f8  (
    .CI(\blk000000a5/sig000001fe ),
    .DI(sig000000a0),
    .S(\blk000000a5/sig000001ff ),
    .O(\blk000000a5/sig00000200 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000f7  (
    .I0(sig00000080),
    .I1(sig000000a0),
    .O(\blk000000a5/sig000001ff )
  );
  XORCY   \blk000000a5/blk000000f6  (
    .CI(\blk000000a5/sig000001fc ),
    .LI(\blk000000a5/sig000001fd ),
    .O(sig00000046)
  );
  MUXCY   \blk000000a5/blk000000f5  (
    .CI(\blk000000a5/sig000001fc ),
    .DI(sig0000009f),
    .S(\blk000000a5/sig000001fd ),
    .O(\blk000000a5/sig000001fe )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000f4  (
    .I0(sig0000007f),
    .I1(sig0000009f),
    .O(\blk000000a5/sig000001fd )
  );
  XORCY   \blk000000a5/blk000000f3  (
    .CI(\blk000000a5/sig000001fa ),
    .LI(\blk000000a5/sig000001fb ),
    .O(sig00000045)
  );
  MUXCY   \blk000000a5/blk000000f2  (
    .CI(\blk000000a5/sig000001fa ),
    .DI(sig0000009e),
    .S(\blk000000a5/sig000001fb ),
    .O(\blk000000a5/sig000001fc )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000f1  (
    .I0(sig0000007e),
    .I1(sig0000009e),
    .O(\blk000000a5/sig000001fb )
  );
  XORCY   \blk000000a5/blk000000f0  (
    .CI(\blk000000a5/sig000001f8 ),
    .LI(\blk000000a5/sig000001f9 ),
    .O(sig00000044)
  );
  MUXCY   \blk000000a5/blk000000ef  (
    .CI(\blk000000a5/sig000001f8 ),
    .DI(sig0000009d),
    .S(\blk000000a5/sig000001f9 ),
    .O(\blk000000a5/sig000001fa )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000ee  (
    .I0(sig0000007d),
    .I1(sig0000009d),
    .O(\blk000000a5/sig000001f9 )
  );
  XORCY   \blk000000a5/blk000000ed  (
    .CI(\blk000000a5/sig000001f6 ),
    .LI(\blk000000a5/sig000001f7 ),
    .O(sig00000043)
  );
  MUXCY   \blk000000a5/blk000000ec  (
    .CI(\blk000000a5/sig000001f6 ),
    .DI(sig0000009c),
    .S(\blk000000a5/sig000001f7 ),
    .O(\blk000000a5/sig000001f8 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000eb  (
    .I0(sig0000007c),
    .I1(sig0000009c),
    .O(\blk000000a5/sig000001f7 )
  );
  XORCY   \blk000000a5/blk000000ea  (
    .CI(\blk000000a5/sig000001f4 ),
    .LI(\blk000000a5/sig000001f5 ),
    .O(sig00000042)
  );
  MUXCY   \blk000000a5/blk000000e9  (
    .CI(\blk000000a5/sig000001f4 ),
    .DI(sig0000009b),
    .S(\blk000000a5/sig000001f5 ),
    .O(\blk000000a5/sig000001f6 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000e8  (
    .I0(sig0000007b),
    .I1(sig0000009b),
    .O(\blk000000a5/sig000001f5 )
  );
  XORCY   \blk000000a5/blk000000e7  (
    .CI(\blk000000a5/sig000001f2 ),
    .LI(\blk000000a5/sig000001f3 ),
    .O(sig00000041)
  );
  MUXCY   \blk000000a5/blk000000e6  (
    .CI(\blk000000a5/sig000001f2 ),
    .DI(sig0000009a),
    .S(\blk000000a5/sig000001f3 ),
    .O(\blk000000a5/sig000001f4 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000e5  (
    .I0(sig0000007a),
    .I1(sig0000009a),
    .O(\blk000000a5/sig000001f3 )
  );
  XORCY   \blk000000a5/blk000000e4  (
    .CI(\blk000000a5/sig000001f0 ),
    .LI(\blk000000a5/sig000001f1 ),
    .O(sig00000040)
  );
  MUXCY   \blk000000a5/blk000000e3  (
    .CI(\blk000000a5/sig000001f0 ),
    .DI(sig00000099),
    .S(\blk000000a5/sig000001f1 ),
    .O(\blk000000a5/sig000001f2 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000e2  (
    .I0(sig00000079),
    .I1(sig00000099),
    .O(\blk000000a5/sig000001f1 )
  );
  XORCY   \blk000000a5/blk000000e1  (
    .CI(\blk000000a5/sig000001ee ),
    .LI(\blk000000a5/sig000001ef ),
    .O(sig0000003f)
  );
  MUXCY   \blk000000a5/blk000000e0  (
    .CI(\blk000000a5/sig000001ee ),
    .DI(sig00000098),
    .S(\blk000000a5/sig000001ef ),
    .O(\blk000000a5/sig000001f0 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000df  (
    .I0(sig00000078),
    .I1(sig00000098),
    .O(\blk000000a5/sig000001ef )
  );
  XORCY   \blk000000a5/blk000000de  (
    .CI(\blk000000a5/sig000001ec ),
    .LI(\blk000000a5/sig000001ed ),
    .O(sig0000003e)
  );
  MUXCY   \blk000000a5/blk000000dd  (
    .CI(\blk000000a5/sig000001ec ),
    .DI(sig00000097),
    .S(\blk000000a5/sig000001ed ),
    .O(\blk000000a5/sig000001ee )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000dc  (
    .I0(sig00000077),
    .I1(sig00000097),
    .O(\blk000000a5/sig000001ed )
  );
  XORCY   \blk000000a5/blk000000db  (
    .CI(\blk000000a5/sig000001ea ),
    .LI(\blk000000a5/sig000001eb ),
    .O(sig0000003d)
  );
  MUXCY   \blk000000a5/blk000000da  (
    .CI(\blk000000a5/sig000001ea ),
    .DI(sig00000096),
    .S(\blk000000a5/sig000001eb ),
    .O(\blk000000a5/sig000001ec )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000d9  (
    .I0(sig00000076),
    .I1(sig00000096),
    .O(\blk000000a5/sig000001eb )
  );
  XORCY   \blk000000a5/blk000000d8  (
    .CI(\blk000000a5/sig000001e8 ),
    .LI(\blk000000a5/sig000001e9 ),
    .O(sig0000003c)
  );
  MUXCY   \blk000000a5/blk000000d7  (
    .CI(\blk000000a5/sig000001e8 ),
    .DI(sig00000095),
    .S(\blk000000a5/sig000001e9 ),
    .O(\blk000000a5/sig000001ea )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000d6  (
    .I0(sig00000075),
    .I1(sig00000095),
    .O(\blk000000a5/sig000001e9 )
  );
  XORCY   \blk000000a5/blk000000d5  (
    .CI(\blk000000a5/sig000001e6 ),
    .LI(\blk000000a5/sig000001e7 ),
    .O(sig0000003b)
  );
  MUXCY   \blk000000a5/blk000000d4  (
    .CI(\blk000000a5/sig000001e6 ),
    .DI(sig00000094),
    .S(\blk000000a5/sig000001e7 ),
    .O(\blk000000a5/sig000001e8 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000d3  (
    .I0(sig00000074),
    .I1(sig00000094),
    .O(\blk000000a5/sig000001e7 )
  );
  XORCY   \blk000000a5/blk000000d2  (
    .CI(\blk000000a5/sig000001e4 ),
    .LI(\blk000000a5/sig000001e5 ),
    .O(sig0000003a)
  );
  MUXCY   \blk000000a5/blk000000d1  (
    .CI(\blk000000a5/sig000001e4 ),
    .DI(sig00000093),
    .S(\blk000000a5/sig000001e5 ),
    .O(\blk000000a5/sig000001e6 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000d0  (
    .I0(sig00000073),
    .I1(sig00000093),
    .O(\blk000000a5/sig000001e5 )
  );
  XORCY   \blk000000a5/blk000000cf  (
    .CI(\blk000000a5/sig000001e2 ),
    .LI(\blk000000a5/sig000001e3 ),
    .O(sig00000039)
  );
  MUXCY   \blk000000a5/blk000000ce  (
    .CI(\blk000000a5/sig000001e2 ),
    .DI(sig00000092),
    .S(\blk000000a5/sig000001e3 ),
    .O(\blk000000a5/sig000001e4 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000cd  (
    .I0(sig00000072),
    .I1(sig00000092),
    .O(\blk000000a5/sig000001e3 )
  );
  XORCY   \blk000000a5/blk000000cc  (
    .CI(\blk000000a5/sig000001e0 ),
    .LI(\blk000000a5/sig000001e1 ),
    .O(sig00000038)
  );
  MUXCY   \blk000000a5/blk000000cb  (
    .CI(\blk000000a5/sig000001e0 ),
    .DI(sig00000091),
    .S(\blk000000a5/sig000001e1 ),
    .O(\blk000000a5/sig000001e2 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000ca  (
    .I0(sig00000071),
    .I1(sig00000091),
    .O(\blk000000a5/sig000001e1 )
  );
  XORCY   \blk000000a5/blk000000c9  (
    .CI(\blk000000a5/sig000001de ),
    .LI(\blk000000a5/sig000001df ),
    .O(sig00000037)
  );
  MUXCY   \blk000000a5/blk000000c8  (
    .CI(\blk000000a5/sig000001de ),
    .DI(sig00000090),
    .S(\blk000000a5/sig000001df ),
    .O(\blk000000a5/sig000001e0 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000c7  (
    .I0(sig00000070),
    .I1(sig00000090),
    .O(\blk000000a5/sig000001df )
  );
  XORCY   \blk000000a5/blk000000c6  (
    .CI(\blk000000a5/sig000001dc ),
    .LI(\blk000000a5/sig000001dd ),
    .O(sig00000036)
  );
  MUXCY   \blk000000a5/blk000000c5  (
    .CI(\blk000000a5/sig000001dc ),
    .DI(sig0000008f),
    .S(\blk000000a5/sig000001dd ),
    .O(\blk000000a5/sig000001de )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000c4  (
    .I0(sig0000006f),
    .I1(sig0000008f),
    .O(\blk000000a5/sig000001dd )
  );
  XORCY   \blk000000a5/blk000000c3  (
    .CI(\blk000000a5/sig000001da ),
    .LI(\blk000000a5/sig000001db ),
    .O(sig00000035)
  );
  MUXCY   \blk000000a5/blk000000c2  (
    .CI(\blk000000a5/sig000001da ),
    .DI(sig0000008e),
    .S(\blk000000a5/sig000001db ),
    .O(\blk000000a5/sig000001dc )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000c1  (
    .I0(sig0000006e),
    .I1(sig0000008e),
    .O(\blk000000a5/sig000001db )
  );
  XORCY   \blk000000a5/blk000000c0  (
    .CI(\blk000000a5/sig000001d8 ),
    .LI(\blk000000a5/sig000001d9 ),
    .O(sig00000034)
  );
  MUXCY   \blk000000a5/blk000000bf  (
    .CI(\blk000000a5/sig000001d8 ),
    .DI(sig0000008d),
    .S(\blk000000a5/sig000001d9 ),
    .O(\blk000000a5/sig000001da )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000be  (
    .I0(sig0000006d),
    .I1(sig0000008d),
    .O(\blk000000a5/sig000001d9 )
  );
  XORCY   \blk000000a5/blk000000bd  (
    .CI(\blk000000a5/sig000001d6 ),
    .LI(\blk000000a5/sig000001d7 ),
    .O(sig00000033)
  );
  MUXCY   \blk000000a5/blk000000bc  (
    .CI(\blk000000a5/sig000001d6 ),
    .DI(sig0000008c),
    .S(\blk000000a5/sig000001d7 ),
    .O(\blk000000a5/sig000001d8 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000bb  (
    .I0(sig0000006c),
    .I1(sig0000008c),
    .O(\blk000000a5/sig000001d7 )
  );
  XORCY   \blk000000a5/blk000000ba  (
    .CI(\blk000000a5/sig000001d4 ),
    .LI(\blk000000a5/sig000001d5 ),
    .O(sig00000032)
  );
  MUXCY   \blk000000a5/blk000000b9  (
    .CI(\blk000000a5/sig000001d4 ),
    .DI(sig0000008b),
    .S(\blk000000a5/sig000001d5 ),
    .O(\blk000000a5/sig000001d6 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000b8  (
    .I0(sig0000006b),
    .I1(sig0000008b),
    .O(\blk000000a5/sig000001d5 )
  );
  XORCY   \blk000000a5/blk000000b7  (
    .CI(\blk000000a5/sig000001d2 ),
    .LI(\blk000000a5/sig000001d3 ),
    .O(sig00000031)
  );
  MUXCY   \blk000000a5/blk000000b6  (
    .CI(\blk000000a5/sig000001d2 ),
    .DI(sig0000008a),
    .S(\blk000000a5/sig000001d3 ),
    .O(\blk000000a5/sig000001d4 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000b5  (
    .I0(sig0000006a),
    .I1(sig0000008a),
    .O(\blk000000a5/sig000001d3 )
  );
  XORCY   \blk000000a5/blk000000b4  (
    .CI(\blk000000a5/sig000001d0 ),
    .LI(\blk000000a5/sig000001d1 ),
    .O(sig00000030)
  );
  MUXCY   \blk000000a5/blk000000b3  (
    .CI(\blk000000a5/sig000001d0 ),
    .DI(sig00000089),
    .S(\blk000000a5/sig000001d1 ),
    .O(\blk000000a5/sig000001d2 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000b2  (
    .I0(sig00000069),
    .I1(sig00000089),
    .O(\blk000000a5/sig000001d1 )
  );
  XORCY   \blk000000a5/blk000000b1  (
    .CI(\blk000000a5/sig000001ce ),
    .LI(\blk000000a5/sig000001cf ),
    .O(sig0000002f)
  );
  MUXCY   \blk000000a5/blk000000b0  (
    .CI(\blk000000a5/sig000001ce ),
    .DI(sig00000088),
    .S(\blk000000a5/sig000001cf ),
    .O(\blk000000a5/sig000001d0 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000af  (
    .I0(sig00000068),
    .I1(sig00000088),
    .O(\blk000000a5/sig000001cf )
  );
  XORCY   \blk000000a5/blk000000ae  (
    .CI(\blk000000a5/sig000001cc ),
    .LI(\blk000000a5/sig000001cd ),
    .O(sig0000002e)
  );
  MUXCY   \blk000000a5/blk000000ad  (
    .CI(\blk000000a5/sig000001cc ),
    .DI(sig00000087),
    .S(\blk000000a5/sig000001cd ),
    .O(\blk000000a5/sig000001ce )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000ac  (
    .I0(sig00000067),
    .I1(sig00000087),
    .O(\blk000000a5/sig000001cd )
  );
  XORCY   \blk000000a5/blk000000ab  (
    .CI(\blk000000a5/sig000001ca ),
    .LI(\blk000000a5/sig000001cb ),
    .O(sig0000002d)
  );
  MUXCY   \blk000000a5/blk000000aa  (
    .CI(\blk000000a5/sig000001ca ),
    .DI(sig00000086),
    .S(\blk000000a5/sig000001cb ),
    .O(\blk000000a5/sig000001cc )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000a9  (
    .I0(sig00000066),
    .I1(sig00000086),
    .O(\blk000000a5/sig000001cb )
  );
  XORCY   \blk000000a5/blk000000a8  (
    .CI(sig00000002),
    .LI(\blk000000a5/sig000001c9 ),
    .O(sig0000002c)
  );
  MUXCY   \blk000000a5/blk000000a7  (
    .CI(sig00000002),
    .DI(sig00000085),
    .S(\blk000000a5/sig000001c9 ),
    .O(\blk000000a5/sig000001ca )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000a5/blk000000a6  (
    .I0(sig00000065),
    .I1(sig00000085),
    .O(\blk000000a5/sig000001c9 )
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

// synthesis translate_on
