LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY detektor_tb IS
END detektor_tb;
 
ARCHITECTURE behavior OF detektor_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT detektor
    PORT(
         X : IN  std_logic_vector(3 downto 0);
         Y : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal X : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Y : std_logic_vector(5 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: detektor PORT MAP (
          X => X,
          Y => Y
        );
 
   -- Stimulus process
   tb: process
	begin
		for i in 0 to 15 loop
			X <= std_logic_vector(to_unsigned(i,4));
			wait for 50 ns;
		end loop;
	end process tb;

END;
