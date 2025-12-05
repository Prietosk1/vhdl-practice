LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY counter IS
    PORT (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        count : OUT INTEGER
    );
END ENTITY counter;

ARCHITECTURE Behavioral OF counter IS
    SIGNAL internal_count : INTEGER := 0;
BEGIN

    PROCESS (clk, reset)
    BEGIN
        IF reset = '1' THEN
            internal_count <= 0;
        ELSIF rising_edge(clk) THEN
            internal_count <= internal_count + 1;
        END IF;
    END PROCESS;

    count <= internal_count;

END Behavioral;