--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2i
--  \   \         Application : ISE
--  /   /         Filename : sipo_wf.vhw
-- /___/   /\     Timestamp : Sun May 28 18:24:59 2023
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: sipo_wf
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE STD.TEXTIO.ALL;

ENTITY sipo_wf IS
END sipo_wf;

ARCHITECTURE testbench_arch OF sipo_wf IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT SIPO_2_n
        PORT (
            CLK : In std_logic;
            D_IN : In std_logic;
            EN : In std_logic;
            RESET : In std_logic;
            D_OUT : Out std_logic_vector (1 DownTo 0);
            valid_out : Out std_logic
        );
    END COMPONENT;

    SIGNAL CLK : std_logic := '0';
    SIGNAL D_IN : std_logic := '0';
    SIGNAL EN : std_logic := '0';
    SIGNAL RESET : std_logic := '0';
    SIGNAL D_OUT : std_logic_vector (1 DownTo 0) := "00";
    SIGNAL valid_out : std_logic := '0';

    constant PERIOD : time := 200 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 100 ns;

    BEGIN
        UUT : SIPO_2_n
        PORT MAP (
            CLK => CLK,
            D_IN => D_IN,
            EN => EN,
            RESET => RESET,
            D_OUT => D_OUT,
            valid_out => valid_out
        );

        PROCESS    -- clock process for CLK
        BEGIN
            WAIT for OFFSET;
            CLOCK_LOOP : LOOP
                CLK <= '0';
                WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
                CLK <= '1';
                WAIT FOR (PERIOD * DUTY_CYCLE);
            END LOOP CLOCK_LOOP;
        END PROCESS;

        PROCESS
            BEGIN
                -- -------------  Current Time:  185ns
                WAIT FOR 185 ns;
                EN <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  385ns
                WAIT FOR 200 ns;
                D_IN <= '1';
                RESET <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  585ns
                WAIT FOR 200 ns;
                D_IN <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  785ns
                WAIT FOR 200 ns;
                D_IN <= '1';
                EN <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  985ns
                WAIT FOR 200 ns;
                D_IN <= '0';
                -- -------------------------------------
                WAIT FOR 215 ns;

            END PROCESS;

    END testbench_arch;

