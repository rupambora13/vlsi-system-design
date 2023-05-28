`timescale 1ns / 1ps
module HA_bh(s,c,a,b);
	input a,b;
	output reg s,c; // reg is a datatype that holds value
	always @(a,b) // (a,b) sensitivity list
	 begin
		s = a ^ b;
		c = a & b;
	 end
endmodule

// if is reg is declared then datatype is by default wire