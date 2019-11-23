library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity sumator is
    Port ( x : in  STD_LOGIC;
           y : in  STD_LOGIC;
           c_in : in  STD_LOGIC;
           s : out  STD_LOGIC;
           c_out : out  STD_LOGIC);
end sumator;

architecture Dataflow of sumator is
	signal gate_1_out : STD_LOGIC;
	signal gate_3_out : STD_LOGIC;
	signal gate_4_out : STD_LOGIC;
begin

	gate_1_out <= x xor y;
	s <= gate_1_out xor c_in;
	gate_3_out <= gate_1_out and c_in;
	gate_4_out <= x and y;
	c_out <= gate_3_out or gate_4_out;
	
end Dataflow;

--architecture Structural of sumator is
--	
--	component OR2
--	PORT( we2 : in STD_LOGIC;
--			we1: in STD_LOGIC;
--			wy: out STD_LOGIC);
--	end component;
--	
--	component AND2
--	PORT( we2 : in STD_LOGIC;
--			we1: in STD_LOGIC;
--			wy: out STD_LOGIC);
--	end component;
--	
--	component XOR2
--	PORT( we2 : in STD_LOGIC;
--			we1: in STD_LOGIC;
--			wy: out STD_LOGIC);
--	end component;
--
--	signal gate_1_out : STD_LOGIC;
--	signal gate_3_out : STD_LOGIC;
--	signal gate_4_out : STD_LOGIC;
--begin
--	gate_1_out <= '0';
--	gate_3_out <= '0';
--	gate_4_out <= '0';
--
--	XOR_GATE_1 : XOR2 port map (x, y, gate_1_out);
--	XOR_GATE_2 : XOR2 port map (gate_1_out, c_in, s);
--	AND_GATE_3 : AND2 port map (c_in, gate_1_out, gate_3_out);
--	AND_GATE_4 : AND2 port map (x, y, gate_4_out);
--	OR_GATE_5  : OR2 port map (gate_3_out, gate_4_out, c_out);
--
--end Structural;

