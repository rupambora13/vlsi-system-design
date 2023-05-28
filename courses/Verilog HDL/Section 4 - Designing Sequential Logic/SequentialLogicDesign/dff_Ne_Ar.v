`timescale 1ns / 1ps
// Behavioral Negative Edge Trigggered D-Flipflop Asynchronous Active High Reset
module dff_Ne_Ar(q,d,clk,rst);

input d,clk,rst;
output reg q;

always@(negedge clk or posedge rst)
	if(rst)
		q <= 1'b0;
	else
		q <= d;

endmodule
