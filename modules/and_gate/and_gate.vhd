LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY and_gate IS
    PORT (
        A : IN STD_LOGIC;
        B : IN STD_LOGIC;
        Y : OUT STD_LOGIC);
END and_gate;

ARCHITECTURE Behavioral OF and_gate IS
BEGIN
    Y <= A AND B;
END Behavioral;