library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dff is
    Port (d,clk: in bit; q,qbar: buffer bit);
end dff;

architecture RTL of dff is
    signal d1,d2: bit;
begin
    d1 <= d nand clk;
    d2 <= (not d) nand clk;
    q <= d1 nand qbar;
    qbar <= d2 nand q;
end RTL;
