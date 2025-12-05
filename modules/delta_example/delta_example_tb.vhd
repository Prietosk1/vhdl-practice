LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY delta_example_tb IS
END delta_example_tb;

ARCHITECTURE tb OF delta_example_tb IS
    SIGNAL S : INTEGER := 0;
BEGIN

    stim_pro : PROCESS
        VARIABLE V : INTEGER := 0;

    BEGIN
        REPORT "=== Inicio del proceso ===";

        -- Primera asignación
        V := 1;
        S <= 1;
        REPORT "Delta 1: V=" & INTEGER'IMAGE(V) & ", S=" & INTEGER'IMAGE(S);

        -- Segunda asignación
        V := 2;
        S <= 2;
        REPORT "Delta 2: V=" & INTEGER'IMAGE(V) & ", S=" & INTEGER'IMAGE(S);

        -- Tercera asignación
        V := 3;
        S <= 3;
        REPORT "Delta 3: V=" & INTEGER'IMAGE(V) & ", S=" & INTEGER'IMAGE(S);

        -- Ahora esperamos una actualización de señales
        WAIT FOR 0 ns;

        REPORT "Después de WAIT FOR de 0 ns: V=" & INTEGER'IMAGE(V) & ", S=" & INTEGER'IMAGE(S);

        WAIT; -- Detener la simulación

    END PROCESS;
END tb;