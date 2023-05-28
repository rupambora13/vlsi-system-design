
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity comparator is
	generic(N: in integer :=4);
    port(
    A,B	:	in std_logic_vector(N-1 downto 0);
    SAME	:	out std_logic);
end comparator;

architecture rtl of comparator is
begin
	p0: process(A,B)
    	variable SAME_SO_FAR: std_logic;
    begin
    	SAME_SO_FAR := '1';
        for i in A'range loop
        	if (A(i)/=B(i)) then
            SAME_SO_FAR := '0';
            exit;
         end if;
        end loop;
		  SAME <= SAME_SO_FAR;
    end process;
end rtl;

