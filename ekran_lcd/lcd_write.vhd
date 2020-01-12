library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FSM_String is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           LCD_Busy : in  STD_LOGIC;
			  CursorMoveLeft : in STD_LOGIC;
			  CursorMoveRight : in STD_LOGIC;
			  ChangeLetter : in STD_LOGIC;
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

  -- String to print
  type STRINGZ is array ( NATURAL range <> ) of CHARACTER;
  constant nStrSize : POSITIVE := 25;
  signal romStr : STRINGZ( 0 to nStrSize - 1 ) := "ABCDEFGHIJKLMNOPRSTUWXYZ" & NUL;

  -- Character index
  signal cntIdx : std_logic_vector( 3 downto 0 ) := ( others => '0' );

	signal moveLeft : std_logic;
	signal moveRight : std_logic;
	signal applyLetter : std_logic;
begin

  -- Character index
--  process ( Clk )
--  begin
--    if rising_edge( Clk ) then
--      if State = sReset then
--        cntIdx <= ( others => '0' );
--      elsif State = sWE then
--        cntIdx <= cntIdx + 1;
--      end if;
--    end if;
--  end process;

	process (Clk)
	begin
		if rising_edge( ChangeLetter ) then
			cntIdx <= cntIdx + 1;
			applyLetter <= '1';
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
  
	process( State, LCD_Busy, moveLeft, moveRight, applyLetter) --cntIdx, romStr
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
      
			if(moveLeft = '1') then
				LCD_DnI <= '0';
				LCD_DI <= "00010000";
				nextState <= sBusyWait;
			end if;
		
			if(moveRight = '1') then
				LCD_DnI <= '0';
				LCD_DI <= "00010100";
				nextState <= sBusyWait;
			end if;
			
			if(applyLetter = '1') then
				LCD_DnI <= '1';
				LCD_DI <= '0' & 
					CONV_STD_LOGIC_VECTOR( CHARACTER'Pos( romStr( conv_integer( cntIdx ) ) ), 7 );
				nextState <= sBusyWait;
			end if;
		
    end case;

  end process;
  
  process (CursorMoveLeft, CursorMoveRight, ChangeLetter)
  begin
		if(rising_edge(CursorMoveLeft)) then
			moveLeft <= '1';
		elsif(falling_edge(CursorMoveLeft)) then
			moveLeft <= '0';
		end if;
		
		if(rising_edge(CursorMoveRight)) then
			moveRight <= '1';
		elsif(falling_edge(CursorMoveRight)) then
			moveRight <= '0';
		end if;
		
		if(rising_edge(ChangeLetter)) then
			applyLetter <= '1';
		elsif(falling_edge(ChangeLetter)) then
			applyLetter <= '0';
		end if;
  end process;
  
  -- Outputs
  LCD_WE  <= '1' when State = sWE else '0';
--  LCD_DnI <= '1';
--  LCD_DI <= '0' & 
--    CONV_STD_LOGIC_VECTOR( CHARACTER'Pos( romStr( conv_integer( cntIdx ) ) ), 7 );

end RTL;

