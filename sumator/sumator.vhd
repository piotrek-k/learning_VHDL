LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
LIBRARY UNISIM;
USE UNISIM.VComponents.ALL;

ENTITY sumator IS
	PORT (
		x : IN STD_LOGIC;
		y : IN STD_LOGIC;
		c_in : IN STD_LOGIC;
		s : OUT STD_LOGIC;
		c_out : OUT STD_LOGIC);
END sumator;

ARCHITECTURE Behavioral OF sumator IS
	SIGNAL gate_1_out : STD_LOGIC;
	SIGNAL gate_3_out : STD_LOGIC;
	SIGNAL gate_4_out : STD_LOGIC;
BEGIN
	gate_1_out <= x XOR y;
	s <= gate_1_out XOR c_in;
	gate_3_out <= gate_1_out AND c_in;
	gate_4_out <= x AND y;
	c_out <= gate_3_out OR gate_4_out;
END Behavioral;