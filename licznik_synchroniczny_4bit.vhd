library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity licznik_synchroniczny_4bit is
    Port ( CLK : in  STD_LOGIC;
           CLR : in  STD_LOGIC;
           MODULO : in  STD_LOGIC_VECTOR (3 downto 0);
           OUTPUT : out  STD_LOGIC_VECTOR (3 downto 0));
end licznik_synchroniczny_4bit;

architecture Behavioral of licznik_synchroniczny_4bit is
	signal counter : UNSIGNED(3 downto 0);
begin
	
	process(CLK)
	begin
		if rising_edge(CLK) then
			if CLR = '1' then
				OUTPUT <= "0000";
			elsif counter < to_integer(unsigned(MODULO)) then
				counter <= counter + 1;
				OUTPUT <= std_logic_vector(counter);
			else 
				counter <= "0000";
				OUTPUT <= "0000";
			end if;
		end if;
	end process;

end Behavioral;

