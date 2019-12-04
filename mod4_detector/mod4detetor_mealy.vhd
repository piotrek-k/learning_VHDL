library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity mod4detector_mealy is
    Port ( X : in  STD_LOGIC;
           Y : out  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC);
end mod4detector_mealy;

architecture Behavioral of mod4detector_mealy is
	type state_type is (A, B);
	signal state, next_state : state_type;
begin

SYNC_PROCESS : process( Clk )
begin
	if rising_edge( Clk ) then
		if Reset = '1' then
			state <= A;
		else
			state <= next_state;
		end if;
	end if;
end process SYNC_PROCESS;

NEXT_STATE_DECODE: process(state, X)
begin
	next_state <= state;
	y <= '0';
	
	case state is
		when A => 
			if X = '0' then
				next_state <= B;
			end if;
		
		when B => 
			if x = '1' then
				next_state <= A;
			else
				y <= '1';
			end if;
	end case;
	
end process NEXT_STATE_DECODE;	

end Behavioral;

