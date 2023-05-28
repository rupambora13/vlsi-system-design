----------------------------------------------------------------------------------
-- Parallel to Serial Converter
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.pack.all;

entity S2P is
    Port ( RSTn, CLOCK, SERIN : in  STD_LOGIC;
           PERRn, DRDY : out  STD_LOGIC;
           DOUT : out  STD_LOGIC_VECTOR(7 downto 0));
end S2P;

architecture RTL of S2P is
	signal DFF : std_logic_vector(7 downto 0);
	signal CNT : std_logic_vector(2 downto 0);
	signal CNT7_FF, SL_EN, NORMAL: std_logic;
	signal PERRn_FF, PAR_EN, CNT_EN: std_logic;
begin
	regs: process (RSTn, CLOCK)
	begin
		wait until (CLOCK'event and CLOCK = '1');
		if (RSTn = '0') then
			DFF <= (DFF'range => '0');
			NORMAL <= '1';
			PERRn_FF <= '1';
			DRDY <= '0';
			PAR_EN <= '0';
			CNT7_FF <= '0';
			CNT <= "000";
		else 
			if (SL_EN = '1') then
				DFF <= DFF(6 downto 0) & SERIN;
			end if;
			if (PERRn_FF = '0') then
				NORMAL <= '0';
			end if;
			if (CNT_EN = '1') then
				CNT <= CNT + 1;
			end if;
			if (PAR_EN = '1') then
				PERRn_FF <= not (REDUCE_XOR(DFF) xor SERIN);
			end if;
			DRDY <= PAR_EN;
			CNT7_FF <= CNT(2) and CNT(1) and CNT(0);
			PAR_EN <= CNT7_EN;
		end if;
	end process;
	SL_EN <= NORMAL and (CNT7_FF or CNT(2) or CNT(1) or CNT(0));
	CNT_EN <= '1' when (NORMAL = '1') and (PAR_EN = '0') and (CNT7_FF = '0') and (PERRn_FF = '1') and ((CNT = "000" and SERIN = '1') or (CNT /= "000")) else '0';
	PERRn <= PERRn_FF;
	DOUT <= DFF;
end RTL;

