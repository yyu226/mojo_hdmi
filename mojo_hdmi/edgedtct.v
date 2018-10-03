`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Rising Edge Detector
//////////////////////////////////////////////////////////////////////////////////
module edgedtct(
				input clk,
				input signl,
				output re
    );
wire q1, q2, q3, q4;

FD one(.Q(q1), .C(clk), .D(signl));
FD two(.Q(q2), .C(clk), .D(q1));
FD three(.Q(q3), .C(clk), .D(q2));
FD four(.Q(q4), .C(clk), .D(q3));

assign re = q2 & (~q3);
endmodule
