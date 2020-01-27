library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity vga_driver is
   port ( 
		CLK_50MHz 	: in  STD_LOGIC;
		RGB   		: in  STD_LOGIC_VECTOR(2 downto 0);
		VGA_R 		: out STD_LOGIC;
		VGA_G 		: out STD_LOGIC;
		VGA_B 		: out STD_LOGIC;
		VGA_HS   	: out STD_LOGIC;
		VGA_VS   	: out STD_LOGIC;
		PIX_X  		: out STD_LOGIC_VECTOR(9 downto 0);
		PIX_Y  		: out STD_LOGIC_VECTOR(8 downto 0) );
end vga_driver;

architecture Behavioral of vga_driver is
	signal clk_25  : STD_LOGIC;
	signal h_cnt 	: integer;
	signal v_cnt 	: integer;
begin
	clk_div : process(CLK_50MHz)
	begin
	
	end process;

	counters : process(clk_25)
	begin
	
	end process;

	h_sync : process(h_cnt)
	begin
	
	end process;

	v_sync : process(v_cnt) 
	begin
	
	end process;
	
	color_pixel : process(h_cnt, v_cnt, RGB)
	begin
	
	end process;
	
end Behavioral;

