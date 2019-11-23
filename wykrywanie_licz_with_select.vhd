library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity wykrywanie_licz_with_select is
    Port ( X : in  STD_LOGIC_VECTOR (3 downto 0);
           Y : out  STD_LOGIC);
end wykrywanie_licz_with_select;

architecture Behavioral of wykrywanie_licz_with_select is
	signal Int_X : integer;
begin

	Int_X <= to_integer(unsigned(X));

	with Int_X select
			Y <= 	'1' when 4 | 5 | 6,
					'0' when others;
				
end Behavioral;

