library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity DelayedSignal is
    Port ( Clk : in  STD_LOGIC;
           Clr : in  STD_LOGIC;
           Start : in  STD_LOGIC;
           DelayDuration : in  STD_LOGIC_VECTOR (3 downto 0);
           OutSignal : out  STD_LOGIC);
end DelayedSignal;

architecture Behavioral of DelayedSignal is
	signal time_remaining: integer;
	signal counting_started: std_logic;
begin

SYNC_PROCESS: process (Clk, Start)
begin
	if rising_edge( Clk ) then
		if counting_started = '1' and time_remaining > 0 then
			time_remaining <= time_remaining - 1;
		else
			time_remaining <= 0;
		end if;
	end if;
	
	if rising_edge( Start ) then
		time_remaining <= to_integer(unsigned(DelayDuration));
		counting_started <= '1';
	elsif falling_edge(Start) then
		OutSignal <= '0';
		counting_started <= '0';
	end if;

	if time_remaining = 0 and counting_started = '1' then
		OutSignal <= '1';
	else 
		OutSignal <= '0';
	end if;
	
end process SYNC_PROCESS;


end Behavioral;

