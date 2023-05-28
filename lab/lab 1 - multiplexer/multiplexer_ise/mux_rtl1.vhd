
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux_rtl1 is
	port (
    	A	: in std_logic_vector(15 downto 0);
        SEL	: in std_logic_vector(3 downto 0);
        Y	: out std_logic);
end mux_rtl1;

architecture RTL1 of mux_rtl1 is
begin
	p0: process (A,SEL)
    begin
		if (SEL = "0000") then
        	Y <= A(0);
        elsif (SEL = "0001") then
        	Y <= A(1);
        elsif (SEL = "0010") then
        	Y <= A(2);
        elsif (SEL = "0011") then
        	Y <= A(3);
        elsif (SEL = "0100") then
        	Y <= A(4);
        elsif (SEL = "0101") then
        	Y <= A(5);
        elsif (SEL = "0110") then
        	Y <= A(6);
        elsif (SEL = "0111") then
        	Y <= A(7);
        elsif (SEL = "1000") then
        	Y <= A(8);
        elsif (SEL = "1001") then
        	Y <= A(9);
        elsif (SEL = "1010") then
        	Y <= A(10);
        elsif (SEL = "1011") then
        	Y <= A(11);
        elsif (SEL = "1100") then
        	Y <= A(12);
        elsif (SEL = "1101") then
        	Y <= A(13);
        elsif (SEL = "1110") then
        	Y <= A(14);
        else
        	Y <= A(15);
        end if;
	end process;
end RTL1;