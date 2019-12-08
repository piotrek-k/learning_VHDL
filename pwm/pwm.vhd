library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity pwm is
    Port ( CLK : in  STD_LOGIC;
           PWM_SIGNAL : in  STD_LOGIC_VECTOR (3 downto 0);
           SIGNAL_OUT : out  STD_LOGIC);
end pwm;

architecture Behavioral of pwm is
	signal counter : integer := 0;
	constant max_val : integer := 15;
begin
--	counter <= 0;

	process (clk, PWM_SIGNAL)
	begin
		if rising_edge(CLK) then
			if counter >= to_integer(unsigned(PWM_SIGNAL)) then
				SIGNAL_OUT <= '0';
			else
				SIGNAL_OUT <= '1';
			end if;
			
			if counter >= max_val then
				counter <= 0;
			else
				counter <= counter + 1;
			end if;
		end if;
	end process;

end Behavioral;

