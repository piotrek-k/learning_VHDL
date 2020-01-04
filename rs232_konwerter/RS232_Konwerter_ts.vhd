LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY RS232_Konwerter_ts IS
END RS232_Konwerter_ts;
 
ARCHITECTURE behavior OF RS232_Konwerter_ts IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RS232_Konwerter
    PORT(
         Rdy : IN  std_logic;
         DataIn : IN  std_logic_vector(7 downto 0);
         DataOut : OUT  std_logic_vector(7 downto 0);
         Invalid : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Rdy : std_logic := '0';
   signal DataIn : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal DataOut : std_logic_vector(7 downto 0);
   signal Invalid : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RS232_Konwerter PORT MAP (
          Rdy => Rdy,
          DataIn => DataIn,
          DataOut => DataOut,
          Invalid => Invalid
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		DataIn <= std_logic_vector(to_unsigned(65, 8));
		Rdy <= '1';
      wait for 100 ns;
		Rdy <= '0';
		wait for 10 ns;
		
		DataIn <= std_logic_vector(to_unsigned(98, 8));
		Rdy <= '1';
      wait for 100 ns;
		Rdy <= '0';
		wait for 10 ns;

		DataIn <= std_logic_vector(to_unsigned(49, 8));
		Rdy <= '1';
      wait for 100 ns;
		Rdy <= '0';
		wait for 10 ns;


		DataIn <= std_logic_vector(to_unsigned(16, 8));
		Rdy <= '1';
      wait for 100 ns;
		Rdy <= '0';
		wait for 10 ns;

      wait;
   end process;

END;
