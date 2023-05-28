-- Rupam Bora
-- SPV, MTech, Gauhati University
-- PT-221-839-0001
-- VLSI System Design (ECE 2324) 
-- Testbench code for Selector/Multiplexer
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity SELECTOR_TB is
end SELECTOR_TB;

architecture TB of SELECTOR_TB is
	component SELECTOR
    port (
    	  A   : in std_logic_vector(15 downto 0);
        SEL	: in std_logic_vector(3 downto 0);
        Y	: out std_logic
    );
    end component;
    signal A: std_logic_vector(15 downto 0);
    signal SEL: std_logic_vector(3 downto 0);
    signal Y,Y1,Y2,Y3,Y4: std_logic;
    constant PERIOD: time := 50 ns;
    constant STROBE: time := 45 ns;
begin
	p0: process
    	variable cnt: std_logic_vector(4 downto 0);
    begin
     for j in 0 to 31 loop
     	cnt := conv_std_logic_vector(j,5);
        SEL <= cnt(3 downto 0);
        Y <= cnt(4);
        A <= (A'range => not cnt(4));
        A(conv_integer(cnt(3 downto 0))) <= cnt(4);
        wait for PERIOD;
     end loop;
     wait;
    end process;
    
    check: process
    	variable err_cnt: integer:=0;
    begin
    	wait for STROBE;
        for j in 0 to 31 loop
        	assert FALSE report "comparing..." severity NOTE;
            if (Y/=Y1)or(Y/=Y2)or(Y/=Y3)or(Y/=Y4)then
            	assert FALSE report "not compared" severity WARNING;
                err_cnt:=err_cnt+1;
            end if;
            wait for PERIOD;
        end loop;
    end process;
    
    selector1: SELECTOR
    	port map(A => A, SEL => SEL, Y => Y1);
    selector2: SELECTOR
    	port map(A => A, SEL => SEL, Y => Y2);
    selector3: SELECTOR
    	port map(A => A, SEL => SEL, Y => Y3);
    selector4: SELECTOR
    	port map(A => A, SEL => SEL, Y => Y4);
end TB;

configuration SELECTOR_CFG of SELECTOR_TB is
	for TB
    	for selector1:  SELECTOR
        	use entity work.SELECTOR(RTL1);
        end for; 
        for selector2:  SELECTOR
        	use entity work.SELECTOR(RTL2);
        end for;
        for selector3:  SELECTOR
        	use entity work.SELECTOR(RTL3);
        end for;
        for selector4:  SELECTOR
        	use entity work.SELECTOR(RTL4);
        end for;
    end for;
end SELECTOR_CFG;

