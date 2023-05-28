`timescale 1ns / 1ps
module FA_st1(s,c,a,b,cin);
	input a,b,cin;
	output s,c;
	wire w1,w2,w3,w4;
	xor xor1(w1,a,b);
	xor xor2(s,w1,cin);
	and and1(w2,a,b);
	and and1(w3,b,cin);
	and and1(w4,cin,a);
	or or1(c,w2,w3,w4);
endmodule
