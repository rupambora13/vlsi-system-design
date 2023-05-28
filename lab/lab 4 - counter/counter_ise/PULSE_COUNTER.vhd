-- Pulse Counter
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PULSE_COUNTER is
	 generic (MAX_COUNT: NATURAL := 64);
    Port ( CLK,SAMPLE : in  STD_LOGIC;
           COUNT : out  INTEGER range 0 to MAX_COUNT-1;
           OVERFLOW : in  STD_LOGIC);
end PULSE_COUNTER;

architecture RTL of PULSE_COUNTER is
begin
	process(CLK,SAMPLE)
		variable LOCAL_CNTR: NATURAL;
		variable START_COUNTING: BOOLEAN;
	begin
		if SAMPLE'EVENT and SAMPLE = '1' then
			if SAMPLE = '1' then
			-- Reset on rising edge
				--OVERFLOW <= FALSE;
				START_COUNTING := TRUE;
				LOCAL_CNTR := 0;
			elsif SAMPLE = '0' then
				START_COUNTING := FALSE;
			end if;
		elsif CLK'EVENT and CLK = '1' then
			-- Rising edge of clock
			if START_COUNTING then
				LOCAL_CNTR := LOCAL_CNTR + 1;
				if LOCAL_CNTR > MAX_COUNT then
					LOCAL_CNTR := 0;
					--OVERFLOW <= TRUE;
					START_COUNTING := FALSE;
				end if;
			end if;
		end if;
		COUNT <= LOCAL_CNTR;
	end process;
end RTL;

