-- Modelling a Moore FSM
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MOORE_FSM is
	Port ( A, CLOCK : in  STD_LOGIC;
           Z : in  STD_LOGIC);
end MOORE_FSM;

architecture RTL of MOORE_FSM is
	type STATE_TYPE is (ST0,ST1,ST2,ST3);
	signal MOORE_STATE: STATE_TYPE;
begin
	process(CLOCK)
	begin
		if CLOCK = '0' then
			case MOORE_STATE is 
				when ST0 =>
					Z <= '1';
					if A = '1' then
						MOORE_STATE <= ST2;
					end if;
				when ST1 =>
					Z <= '0';
					if A = '1' then
						MOORE_STATE <= ST3;
					end if;
				when ST2 =>
					Z <= '0';
					if A = '0' then
						MOORE_STATE <= ST1;
					else
						MOORE_STATE <= ST3;
					end if;
				when ST3 =>
					Z <= '1';
					if A = '1' then
						MOORE_STATE <= ST0;
					end if;
			end case;
		end if;
	end process
end RTL;

