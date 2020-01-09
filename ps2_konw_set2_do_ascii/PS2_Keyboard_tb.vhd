LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY PS2_Keyboard_tb IS
END PS2_Keyboard_tb;
 
ARCHITECTURE behavior OF PS2_Keyboard_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PS2_Keyboard
    PORT(
         DataIn : IN  std_logic_vector(7 downto 0);
         DataRdy : IN  std_logic;
         ascii_code : OUT  std_logic_vector(7 downto 0);
         StartTransmission : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal DataIn : std_logic_vector(7 downto 0) := (others => '0');
   signal DataRdy : std_logic := '0';

 	--Outputs
   signal ascii_code : std_logic_vector(7 downto 0);
   signal StartTransmission : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PS2_Keyboard PORT MAP (
          DataIn => DataIn,
          DataRdy => DataRdy,
          ascii_code => ascii_code,
          StartTransmission => StartTransmission
        ); 

   -- Stimulus process
   stim_proc: process
   begin		
		DataIn <= x"1C";
		DataRdy <= '1';
		wait for 100 ns;
		
		DataRdy <= '0';
		wait for 50ns;
		
		DataIn <= x"4D";
		DataRdy <= '1';
		wait for 100 ns;
   end process;

END;
