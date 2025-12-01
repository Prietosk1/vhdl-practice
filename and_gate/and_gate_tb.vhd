LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY and_gate_tb IS
END and_gate_tb;

ARCHITECTURE test OF and_gate_tb IS

    SIGNAL A : STD_LOGIC := '0';
    SIGNAL B : STD_LOGIC := '0';
    SIGNAL Y : STD_LOGIC;

BEGIN

    -- Instancia del módulo que vamos a probar
    uut : ENTITY work.and_gate
        PORT MAP(
            A => A,
            B => B,
            Y => Y
        );

    -- Proceso de estímulos
    stim_proc : PROCESS
    BEGIN
        -- Test case 1: A=0, B=0 -> Y=0
        A <= '0';
        B <= '0';
        WAIT FOR 10 ns;
        ASSERT (Y = '0') REPORT "Test case 1 failed" SEVERITY error;

        -- Test case 2: A=0, B=1 -> Y=0
        A <= '0';
        B <= '1';
        WAIT FOR 10 ns;
        ASSERT (Y = '0') REPORT "Test case 2 failed" SEVERITY error;

        -- Test case 3: A=1, B=0 -> Y=0
        A <= '1';
        B <= '0';
        WAIT FOR 10 ns;
        ASSERT (Y = '0') REPORT "Test case 3 failed" SEVERITY error;

        -- Test case 4: A=1, B=1 -> Y=1
        A <= '1';
        B <= '1';
        WAIT FOR 10 ns;
        ASSERT (Y = '1') REPORT "Test case 4 failed" SEVERITY error;

        WAIT; -- Espera indefinidamente
    END PROCESS;

END test;