-- Rupam Bora
-- SPV, MTech, Gauhati University
-- PT-221-839-0001
-- VLSI System Design (ECE 2324)
-- Selector/Multiplexer design in VHDL


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SELECTOR is
	port (
    	A	: in std_logic_vector(15 downto 0);
        SEL	: in std_logic_vector(3 downto 0);
        Y	: out std_logic);
end SELECTOR;

architecture RTL1 of SELECTOR is
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

architecture RTL2 of SELECTOR is
begin
	p1: process(A,SEL)
    begin
    	case SEL is
        	when "0000" => Y <= A(0);
            when "0001" => Y <= A(1);
            when "0010" => Y <= A(2);
            when "0011" => Y <= A(3);
            when "0100" => Y <= A(4);
            when "0101" => Y <= A(5);
            when "0110" => Y <= A(6);
            when "0111" => Y <= A(7);
            when "1000" => Y <= A(8);
            when "1001" => Y <= A(9);
            when "1010" => Y <= A(10);
            when "1011" => Y <= A(11);
            when "1100" => Y <= A(12);
            when "1101" => Y <= A(13);
            when "1110" => Y <= A(14);
            when others => Y <= A(15);
         end case;
     end process;
end RTL2;

architecture RTL3 of SELECTOR is
begin
	with SEL select
    	Y <= A(0) when "0000",
        	 A(1) when "0001",
             A(2) when "0010",
             A(3) when "0011",
             A(4) when "0100",
             A(5) when "0101",
             A(6) when "0110",
             A(7) when "0111",
             A(8) when "1000",
             A(9) when "1001",
             A(10) when "1010",
             A(11) when "1011",
             A(12) when "1100",
             A(13) when "1101",
             A(14) when "1110",
             A(15) when others;
end RTL3;

architecture RTL4 of SELECTOR is 
begin
	Y <= A(conv_integer(SEL));
end RTL4;