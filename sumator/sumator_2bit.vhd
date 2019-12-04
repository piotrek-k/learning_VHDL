LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
LIBRARY UNISIM;
USE UNISIM.VComponents.ALL;

ENTITY sumator_2bit IS
	PORT (
		X : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
		Y : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
		c_in : IN STD_LOGIC;
		S : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
		c_out : OUT STD_LOGIC);
END sumator_2bit;

ARCHITECTURE Behavioral OF sumator_2bit IS

	COMPONENT sumator IS
		PORT (
			x, y, c_in : IN std_logic;
			s, c_out : OUT std_logic);
	END COMPONENT;

	SIGNAL c1 : STD_LOGIC;
begin
	
	fa1 : sumator PORT MAP
	(
		x => x(0),
		y => y(0),
		c_in => c_in,
		s => s(0),
		c_out => c1);

	fa2 : sumator PORT MAP
	(
		x => x(1),
		y => y(1),
		c_in => c1,
		s => s(1),
		c_out => c_out);

END Behavioral;