LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;

ENTITY sumator_2bit_tb IS
END sumator_2bit_tb;

ARCHITECTURE behavior OF sumator_2bit_tb IS

  -- Component Declaration for the Unit Under Test (UUT)

  COMPONENT sumator_2bit
    PORT (
      X : IN std_logic_vector(1 DOWNTO 0);
      Y : IN std_logic_vector(1 DOWNTO 0);
      c_in : IN std_logic;
      S : OUT std_logic_vector(1 DOWNTO 0);
      c_out : OUT std_logic
    );
  END COMPONENT;
  --Inputs
  SIGNAL X : std_logic_vector(1 DOWNTO 0) := (OTHERS => '0');
  SIGNAL Y : std_logic_vector(1 DOWNTO 0) := (OTHERS => '0');
  SIGNAL c_in : std_logic := '0';

  --Outputs
  SIGNAL S : std_logic_vector(1 DOWNTO 0);
  SIGNAL c_out : std_logic;

BEGIN

  -- Instantiate the Unit Under Test (UUT)
  uut : sumator_2bit PORT MAP(
    X => X,
    Y => Y,
    c_in => c_in,
    S => S,
    c_out => c_out
  );

  -- Stimulus process
  stim_proc : PROCESS
    VARIABLE val : std_logic_vector(4 DOWNTO 0);
  BEGIN
    --val <= std_logic_vector(to_unsigned(0,3));
    FOR i IN 0 TO 31 LOOP
      val := std_logic_vector(to_unsigned(i, 5));
      x(0) <= val(0);
      x(1) <= val(1);
      y(0) <= val(2);
      y(1) <= val(3);
      c_in <= val(4);
      WAIT FOR 50 ns;
    END LOOP;
  END PROCESS;

END;