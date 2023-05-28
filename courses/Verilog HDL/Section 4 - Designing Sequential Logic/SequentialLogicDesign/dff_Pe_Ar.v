`timescale 1ns / 1ps
// Behavioral Positive Edge Triggered D-Flipflop Asynchronous Active High Reset
module dff_Pe_Ar(q,d,clk,rst);

input d,clk,rst;
output reg q;

always@(posedge clk or posedge rst)
	if(rst)
		q <= 1'b0;
	else
		q <= d;

endmodule
