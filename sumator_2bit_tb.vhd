LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
ENTITY sumator_2bit_tb IS
END sumator_2bit_tb;
 
ARCHITECTURE behavior OF sumator_2bit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sumator_2bit
    PORT(
         x : IN  std_logic_vector(1 downto 0);
         y : IN  std_logic_vector(1 downto 0);
         c_in : IN  std_logic;
         s : OUT std_logic_vector(1 downto 0);
         c_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal x : std_logic_vector(1 downto 0) := (others => '0');
   signal y : std_logic_vector(1 downto 0) := (others => '0');
   signal c_in : std_logic := '0';
   signal s : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal c_out : std_logic;
	
	signal val : STD_LOGIC_VECTOR(4 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sumator_2bit PORT MAP (
          x => x,
          y => y,
          c_in => c_in,
          s => s,
          c_out => c_out
        );

   test_sumatora: process
   begin
      for i in 0 to 31 loop
			val <= "00000";
			val <= std_logic_vector(to_unsigned(i,5));
		
			c_in <= val(0);
			x(0) <= val(1);
			y(0) <= val(2);
			x(1) <= val(3);
			y(1) <= val(4);
			
			wait for 50 ns;
		end loop;
			
   end process;

END;
