--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2i
--  \   \         Application : ISE
--  /   /         Filename : mux_rtl1_tb.vhw
-- /___/   /\     Timestamp : Sun May 28 13:58:17 2023
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: mux_rtl1_tb
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY mux_rtl1_tb IS
END mux_rtl1_tb;

ARCHITECTURE testbench_arch OF mux_rtl1_tb IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT mux_rtl1
        PORT (
            A : In std_logic_vector (15 DownTo 0);
            SEL : In std_logic_vector (3 DownTo 0);
            Y : Out std_logic
        );
    END COMPONENT;

    SIGNAL A : std_logic_vector (15 DownTo 0) := "0000000000000000";
    SIGNAL SEL : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL Y : std_logic := '0';

    BEGIN
        UUT : mux_rtl1
        PORT MAP (
            A => A,
            SEL => SEL,
            Y => Y
        );

        PROCESS
            BEGIN
                -- -------------  Current Time:  200ns
                WAIT FOR 200 ns;
                A <= "0000010000010011";
                SEL <= "0010";
                -- -------------------------------------
                -- -------------  Current Time:  300ns
                WAIT FOR 100 ns;
                A <= "0011010000110011";
                SEL <= "0100";
                -- -------------------------------------
                -- -------------  Current Time:  400ns
                WAIT FOR 100 ns;
                A <= "0011011000111011";
                SEL <= "0110";
                -- -------------------------------------
                -- -------------  Current Time:  500ns
                WAIT FOR 100 ns;
                A <= "0011111000111110";
                SEL <= "1000";
                -- -------------------------------------
                -- -------------  Current Time:  600ns
                WAIT FOR 100 ns;
                A <= "0001111001111110";
                SEL <= "1010";
                -- -------------------------------------
                -- -------------  Current Time:  700ns
                WAIT FOR 100 ns;
                A <= "1001101011101100";
                SEL <= "1100";
                -- -------------------------------------
                -- -------------  Current Time:  800ns
                WAIT FOR 100 ns;
                A <= "1101100011101100";
                SEL <= "1110";
                -- -------------------------------------
                -- -------------  Current Time:  900ns
                WAIT FOR 100 ns;
                SEL <= "1100";
                -- -------------------------------------
                WAIT FOR 100 ns;

            END PROCESS;

    END testbench_arch;

