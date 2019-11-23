library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity wykrywanie_liczb_if is
    Port ( X : in  STD_LOGIC_VECTOR (3 downto 0);
           Y : out  STD_LOGIC);
end wykrywanie_liczb_if;

architecture Behavioral of wykrywanie_liczb_if is
	signal Int_X : integer;
begin

	Int_X <= to_integer(unsigned(X));
	
	process(X) is
	begin
		if (Int_X > 3 and Int_X <= 7) or Int_X = 11 then
			Y <= '1';
		else
			Y <= '0';
		end if;
	end process;

end Behavioral;

