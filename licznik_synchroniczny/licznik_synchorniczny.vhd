LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
LIBRARY UNISIM;
USE UNISIM.VComponents.ALL;

ENTITY licznik_synchorniczny IS
	PORT (
		CLK : IN STD_LOGIC;
		CLR : IN STD_LOGIC;
		MODE : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
		OUTPUT : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
END licznik_synchorniczny;

ARCHITECTURE Behavioral OF licznik_synchorniczny IS
	SIGNAL counter : UNSIGNED(3 DOWNTO 0);
	SIGNAL modulo : std_logic_vector (3 DOWNTO 0);
BEGIN
	PROCESS (CLK, CLR)
	BEGIN
		IF CLR = '1' THEN
			counter <= "0000";
		ELSIF rising_edge(CLK) THEN
			IF counter < to_integer(unsigned(modulo)) THEN
				counter <= counter + 1;
			ELSE
				counter <= "0000";
			END IF;
		END IF;
	END PROCESS;

	OUTPUT <= std_logic_vector(counter);

	PROCESS (MODE)
	BEGIN
		IF MODE = "00" THEN
			modulo <= "0000";
		ELSIF MODE = "10" THEN
			modulo <= "1111";
		ELSIF MODE = "11" THEN
			modulo <= "1001"; --9
		ELSE
			modulo <= "1101"; --13
		END IF;
	END PROCESS;

END Behavioral;