library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FA is
	port(
    	A,B,Cin: in std_logic;
        SUM,Cout: out std_logic
    );
end FA;

architecture RTL_dataflow of FA is
begin
	SUM <= A xor B xor Cin;
    Cout <= (A and B)or(A and Cin)or(B and Cin);
end RTL_dataflow;
