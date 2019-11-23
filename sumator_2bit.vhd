library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity sumator_2bit is
    Port ( x : in  STD_LOGIC_VECTOR (1 downto 0);
           y : in  STD_LOGIC_VECTOR (1 downto 0);
           c_in : in  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (1 downto 0);
           c_out : out  STD_LOGIC);
end sumator_2bit;

architecture Behavioral of sumator_2bit is
	component sumator is
		port(	x, y, c_in: in std_logic;
				s, c_out: out std_logic);
	end component;

	signal c1 : STD_LOGIC;
begin
	
	-- Pierwszy sumator pe³ny
	fa1: sumator port map 
		(x => x(0),
		 y => y(0), 
		 c_in => c_in,
		 s => s(0),
		 c_out => c1);
		 
	fa2: sumator port map 
		(x => x(1),
		 y => y(1), 
		 c_in => c1,
		 s => s(1),
		 c_out => c_out);
			

end Behavioral;

