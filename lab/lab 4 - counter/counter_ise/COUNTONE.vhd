-- COUNT ONE
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity COUNTONE is
    Port ( DIN : in  STD_LOGIC_VECTOR(31 downto 0);
           NUM : out  STD_LOGIC_VECTOR(5 downto 0));
end COUNTONE;

architecture RTL1 of COUNTONE is
begin
	comb: process
		variable TEMP: std_logic_vector(5 downto 0);
	begin
		TEMP := "000000"
		for j in DIN'range loop
			if (DIN(j) = '1') then
				TEMP := TEMP+1;
			end if;
		end loop;
		NUM <= TEMP;
	end process;
end RTL1;

architecture RTL2  of COUNTONE is
begin
	comb: process (DIN)
		constant PARTS: integer := 8;
		variable TEMP : std_logic_vector(5 downto 0);
		variable TEMP1 : std_logic_vector(5 downto 0);
	begin
		TEMP := "000000";
		for j in 0 to PARTS-1 loop
			TEMP1 := "000000";
			for k in 32/PARTS-1 downto 0 loop
			 if (DIN(32/PARTS*j+k)='1') then
				TEMP1 := TEMP1 + 1;
			 end if;
			end loop;
			TEMP := TEMP + TEMP1;
		end loop;
		NUM <= TEMP;
	end process;
end RTL2		

architecture RTL3 of COUNTONE is
begin
	comb: process (DIN)
		constant PARTS: integer := 4;
		variable TEMP : std_logic_vector(5 downto 0);
		variable TEMP1 : std_logic_vector(5 downto 0);
	begin
		TEMP := "000000";
		for j in 0 to PARTS-1 loop
			TEMP1 := "000000";
			for k in 32/PARTS-1 downto 0 loop
			 if (DIN(32/PARTS*j+k)='1') then
				TEMP1 := TEMP1 + 1;
			 end if;
			end loop;
			TEMP := TEMP + TEMP1;
		end loop;
		NUM <= TEMP;
	end process;
end RTL3;

architecture RTL4 of COUNTONE is
begin
	comb: process (DIN)
		variable TEMP : std_logic_vector(5 downto 0);
		variable Cin,Cout : std_logic;
	begin
		TEMP := "000000";
		for j in DIN'reverse_range loop
			 if (DIN(j)='1') then
				Cin := '1';
				for k in TEMP'reverse_range loop
					Cout := TEMP(k) and Cin;
					TEMP(k) := TEMP(k) xor Cin;
					Cin := Cout;
				end loop;
			 end if;
		end loop;
		NUM <= TEMP;
	end process;
end RTL4;