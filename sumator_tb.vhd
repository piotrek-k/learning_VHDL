LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
ENTITY sumator_tb IS
END sumator_tb;
 
ARCHITECTURE behavior OF sumator_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sumator
    PORT(
         x : IN  std_logic;
         y : IN  std_logic;
         c_in : IN  std_logic;
         s : OUT  std_logic;
         c_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal x : std_logic := '0';
   signal y : std_logic := '0';
   signal c_in : std_logic := '0';

 	--Outputs
   signal s : std_logic;
   signal c_out : std_logic;
	signal val : STD_LOGIC_VECTOR(2 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sumator PORT MAP (
          x => x,
          y => y,
          c_in => c_in,
          s => s,
          c_out => c_out
        );

   -- Stimulus process
   stim_proc: process
		
   begin
      for i in 0 to 7 loop
			val <= "000";
			val <= std_logic_vector(to_unsigned(i,3));
		
			x <= val(0);
			y <= val(1);
			c_in <= val(2);
			
			wait for 50 ns;
		end loop;
			
   end process;

END;
