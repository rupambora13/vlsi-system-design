library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity JKFF is
	port(
    	CLK, RSTn, J, K: in std_logic;
        Q, Qn : out std_logic
    );
end JKFF;

architecture RTL of JKFF is
	signal FF: std_logic;
begin
	seq0: process (CLK, RSTn)
    	variable JK: std_logic_vector(1 downto 0);
    begin
    	if (RSTn = '0') then
        	FF <= '0';
    	elsif (CLK'event and CLK = '1') then
        	JK := J & K;
        	case JK is 
            	when "01" => FF <= '0';
            	when "10" => FF <= '1';
            	when "11" => FF <= not FF;
            	when others => null;
        	end case;
        end if;
    end process;
    Q <= FF after 2 ns;
    Qn <= not FF after 2 ns;
end RTL;

