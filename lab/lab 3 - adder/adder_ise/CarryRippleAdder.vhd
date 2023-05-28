library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CarryRippleAdder is
	generic(N: in integer:=3);
    port(
    	A,B: in std_logic_vector(N-1 downto 0);
        Cin: in std_logic;
        SUM: out std_logic_vector(N-1 downto 0);
        Cout: out std_logic
    );
end CarryRippleAdder;

architecture RTL of CarryRippleAdder is 
	component FA
    port(
    	A,B,Cin: in std_logic;
        SUM,Cout: out std_logic
    );
    end component;
    signal C: std_logic_vector(A'length-1 downto 1);
begin
	gen: for j in a'range generate
    	genlsb: if j=0 generate
        	fa0: FA port map(A=>A(0), B=>B(0), Cin=>Cin, SUM=>SUM(0), Cout=>C(1));
        end generate;
        genmid: if (j>0) and (j < A'length-1) generate
        	fa0: FA port map(A=>A(j), B=>B(j), Cin=>C(j), SUM=>SUM(j), Cout=>C(j+1));
        end generate;
        genmsb: if j = A'length-1 generate
        	fa0: FA port map(A=>A(j), B=>B(j), Cin=>C(j), SUM=>SUM(j), Cout=>Cout);
        end generate;
    end generate;
end RTL;



