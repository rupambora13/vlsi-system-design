`timescale 1ns / 1ps
module dlatch_df(q,d,en);

input en,d;
output q;

assign q = en?d:q;

endmodule
