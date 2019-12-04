LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
LIBRARY UNISIM;
USE UNISIM.VComponents.ALL;

ENTITY detektor IS
	PORT (
		X : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		Y : OUT STD_LOGIC_VECTOR (5 DOWNTO 0));
END detektor;

ARCHITECTURE Behavioral OF detektor IS
	SIGNAL Int_X : INTEGER RANGE 0 TO 15;
BEGIN
	Int_X <= to_integer(unsigned(X));

	PROCESS (Int_X)
	BEGIN
		CASE Int_X IS
			WHEN 0 | 1 | 2 | 3 | 5 | 6 | 7 | 8 | 9 | 10 => Y(0) <= '1';
			WHEN OTHERS => Y(0) <= '0';
		END CASE;
	END PROCESS;

	Y(1) <= '1' WHEN (Int_X <= 3 OR (Int_X >= 5 AND Int_X <= 10)) ELSE
	'0';

	PROCESS (Int_X)
	BEGIN
		IF Int_X <= 3 OR (Int_X >= 5 AND Int_X <= 10) THEN
			Y(2) <= '1';
		ELSE
			Y(2) <= '0';
		END IF;
	END PROCESS;

	WITH Int_X SELECT
		Y(3) <= '1' WHEN 0 | 1 | 2 | 3 | 5 | 6 | 7 | 8 | 9 | 10,
		'0' WHEN OTHERS;

	Y(4) <= '0';
	Y(5) <= '0';

END Behavioral;