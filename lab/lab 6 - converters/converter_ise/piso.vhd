-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- entity declaration
entity Piso2bit_mod is
	Port ( clk : in std_logic; -- processing clock
			 reset : in std_logic; -- reset signal
			 valid_in : in std_logic; -- input valid signal
			 din : in std_logic_vector(1 downto 0); -- input data
			 dout : out std_logic; -- output data
			 valid_out : out std_logic); -- output valid signal
end Piso2bit_mod;

-- architecture begins here
architecture Behavioral of Piso2bit_mod is

-- signal declaration
	type state is (rst, s0, s1);
	signal ps, ns : state;
	signal din_s : std_logic_vector(1 downto 0);

	begin
-- process for updating the present state
	process(clk, reset)
		begin
		if reset = '1' then
			ps <= rst;
			din_s <= "00";
		elsif rising_edge(clk) then
			ps <= ns;
			if valid_in = '1' then
				din_s <= din;
			end if;
		end if;
	end process;

-- process for updating the next state
	process(ps, valid_in)
	begin
		case ps is
		when rst => if valid_in = '1' then
		ns <= s0;
		else
		ns <= rst;
		end if;
		when s0 => ns <= s1;
		when s1 => if valid_in = '1' then
		ns <= s0;
		else
		ns <= rst;
		end if;
		when others => ns <= rst;
		end case;
	end process;

	process(ps)
	begin
		case ps is
		when rst => dout <= '0'; -- Here output is 0
		valid_out <= '0';

		when s0 => dout <= din_s(1); -- Here output is 2nd bit of the input
		valid_out <= '1';

		when s1 => dout <= din_s(0); -- Here output is 1st bit of the input
		valid_out <= '1';
	
		when others => dout <= '0';
		valid_out <= '0';

	end case;
	end process;

end Behavioral;