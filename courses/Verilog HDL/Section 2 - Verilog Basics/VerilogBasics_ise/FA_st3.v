`timescale 1ns / 1ps
module FA_st3(sum,carry,aa,bb,cc);
	input aa,ba,cc;
	output sum,carry;
	wire w1,w2,w3;
	HA_df HA1(.s(w1),.c(w2),.a(aa),.b(bb));
	HA_df HA2(.s(sum),.c(w3),.a(w1),.b(cc));
	or or1(carry,w2,w3);
endmodule
