--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2i
--  \   \         Application : ISE
--  /   /         Filename : clau_wf.vhw
-- /___/   /\     Timestamp : Sun May 28 15:29:56 2023
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: clau_wf
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY clau_wf IS
END clau_wf;

ARCHITECTURE testbench_arch OF clau_wf IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT CLAU
        PORT (
            P : In std_logic_vector (3 DownTo 0);
            G : In std_logic_vector (3 DownTo 0);
            CI : In std_logic;
            CO : Out std_logic_vector (3 DownTo 0);
            GP : Out std_logic;
            GG : Out std_logic
        );
    END COMPONENT;

    SIGNAL P : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL G : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL CI : std_logic := '0';
    SIGNAL CO : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL GP : std_logic := '0';
    SIGNAL GG : std_logic := '0';

    BEGIN
        UUT : CLAU
        PORT MAP (
            P => P,
            G => G,
            CI => CI,
            CO => CO,
            GP => GP,
            GG => GG
        );

        PROCESS
            BEGIN
                -- -------------  Current Time:  200ns
                WAIT FOR 200 ns;
                P <= "0001";
                G <= "1010";
                -- -------------------------------------
                -- -------------  Current Time:  300ns
                WAIT FOR 100 ns;
                P <= "0010";
                G <= "1110";
                -- -------------------------------------
                -- -------------  Current Time:  400ns
                WAIT FOR 100 ns;
                CI <= '1';
                P <= "0011";
                G <= "1100";
                -- -------------------------------------
                -- -------------  Current Time:  500ns
                WAIT FOR 100 ns;
                P <= "0100";
                G <= "0100";
                -- -------------------------------------
                -- -------------  Current Time:  600ns
                WAIT FOR 100 ns;
                P <= "0101";
                G <= "0010";
                -- -------------------------------------
                -- -------------  Current Time:  700ns
                WAIT FOR 100 ns;
                P <= "0110";
                G <= "0011";
                -- -------------------------------------
                -- -------------  Current Time:  800ns
                WAIT FOR 100 ns;
                P <= "0111";
                G <= "0001";
                -- -------------------------------------
                -- -------------  Current Time:  900ns
                WAIT FOR 100 ns;
                P <= "1000";
                G <= "0101";
                -- -------------------------------------
                -- -------------  Current Time:  1000ns
                WAIT FOR 100 ns;
                CI <= '0';
                P <= "1001";
                G <= "1111";
                -- -------------------------------------
                -- -------------  Current Time:  1100ns
                WAIT FOR 100 ns;
                P <= "1010";
                G <= "1011";
                -- -------------------------------------
                -- -------------  Current Time:  1200ns
                WAIT FOR 100 ns;
                P <= "1011";
                -- -------------------------------------
                -- -------------  Current Time:  1300ns
                WAIT FOR 100 ns;
                P <= "1100";
                G <= "0010";
                -- -------------------------------------
                -- -------------  Current Time:  1400ns
                WAIT FOR 100 ns;
                P <= "1101";
                G <= "0100";
                -- -------------------------------------
                -- -------------  Current Time:  1500ns
                WAIT FOR 100 ns;
                CI <= '1';
                P <= "1110";
                -- -------------------------------------
                -- -------------  Current Time:  1600ns
                WAIT FOR 100 ns;
                P <= "1111";
                G <= "1100";
                -- -------------------------------------
                -- -------------  Current Time:  1700ns
                WAIT FOR 100 ns;
                P <= "0110";
                G <= "1111";
                -- -------------------------------------
                -- -------------  Current Time:  1800ns
                WAIT FOR 100 ns;
                CI <= '0';
                P <= "0011";
                G <= "1010";
                -- -------------------------------------
                -- -------------  Current Time:  1900ns
                WAIT FOR 100 ns;
                P <= "0010";
                G <= "1011";
                -- -------------------------------------
                WAIT FOR 100 ns;

            END PROCESS;

    END testbench_arch;

