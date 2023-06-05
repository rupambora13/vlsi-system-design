-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- entity declaration
entity SIPO_2_n is
port(
		CLK : in STD_LOGIC; -- global clk
		D_IN : in STD_LOGIC; -- serial data in
		EN : in STD_LOGIC; -- enable
		RESET : in STD_LOGIC; -- asynchronous reset
		D_OUT : out STD_LOGIC_VECTOR(1 downto 0); -- parallel data out
		valid_out : out std_logic -- valid out
);
end SIPO_2_n;
-- architecture declaration
architecture RTL of SIPO_2_n is
	signal dout_i : std_logic;
	signal tog : std_logic;
begin
-- process to conevert serial to parallel data
	process (clk, reset)
	begin
		if reset = '1' then
			valid_out <= '0';
			tog <= '0';
			dout_i <= '0';
			D_out <= "00";
		elsif rising_edge(clk)then
			if en = '1' then
				tog <= not tog;
			else
				tog <= '0';
			end if;
				dout_i <= D_IN;
		if tog = '1' then
			D_OUT <= dout_i& D_in;
			valid_out <= '1';
		elsif tog = '0' then
			valid_out <= '0';
		end if;
		end if;
	end process;

end RTL;