--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2i
--  \   \         Application : ISE
--  /   /         Filename : mux_rtl1_wf.vhw
-- /___/   /\     Timestamp : Sun May 28 14:08:24 2023
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: mux_rtl1_wf
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY mux_rtl1_wf IS
END mux_rtl1_wf;

ARCHITECTURE testbench_arch OF mux_rtl1_wf IS
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
                SEL <= "0001";
                -- -------------------------------------
                -- -------------  Current Time:  300ns
                WAIT FOR 100 ns;
                SEL <= "0010";
                -- -------------------------------------
                -- -------------  Current Time:  400ns
                WAIT FOR 100 ns;
                SEL <= "0011";
                -- -------------------------------------
                -- -------------  Current Time:  500ns
                WAIT FOR 100 ns;
                SEL <= "0100";
                -- -------------------------------------
                -- -------------  Current Time:  600ns
                WAIT FOR 100 ns;
                SEL <= "0101";
                -- -------------------------------------
                -- -------------  Current Time:  700ns
                WAIT FOR 100 ns;
                SEL <= "0110";
                -- -------------------------------------
                -- -------------  Current Time:  800ns
                WAIT FOR 100 ns;
                SEL <= "0111";
                -- -------------------------------------
                -- -------------  Current Time:  900ns
                WAIT FOR 100 ns;
                SEL <= "1000";
                -- -------------------------------------
                -- -------------  Current Time:  1000ns
                WAIT FOR 100 ns;
                SEL <= "1001";
                -- -------------------------------------
                -- -------------  Current Time:  1100ns
                WAIT FOR 100 ns;
                SEL <= "1010";
                -- -------------------------------------
                -- -------------  Current Time:  1200ns
                WAIT FOR 100 ns;
                SEL <= "1011";
                -- -------------------------------------
                -- -------------  Current Time:  1300ns
                WAIT FOR 100 ns;
                SEL <= "1100";
                -- -------------------------------------
                -- -------------  Current Time:  1400ns
                WAIT FOR 100 ns;
                SEL <= "1101";
                -- -------------------------------------
                -- -------------  Current Time:  1500ns
                WAIT FOR 100 ns;
                SEL <= "1110";
                -- -------------------------------------
                -- -------------  Current Time:  1600ns
                WAIT FOR 100 ns;
                SEL <= "1111";
                -- -------------------------------------
                WAIT FOR 400 ns;

            END PROCESS;

    END testbench_arch;

