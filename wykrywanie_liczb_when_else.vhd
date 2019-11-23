library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity wykrywanie_liczb_when_else is
    Port ( X : in STD_LOGIC_VECTOR(3 downto 0);
           Y : out  STD_LOGIC);
end wykrywanie_liczb_when_else;

architecture DF of wykrywanie_liczb_when_else is
	signal Int_X : integer;
begin
	
	Int_X <= to_integer(unsigned(X));
	
	Y <=	'0' when Int_X < 3 else
			'1' when Int_X < 7 else
			'0';

end DF;