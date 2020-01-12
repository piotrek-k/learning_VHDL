LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY FSM_String_tb IS
END FSM_String_tb;
 
ARCHITECTURE behavior OF FSM_String_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FSM_String
    PORT(
         Clk : IN  std_logic;
         Reset : IN  std_logic;
         LCD_Busy : IN  std_logic;
			CursorMoveLeft : IN std_logic;
			CursorMoveRight : IN std_logic;
			ChangeLetter : IN STD_LOGIC;
         LCD_WE : OUT  std_logic;
         LCD_DnI : OUT  std_logic;
         LCD_DI : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Reset : std_logic := '0';
   signal LCD_Busy : std_logic := '0';
	signal CursorMoveLeft : std_logic := '0';
   signal CursorMoveRight : std_logic := '0';
	signal ChangeLetter : std_logic := '0';

 	--Outputs
   signal LCD_WE : std_logic;
   signal LCD_DnI : std_logic;
   signal LCD_DI : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FSM_String PORT MAP (
          Clk => Clk,
          Reset => Reset,
          LCD_Busy => LCD_Busy,
			 CursorMoveLeft => CursorMoveLeft,
			 CursorMoveRight => CursorMoveRight,
			 ChangeLetter => ChangeLetter,
          LCD_WE => LCD_WE,
          LCD_DnI => LCD_DnI,
          LCD_DI => LCD_DI
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		CursorMoveLeft <= '1';
		
      wait for Clk_period;
		
		CursorMoveLeft <= '0';

		wait for Clk_period*5;
		
		CursorMoveRight <= '1';
		
		wait for Clk_period;
		CursorMoveRight <= '0';
		wait for Clk_period*2;
		
		ChangeLetter <= '1';
		wait for Clk_period*2;
		ChangeLetter <= '0';
		wait for Clk_period*2;
		
		ChangeLetter <= '1';
		wait for Clk_period;
		ChangeLetter <= '0';
		wait for Clk_period*2;
		
		ChangeLetter <= '1';
		wait for Clk_period;
		ChangeLetter <= '0';
		wait for Clk_period*2;
		
		ChangeLetter <= '1';
		wait for Clk_period;
		ChangeLetter <= '0';
		wait for Clk_period*2;

      -- insert stimulus here 

      wait;
   end process;

END;
