LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY signal_vs_variable_tb IS
END signal_vs_variable_tb;

ARCHITECTURE tb OF signal_vs_variable_tb IS

    -- señal visible en el VCD (simula un "cable")
    SIGNAL S : INTEGER := 0;

BEGIN
    stim_proc : PROCESS
        VARIABLE V : INTEGER := 0; -- variable local al proceso

    BEGIN
        REPORT "=== Nuevo ciclo ===" SEVERITY note;

        -- Primer cambio
        REPORT "Antes: V=" & INTEGER'IMAGE(V) & ", S=" & INTEGER'IMAGE(S) SEVERITY note;

        -- Actualizamos ambos
        V := V + 1;
        S <= S + 1;

        -- Mostramos los valores después de la asignación
        REPORT "Despues asignar (en el mismo proceso): V=" & INTEGER'IMAGE(V) & ", S=" & INTEGER'IMAGE(S) SEVERITY note;

        -- Esperamos un ciclo de reloj (simulado con WAIT FOR)
        WAIT FOR 10 ns;

        -- Mostramos los valores después de la espera
        REPORT "Despues WAIT FOR: V=" & INTEGER'IMAGE(V) & ", S=" & INTEGER'IMAGE(S) SEVERITY note;

        -- Repetimos 3 ciclos y luego detenemos la simulación
        IF S = 3 THEN
            REPORT "Fin de la simulación" SEVERITY note;
            WAIT; -- Detener la simulación
        END IF;

    END PROCESS;

END tb;