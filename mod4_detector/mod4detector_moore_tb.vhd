LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY mod4detector_moore_tb IS
END mod4detector_moore_tb;
 
ARCHITECTURE behavior OF mod4detector_moore_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mod4detector
    PORT(
         Clk : IN  std_logic;
         Reset : IN  std_logic;
         X : IN  std_logic;
         Y : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Reset : std_logic := '0';
   signal X : std_logic := '0';

 	--Outputs
   signal Y : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mod4detector PORT MAP (
          Clk => Clk,
          Reset => Reset,
          X => X,
          Y => Y
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
		VARIABLE val : std_logic_vector(2 DOWNTO 0);
   begin		
      -- hold reset state for 100 ns.
      --wait for 100 ns;	

      --wait for Clk_period*10;

      FOR i IN 0 TO 7 LOOP
			val := std_logic_vector(to_unsigned(i, 3));
			Reset <= '1';
			wait for Clk_period;
			Reset <= '0';
			X <= val(0);
			wait for Clk_period;
			X <= val(1);
			wait for Clk_period;
			X <= val(2);
			wait for Clk_period;
		END LOOP;

      wait;
   end process;

END;
