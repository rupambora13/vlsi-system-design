----------------------------------------------------------------------------------
-- Parallel to Serial Converter
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--use work.pack.all;

entity P2S is
    Port ( RSTn, CLOCK, PL: in  STD_LOGIC;
			  DIN : in STD_LOGIC_VECTOR(7 downto 0);
           SEROUT : out  STD_LOGIC);
end P2S;

architecture RTL of P2S is
	signal DFF: std_logic_vector(7 downto 0);
	signal START, PARBIT: std_logic;
begin
	p0: process(RSTn, CLOCK)
	begin
		if (RSTn = '0') then
			START <= '0';
			PARBIT <= '0';
			DFF <= (DFF'range => '0');
		elsif (CLOCK'event and CLOCK = '1') then
			if (PL = '1') then
				START <= '1';
				DFF <= DIN;
				PARBIT <= REDUCE_XOR(DIN);
			else
				START <= DFF(7);
				DFF <= DFF(6 downto 0);
				PARBIT <= REDUCE_XOR(DIN);
			end if;
		end if;
	end  process;
	SEROUT <= START;
end RTL;

