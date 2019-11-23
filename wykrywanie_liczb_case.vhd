library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity wykrywanie_liczb_case is
    Port ( X : in  STD_LOGIC_VECTOR (3 downto 0);
           Y : out  STD_LOGIC);
end wykrywanie_liczb_case;

architecture Dataflow of wykrywanie_liczb_case is
	signal Int_X : integer;
begin
	
	Int_X <= to_integer(unsigned(X));

	process(X)
	begin
		case Int_X is
			when 4 | 5 | 6 => Y <= '1';
			when others 	=> Y <= '0';
		end case;
	end process;

end Dataflow;

