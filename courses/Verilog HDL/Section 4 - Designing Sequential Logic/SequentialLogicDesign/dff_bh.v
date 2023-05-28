`timescale 1ns / 1ps
// D-Flipflop Behavioral Basic
module dff_bh(q,d,clk);

input d,clk;
output q;

always@(posedge clk)
	if(clk)
		q <= d; 

endmodule
// <= non-blocking statement
// = blocking statement