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
	signal h_cnt 	: integer range 0 to 799 := 0;
	signal v_cnt 	: integer range 0 to 520 := 32;
begin
	clk_div : process(CLK_50MHz)
	begin
		if(rising_edge(CLK_50MHz)) then
			if(clk_25 = '0') then
				clk_25 <= '1';
			else
				clk_25 <= '0';
			end if;
		end if;
	end process;

	counters : process(clk_25)
	begin
		if(rising_edge(clk_25)) then
			if(h_cnt = 799) then
				h_cnt <= 0;

				if(v_cnt = 520) then
					v_cnt <= 0;
				else
					v_cnt <= v_cnt + 1;
				end if;
			else
			  h_cnt <= h_cnt + 1;
			end if;
		end if;
	end process;

	h_sync : process(clk_25, h_cnt)
	begin
		if(rising_edge(clk_25)) then
			if(h_cnt < 96) then
				VGA_HS <= '0';
			else
				VGA_HS <= '1';
			end if;
		end if;
	end process;

	v_sync : process(clk_25, v_cnt) 
	begin
		if(rising_edge(clk_25)) then
			if(v_cnt < 2) then
				VGA_VS <= '0';
			else
				VGA_VS <= '1';
			end if;
		end if;
			
	end process;
	
	color_pixel : process(clk_25, h_cnt, v_cnt, RGB)
	begin
		if(rising_edge(clk_25)) then
			if(h_cnt > 143 and h_cnt < 784) and (v_cnt > 31 and v_cnt < 511) then
				VGA_R <= RGB(0);
				VGA_G <= RGB(1);
				VGA_B <= RGB(2);
--				VGA_R <= '1';
--				VGA_G <= '1';
--				VGA_B <= '1';

				PIX_X <= std_logic_vector(To_unsigned(h_cnt-144, 10));
				PIX_Y <= std_logic_vector(To_unsigned(v_cnt-31, 9));
			else
				VGA_R <= '0';
				VGA_G <= '0';
				VGA_B <= '0';
				PIX_X <= std_logic_vector(To_unsigned(640, 10));
				PIX_Y <= std_logic_vector(To_unsigned(521, 9));
			end if;
		end if;
	end process;
	
end Behavioral;
