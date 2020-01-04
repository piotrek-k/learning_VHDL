library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity RS232_Konwerter is
    Port ( Rdy : in  STD_LOGIC;
           DataIn : in  STD_LOGIC_VECTOR (7 downto 0);
           DataOut : out  STD_LOGIC_VECTOR (7 downto 0);
			  Invalid : out STD_LOGIC);
end RS232_Konwerter;

architecture Behavioral of RS232_Konwerter is
	SIGNAL ReceivedValue : integer := 0;
begin

	process(Rdy)
	BEGIN
		if Rdy = '1' then
			ReceivedValue <= to_integer(unsigned(DataIn));
		else
			ReceivedValue <= 0;
		end if;
	END PROCESS;
	
	process(ReceivedValue)
	BEGIN
		if ReceivedValue >= 65 and ReceivedValue <= 90 then
			-- upper to lower
			DataOut <= std_logic_vector(to_unsigned(ReceivedValue + 32, 8));
			Invalid <= '0';
		elsif ReceivedValue >= 97 and ReceivedValue <= 122 then
			-- lower to upper
			DataOut <= std_logic_vector(to_unsigned(ReceivedValue - 32, 8));
			Invalid <= '0';
		elsif ReceivedValue >= 48 and ReceivedValue <= 57 then
			-- no changes
			DataOut <= std_logic_vector(to_unsigned(ReceivedValue, 8));
			Invalid <= '0';
		else
			-- invalid input
			DataOut <= std_logic_vector(to_unsigned(0, 8));
			Invalid <= '1';
		end if;
	END PROCESS;

end Behavioral;

