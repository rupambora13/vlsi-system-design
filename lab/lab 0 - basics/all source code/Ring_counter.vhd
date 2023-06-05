-- Ring Counter
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Ring_counter is
    Port ( CLOCK, RESET : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR(3  downto 0));
end Ring_counter;

architecture Behavioral of Ring_counter is
	signal q_tmp: std_logic_vector(3 downto 0):= "0000";
begin
	process(CLOCK,RESET)
		begin
		if RESET = '1' then
			q_tmp <= "0001";
		elsif Rising_edge(CLOCK) then
			q_tmp(1) <= q_tmp(0);
			q_tmp(2) <= q_tmp(1);
			q_tmp(3) <= q_tmp(2);
			q_tmp(0) <= q_tmp(3);
		end if;
	end process;
Q <= q_tmp;
end Behavioral;

