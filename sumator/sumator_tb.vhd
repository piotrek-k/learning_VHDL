LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;

ENTITY sumator_tb IS
END sumator_tb;

ARCHITECTURE behavior OF sumator_tb IS

  -- Component Declaration for the Unit Under Test (UUT)

  COMPONENT sumator
    PORT (
      x : IN std_logic;
      y : IN std_logic;
      c_in : IN std_logic;
      s : OUT std_logic;
      c_out : OUT std_logic
    );
  END COMPONENT;
  
  --Inputs
  SIGNAL x : std_logic := '0';
  SIGNAL y : std_logic := '0';
  SIGNAL c_in : std_logic := '0';

  --Outputs
  SIGNAL s : std_logic;
  SIGNAL c_out : std_logic;

BEGIN

  -- Instantiate the Unit Under Test (UUT)
  uut : sumator PORT MAP(
    x => x,
    y => y,
    c_in => c_in,
    s => s,
    c_out => c_out
  );

  -- Stimulus process
  stim_proc : PROCESS
    VARIABLE val : std_logic_vector(2 DOWNTO 0);
  BEGIN
    --val <= std_logic_vector(to_unsigned(0,3));
    FOR i IN 0 TO 7 LOOP
      val := std_logic_vector(to_unsigned(i, 3));
      x <= val(0);
      y <= val(1);
      c_in <= val(2);
      WAIT FOR 50 ns;
    END LOOP;
  END PROCESS;

END;