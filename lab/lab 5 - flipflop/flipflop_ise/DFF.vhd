library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DFF is
	port(
    	CLK, D: in std_logic;
        Q: out std_logic
    );
end DFF;

architecture RTL of DFF is
begin
	seq0: process
    begin
    	wait until CLK'event and CLK = '1';
        Q <= D;
    end process;
end RTL;

