LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL; 
ENTITY DelayedSignal_tb IS
END DelayedSignal_tb;
 
ARCHITECTURE behavior OF DelayedSignal_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DelayedSignal
    PORT(
         Clk : IN  std_logic;
         Clr : IN  std_logic;
         Start : IN  std_logic;
         DelayDuration : IN  std_logic_vector(3 downto 0);
         OutSignal : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Clr : std_logic := '0';
   signal Start : std_logic := '0';
   signal DelayDuration : std_logic_vector(3 downto 0) := "0010";

 	--Outputs
   signal OutSignal : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DelayedSignal PORT MAP (
          Clk => Clk,
          Clr => Clr,
          Start => Start,
          DelayDuration => DelayDuration,
          OutSignal => OutSignal
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
		
		-- DelayDuration <= "1010";
	
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for Clk_period*10;

      -- insert stimulus here 

		Start <= '1';
		
		wait for 200 ns;
		
		Start <= '0';

      wait;
   end process;

END;
