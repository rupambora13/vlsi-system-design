`timescale 1ns / 1ps
module FA_bh(s,c,a,b,cin);
	input a,b,cin;
	output reg s,c;
	always@(*) // add all inputs to sesitivity list
		begin
			s = a ^ b ^ cin;
			c = a&b | b&cin | cin&a;
		end
endmodule
