library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CLAU is
    Port ( P, G : in  STD_LOGIC_VECTOR(3 downto 0);
           CI : in  STD_LOGIC;
           CO : out  STD_LOGIC_VECTOR(3 downto 0);
           GP, GG : out  STD_LOGIC);
end CLAU;

architecture RTL of CLAU is

begin
	CO(0) <= CI;
	CO(1) <= (CI and P(0)) or 
				G(0);
	CO(2) <= (CI and P(0) and P(1)) or 
				(G(0) and P(1)) or 
				G(1);
	CO(3) <= (CI and P(0) and P(1) and P(2)) or 
				(G(0) and P(1) and P(2)) or 
				(G(1) and P(2)) or 
				G(2);
	GG <= (G(0) and P(1) and P(2) and P(3)) or 
			(G(1) and P(2) and P(3)) or 
			(G(2) and P(3)) or 
			G(2);
	GP <= P(3) and P(2) and P(1) and P(0);
end RTL;

