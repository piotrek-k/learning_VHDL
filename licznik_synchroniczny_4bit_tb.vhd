LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
USE ieee.numeric_std.ALL;
 
ENTITY licznik_synchroniczny_4bit_tb IS
END licznik_synchroniczny_4bit_tb;
 
ARCHITECTURE behavior OF licznik_synchroniczny_4bit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT licznik_synchroniczny_4bit
    PORT(
         CLK : IN  std_logic;
         CLR : IN  std_logic;
         MODULO : IN  std_logic_vector(3 downto 0);
         OUTPUT : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal CLR : std_logic := '0';
   signal MODULO : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal OUTPUT : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: licznik_synchroniczny_4bit PORT MAP (
          CLK => CLK,
          CLR => CLR,
          MODULO => MODULO,
          OUTPUT => OUTPUT
        );
		  
	MODULO <= "1001";

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
