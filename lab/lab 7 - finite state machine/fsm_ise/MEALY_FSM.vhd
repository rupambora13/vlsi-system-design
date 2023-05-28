-- Modeling a Moore FSM
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MEALY_FSM is
    Port ( A, CLOCK : in  STD_LOGIC;
           Z : in  STD_LOGIC);
end MEALY_FSM;

architecture RTL of MEALY_FSM is
	type STATE_TYPE is (ST0,ST1,ST2,ST3);
	signal P_STATE, N_STATE: MEALY_TYPE;
begin
	SEQ_PART: process(CLOCK)
	begin
		-- Synchronous Section
		if CLOCK = '0' then
			P_STATE <= N_STATE;
		end if;
	end process
	
	COMB_PART: process(P_STATE,A)
	begin
		case
			when ST0 =>
				if A = '1' then
					Z <= '1'; N_STATE <=  ST3;
				else
					Z <= '0';
				end if;
			when ST1 =>
				if A = '1' then
					Z <= '0'; N_STATE <=  ST0;
				else
					Z <= '1';
				end if;
			when ST2 =>
				if A = '1' then
					Z <= '0'; 
				else
					Z <= '1'; N_STATE <=  ST1;
				end if;
			when ST3 =>
				if A = '0' then
					N_STATE <=  ST2;
				else
					N_STATE <=  ST1;
				end if;
		end case
	end process COMB_PART;
end RTL;

