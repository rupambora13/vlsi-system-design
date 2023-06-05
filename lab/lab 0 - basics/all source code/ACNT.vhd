
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ACNT is 
	port(
    	RSTn, EN: in std_logic;
        CNTR: out std_logic_vector(7 downto 0)
    );
end ACNT;

architecture RTL of ACNT is
	component JKFF
    port(
    	CLK, RSTn, J, K: in std_logic;
        Q, Qn : out std_logic
    );
    end component;
    signal FFQ: std_logic_vector(8 downto 0);
    signal FFQn: std_logic_vector(8 downto 0);
    signal VDD: std_logic;
begin
	VDD <= '1';
    FFQn(0) <= EN;
    jk0: for j in 1 to 8 generate
    	b17: JKFF port map(CLK => FFQn(j-1), RSTn => RSTn, J => VDD, K => VDD, Q => FFQ(j), Qn => FFQn(j));
    end generate;
    CNTR <= FFQ(8 downto 1);
end RTL;

