library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity HA is
	port(
    	A,B:in std_logic;
        SUM,CARRY:out std_logic
    );
end HA;

architecture RTL_dataflow of HA is
begin
	SUM <= A xor B;
    CARRY <= A and B;
end RTL_dataflow;