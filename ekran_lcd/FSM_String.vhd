library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

entity FSM_String is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           LCD_Busy : in  STD_LOGIC;
           LCD_WE : out  STD_LOGIC;
           LCD_DnI : out  STD_LOGIC;
           LCD_DI : out  STD_LOGIC_VECTOR (7 downto 0));
end FSM_String;

architecture RTL of FSM_String is

  -- FSM
  type state_type is (
    sReset,
    sBusyWait,
    sWE,
    sLoop
    );
  signal State, nextState : state_type; 

  constant SIZE : POSITIVE := 4;

  subtype byte is std_logic_vector(7 downto 0);

  type BYTES is array ( NATURAL range <> ) of byte;
  type BITS  is array ( NATURAL range <> ) of std_logic;
  
  signal romStr   : BYTES( 0 to SIZE - 1) := ( "10000011", x"41", "11000111", x"30");
  signal dniTable : BITS( 0 to SIZE - 1)  := (        '0',   '1',        '0',   '1');

  -- Character index
  signal cntIdx : integer range 0 to SIZE;

begin

  -- Character index
  process ( Clk )
  begin
    if rising_edge( Clk ) then
      if State = sReset then
        cntIdx <= 0;
      elsif State = sWE then
        cntIdx <= cntIdx + 1;
      end if;
    end if;
  end process;

  -- FSM
	process ( Clk )
  begin
    if rising_edge( Clk ) then
      if Reset = '1' then
        State <= sReset;
      else
        State <= nextState;
      end if;
    end if;
  end process;
	process( State, LCD_Busy, cntIdx, romStr )
  begin
    nextState <= State;   -- default is to stay in current State
    
    case State is

      when sReset =>
        nextState <= sBusyWait;

      when sBusyWait =>
        if LCD_Busy = '0' then
          nextState <= sWE;
        end if;

      when sWE =>   -- WE pulse
        nextState <= sLoop;

      when sLoop =>
		  if cntIdx < SIZE then
          nextState <= sBusyWait;
        end if;   -- else null; => stay in sLoop till Reset
      
    end case;
  end process;
  
  -- Outputs
  LCD_WE  <= '1' when State = sWE else '0';
  LCD_DnI <= dniTable(cntIdx);
  LCD_DI  <= romStr(cntIdx);

end RTL;

