LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY counter_tb IS
END ENTITY counter_tb;

ARCHITECTURE tb OF counter_tb IS

    SIGNAL clk : STD_LOGIC := '0';
    SIGNAL reset : STD_LOGIC := '0';
    SIGNAL count : INTEGER;

BEGIN

    -- Instancia del módulo que vamos a probar
    uut : ENTITY work.counter
        PORT MAP(
            clk => clk,
            reset => reset,
            count => count
        );

    -- Generador de reloj 20 ns (50 MHz)
    clk_process : PROCESS
    BEGIN
        clk <= '0';
        WAIT FOR 10 ns;
        clk <= '1';
        WAIT FOR 10 ns;
    END PROCESS;

    -- Proceso de estímulos
    stim_proc : PROCESS
    BEGIN
        -- Reset inicial
        reset <= '1';
        WAIT FOR 25 ns;
        reset <= '0';

        -- Esperar varios ciclos de reloj y verificar el conteo
        WAIT FOR 200 ns;

        -- Verificar que el contador ha contado correctamente
        ASSERT (count = 10) REPORT "Counter test failed: expected 10, got " & INTEGER'image(count) SEVERITY error;

        -- Mostrar éxito
        REPORT "Counter test passed: final count is " & INTEGER'image(count) SEVERITY note;
        WAIT; -- Espera indefinidamente
    END PROCESS;

END tb;