library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity PS2_Keyboard is
    Port ( DataIn : in  STD_LOGIC_VECTOR (7 downto 0);
           DataRdy : in  STD_LOGIC;
           ascii_code : out  STD_LOGIC_VECTOR (7 downto 0);
			  StartTransmission: out STD_LOGIC);
end PS2_Keyboard;

architecture Behavioral of PS2_Keyboard is
	--SIGNAL ascii_code : STD_LOGIC_VECTOR(7 DOWNTO 0) := x"FF";
begin
	process(DataIn, DataRdy)
	begin
		if(DataRdy = '1') then
			CASE DataIn IS              
				WHEN x"1C" => ascii_code <= x"61"; --a
				WHEN x"32" => ascii_code <= x"62"; --b
				WHEN x"21" => ascii_code <= x"63"; --c
				WHEN x"23" => ascii_code <= x"64"; --d
				WHEN x"24" => ascii_code <= x"65"; --e
				WHEN x"2B" => ascii_code <= x"66"; --f
				WHEN x"34" => ascii_code <= x"67"; --g
				WHEN x"33" => ascii_code <= x"68"; --h
				WHEN x"43" => ascii_code <= x"69"; --i
				WHEN x"3B" => ascii_code <= x"6A"; --j
				WHEN x"42" => ascii_code <= x"6B"; --k
				WHEN x"4B" => ascii_code <= x"6C"; --l
				WHEN x"3A" => ascii_code <= x"6D"; --m
				WHEN x"31" => ascii_code <= x"6E"; --n
				WHEN x"44" => ascii_code <= x"6F"; --o
				WHEN x"4D" => ascii_code <= x"70"; --p
				WHEN x"15" => ascii_code <= x"71"; --q
				WHEN x"2D" => ascii_code <= x"72"; --r
				WHEN x"1B" => ascii_code <= x"73"; --s
				WHEN x"2C" => ascii_code <= x"74"; --t
				WHEN x"3C" => ascii_code <= x"75"; --u
				WHEN x"2A" => ascii_code <= x"76"; --v
				WHEN x"1D" => ascii_code <= x"77"; --w
				WHEN x"22" => ascii_code <= x"78"; --x
				WHEN x"35" => ascii_code <= x"79"; --y
				WHEN x"1A" => ascii_code <= x"7A"; --z
				WHEN OTHERS => ascii_code <= x"00"; --null
			END CASE;
			
			StartTransmission <= '1';
		else
			ascii_code <= x"00";
			StartTransmission <= '0';
		end if;
	end process;
	

end Behavioral;

