LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;

ENTITY licznik_synchorniczny_tb IS
END licznik_synchorniczny_tb;

ARCHITECTURE behavior OF licznik_synchorniczny_tb IS

   -- Component Declaration for the Unit Under Test (UUT)

   COMPONENT licznik_synchorniczny
      PORT (
         CLK : IN std_logic;
         CLR : IN std_logic;
         MODE : IN std_logic_vector(1 DOWNTO 0);
         OUTPUT : OUT std_logic_vector(3 DOWNTO 0)
      );
   END COMPONENT;

   --Inputs
   SIGNAL CLK : std_logic := '0';
   SIGNAL CLR : std_logic := '0';
   SIGNAL MODE : std_logic_vector(1 DOWNTO 0) := (OTHERS => '0');

   --Outputs
   SIGNAL OUTPUT : std_logic_vector(3 DOWNTO 0);

   -- Clock period definitions
   CONSTANT CLK_period : TIME := 100 ns;

BEGIN

   -- Instantiate the Unit Under Test (UUT)
   uut : licznik_synchorniczny PORT MAP(
      CLK => CLK,
      CLR => CLR,
      MODE => MODE,
      OUTPUT => OUTPUT
   );

   -- Clock process definitions
   CLK_process : PROCESS
   BEGIN
      FOR i IN 1 TO 80 LOOP
         CLK <= '0';
         WAIT FOR CLK_period/2;
         CLK <= '1';
         WAIT FOR CLK_period/2;
      END LOOP;
      WAIT;
   END PROCESS;

   -- Stimulus process
   stim_proc : PROCESS
   BEGIN
      MODE <= "00";
      CLR <= '1';
      WAIT FOR 100 ns;
      CLR <= '0';

      WAIT FOR 6 * CLK_period;

      MODE <= "10";
      WAIT FOR 20 * CLK_period;

      MODE <= "01";
      WAIT FOR 12 * CLK_period;

      MODE <= "11";
      WAIT FOR 17 * CLK_period;

      CLR <= '1';

      WAIT;
   END PROCESS;

END;