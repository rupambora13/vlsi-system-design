`timescale 1ns / 1ps
// Behavioral Positive Edge Triggered D-Flipflop Asynchronous Active Low Reset
module dff_Pe_ALr(q,d,clk,rst);

input d,clk,rst;
output reg q;

always@(posedge clk, negedge rst)
	if(!rst)
		q <= 1'b0;
	else
		q <= d;

endmodule
