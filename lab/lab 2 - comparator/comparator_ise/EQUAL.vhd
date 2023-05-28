library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity EQUAL is
	generic(N: in integer :=8);
    port(
    A,B	:	in std_logic_vector(N-1 downto 0);
    SAME	:	out std_logic);
end EQUAL;

architecture RTL_FOR of EQUAL is
begin
	p0: process(A,B)
    	variable SAME_SO_FAR: std_logic;
    begin
    	SAME_SO_FAR := '1';
        for i in A'range loop
        	if (A(i)/=B(i)) then
            SAME_SO_FAR := '0';
            exit;
            end if;
        end loop;
		  SAME <= SAME_SO_FAR;
    end process;
end RTL_FOR;

architecture RTL_STRUCTURAL of EQUAL is
	signal EACHBIT: std_logic_vector(A'length-1 downto 0);
begin
	xnor_gen: for i in A'range generate
    	EACHBIT(i) <= not (A(i) xor B(i));
    end generate;
    p0: process (EACHBIT)
    	variable BITSAME: std_logic;
    begin
    	BITSAME:=EACHBIT(i);
        for i in 1 to A'length-1 loop
        BITSAME:=BITSAME and EACHBIT(i);
        end loop;
        SAME <= BITSAME;
    end process;
end RTL_STRUCTURAL;

architecture RTL_OPERATOR of EQUAL is
begin
	SAME <= '1' when A=B else '0';
end RTL_OPERATOR;
