--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2i
--  \   \         Application : ISE
--  /   /         Filename : acnt_wf.vhw
-- /___/   /\     Timestamp : Sun May 28 17:25:48 2023
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: acnt_wf
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY acnt_wf IS
END acnt_wf;

ARCHITECTURE testbench_arch OF acnt_wf IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT ACNT
        PORT (
            RSTn : In std_logic;
            EN : In std_logic;
            CNTR : Out std_logic_vector (7 DownTo 0)
        );
    END COMPONENT;

    SIGNAL RSTn : std_logic := '0';
    SIGNAL EN : std_logic := '0';
    SIGNAL CNTR : std_logic_vector (7 DownTo 0) := "00000000";

    BEGIN
        UUT : ACNT
        PORT MAP (
            RSTn => RSTn,
            EN => EN,
            CNTR => CNTR
        );

        PROCESS
            BEGIN
                -- -------------  Current Time:  200ns
                WAIT FOR 200 ns;
                EN <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  300ns
                WAIT FOR 100 ns;
                RSTn <= '1';
                EN <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  400ns
                WAIT FOR 100 ns;
                RSTn <= '0';
                EN <= '1';
                -- -------------------------------------
                WAIT FOR 600 ns;

            END PROCESS;

    END testbench_arch;

