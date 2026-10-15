digitalsystemlock.vhd
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
--
-- Create Date: 11:32:54 11/12/2025 
-- Design Name: 
-- Module Name: DLS - Behavioral 
-- Project Name: 3
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
-- Language: VHDL
-- Digital Lock System
-- 4-bit code input with 4-bit correct password
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity DigitalLock is
 Port (
 clk : in STD_LOGIC; -- Clock input
 rst : in STD_LOGIC; -- Asynchronous reset
 code_in : in STD_LOGIC_VECTOR(3 downto 0); -- 4-bit code entry
 enter : in STD_LOGIC; -- Enter button
 lock_led : out STD_LOGIC; -- Locked status LED
 unlock_led: out STD_LOGIC -- Unlocked status LED
 );
end DigitalLock;
architecture Behavioral of DigitalLock is 4
 -- Correct 4-bit password
 constant PASSWORD : STD_LOGIC_VECTOR(3 downto 0) := "1010";
-- Internal state
 type LockState is (LOCKED, UNLOCKED);
 signal state : LockState := LOCKED;
begin
process(clk, rst)
 begin
 if rst = '1' then
 state <= LOCKED;
 elsif rising_edge(clk) then
 if enter = '1' then
 if code_in = PASSWORD then
 state <= UNLOCKED;
 else
 state <= LOCKED;
 end if;
 end if;
 end if;
 end process;
 -- Output assignment based on state
 lock_led <= '1' when state = LOCKED else '0';
 unlock_led <= '1' when state = UNLOCKED else '0';
end Behavioral;