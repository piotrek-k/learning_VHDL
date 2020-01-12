library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity bin_to_bcd_4bit is
    Port ( Bin : in  STD_LOGIC_VECTOR (7 downto 0);
           Bcd : out  STD_LOGIC_VECTOR (11 downto 0));
end bin_to_bcd_4bit;

architecture Behavioral of bin_to_bcd_4bit is
	
	function GET_HUNDREDS (
		Bcd    : in UNSIGNED(7 downto 0))
		return std_logic_vector is
	begin
	
		if(Bcd >= 100 and Bcd < 200) then
			return "0001";
		end if;
		
		if(Bcd >= 200) then
			return "0010";
		end if;
		
		return "0000";
		
	end function GET_HUNDREDS;

	function GET_TENS (
		Bcd_In    : in UNSIGNED(7 downto 0))
		return std_logic_vector is
		
		variable Bcd : UNSIGNED(7 downto 0) := Bcd_In;
	begin
	
		while(Bcd > 100) loop
			Bcd := Bcd - 100;
		end loop;
	
		if(Bcd < 10) then
			return "0000";
		elsif(Bcd < 20) then
			return "0001";
		elsif(Bcd < 30) then
			return "0010";
		elsif(Bcd < 40) then
			return "0011";
		elsif(Bcd < 50) then
			return "0100";
		elsif(Bcd < 60) then
			return "0101";
		elsif(Bcd < 70) then
			return "0110";
		elsif(Bcd < 80) then
			return "0111";
		elsif(Bcd < 90) then
			return "1000";
		elsif(Bcd < 100) then
			return "1001";
		else 
			return "0000";
		end if;
		
	end function GET_TENS;
	
	function GET_UNITS (
		Bcd_In    : in UNSIGNED(7 downto 0))
		return std_logic_vector is
		
		variable Bcd : UNSIGNED(7 downto 0) := Bcd_In;
	begin
	
		while(Bcd > 100) loop
			Bcd := Bcd - 100;
		end loop;
		
		while(Bcd < 100 and Bcd > 10) loop
			Bcd := Bcd - 10;
		end loop;
	
		if(Bcd = 0) then
			return "0000";
		elsif(Bcd = 1) then
			return "0001";
		elsif(Bcd = 2) then
			return "0010";
		elsif(Bcd = 3) then
			return "0011";
		elsif(Bcd = 4) then
			return "0100";
		elsif(Bcd = 5) then
			return "0101";
		elsif(Bcd = 6) then
			return "0110";
		elsif(Bcd = 7) then
			return "0111";
		elsif(Bcd = 8) then
			return "1000";
		elsif(Bcd = 9) then
			return "1001";
		else 
			return "0000";
		end if;
		
	end function GET_UNITS;
	
	signal Bcd_unsigned : UNSIGNED (7 downto 0);
	
begin
	
	process (Bin)
	begin
	
		Bcd_unsigned <= Unsigned(Bin);

	end process;
	
	process (Bcd_unsigned)
	begin
		
		Bcd(3 downto 0) <= GET_UNITS(Bcd_unsigned);
		Bcd(7 downto 4) <= GET_TENS(Bcd_unsigned);
		Bcd(11 downto 8) <= GET_HUNDREDS(Bcd_unsigned);

	end process;

end Behavioral;

