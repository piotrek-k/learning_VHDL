LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY bin_to_bcd_4bit_tb IS
END bin_to_bcd_4bit_tb;
 
ARCHITECTURE behavior OF bin_to_bcd_4bit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT bin_to_bcd_4bit
    PORT(
         Bin : IN  std_logic_vector(7 downto 0);
         Bcd : OUT  std_logic_vector(11 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Bin : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal Bcd : std_logic_vector(11 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: bin_to_bcd_4bit PORT MAP (
          Bin => Bin,
          Bcd => Bcd
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 50 ns;	

		for i in 0 to 255 loop
			Bin <= std_logic_vector(to_unsigned(i,8));
			wait for 50 ns;
		end loop;
      -- insert stimulus here 

      wait;
   end process;

END;
