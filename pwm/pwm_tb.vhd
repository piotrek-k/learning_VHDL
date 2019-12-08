LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY pwm_tb IS
END pwm_tb;
 
ARCHITECTURE behavior OF pwm_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pwm
    PORT(
         CLK : IN  std_logic;
         PWM_SIGNAL : IN  std_logic_vector(3 downto 0);
         SIGNAL_OUT : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal PWM_SIGNAL : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal SIGNAL_OUT : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
	constant WAIT_TIME : time := 500 ns;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pwm PORT MAP (
          CLK => CLK,
          PWM_SIGNAL => PWM_SIGNAL,
          SIGNAL_OUT => SIGNAL_OUT
        );

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
      
		PWM_SIGNAL <= "1000";
		
      wait for WAIT_TIME;	

      PWM_SIGNAL <= "1111";
		
      wait for WAIT_TIME;	
		
		PWM_SIGNAL <= "0001";
		
      wait for WAIT_TIME;	


		PWM_SIGNAL <= "0000";
		
      wait for WAIT_TIME;

      wait;
   end process;

END;
