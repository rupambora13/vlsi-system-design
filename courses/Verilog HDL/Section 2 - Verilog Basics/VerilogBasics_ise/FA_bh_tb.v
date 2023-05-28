`timescale 1ns / 1ps
module FA_bh_tb_v;

	// Inputs
	reg a;
	reg b;
	reg cin;

	// Outputs
	wire s;
	wire c;

	// Instantiate the Unit Under Test (UUT)
	FA_bh uut (.s(s), .c(c), .a(a), .b(b), .cin(cin));

	initial begin
	$monitor ("time=%d \t a=%b \t b=%b \t cin=%b \t s=%b \t c=%b", $time,a,b,cin,s,c);
		// Initialize Inputs
		a = 0;
		b = 0;
		cin = 0;

		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here
		#10 a = 1; // {a,b,cin} = 100
		#10 b = 1; // {a,b,cin} = 110
		#10 cin = 1; // {a,b,cin} = 111
      #10 $stop;  

	end
      
endmodule

