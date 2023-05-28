`timescale 1ns / 1ps
module FA_st2(s,c,a,b,cin);
	input a,b,cin;
	output s,c;
	wire w1,w2,w3;
	HA_df HA1(w1,w2,a,b);
	HA_df HA2(s,w3,w1,w2);
	or or1(c,w2,w3);
endmodule
