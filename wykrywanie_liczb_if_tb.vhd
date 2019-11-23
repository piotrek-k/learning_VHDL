LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY wykrywanie_liczb_if_tb IS
END wykrywanie_liczb_if_tb;
 
ARCHITECTURE behavior OF wykrywanie_liczb_if_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT wykrywanie_liczb_if
    PORT(
         X : IN  std_logic_vector(3 downto 0);
         Y : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal X : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Y : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: wykrywanie_liczb_if PORT MAP (
          X => X,
          Y => Y
        );
	
	tb: process
	begin
		for i in 0 to 15 loop
			X <= std_logic_vector(to_unsigned(i,4));
			wait for 50 ns;
		end loop;
	end process tb;

END;
