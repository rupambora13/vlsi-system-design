library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DFFQN is
	port(
    	CLK, D: in std_logic;
        Q,Qn: out std_logic
    );
end DFFQN;

architecture RTL of DFFQN is
	signal DFF: std_logic;
begin
	seq0: process
    begin
    	wait until CLK'event and CLK = '1';
        DFF <= D;
    end process;
    Q <= DFF; Qn <= not DFF;
end RTL;

