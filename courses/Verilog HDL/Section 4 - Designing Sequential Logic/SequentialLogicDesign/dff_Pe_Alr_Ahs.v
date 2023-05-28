`timescale 1ns / 1ps
// Behavioral Positive Edge Edge Triggered D-Flipflop Asynchronous Active Low Reset & Active High Set
module dff_Pe_Alr_Ahs(q,d,clk,rst,set);

input d,clk,rst,set;
output reg q;

always@(posedge clk, negedge rst, posedge set)
	if(!rst)
		q <= 1'b0;
	else if()
		q <= 1'b1;
	else
		q <= d;

endmodule
