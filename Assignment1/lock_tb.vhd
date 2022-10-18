----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.11.2020 00:58:38
-- Design Name: 
-- Module Name: lock_tb - beh_lock_tb
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lock_tb is
--  Port ( );
end lock_tb;

architecture beh_lock_tb of lock_tb is

component lock is
  Port (
  
  signal code: in std_logic_vector (3 downto 0);
  signal lock_out : out std_logic
  
   );
end component;

signal code_tb: std_logic_vector (3 downto 0);
signal lock_out_tb: std_logic;

begin

utt: lock port map (code=>code_tb , lock_out=>lock_out_tb);

applytest: process

begin

code_tb<="0000"; wait for 20 ns;
code_tb<="0001"; wait for 20 ns;
code_tb<="0010"; wait for 20 ns;
code_tb<="0011"; wait for 20 ns;
code_tb<="0100"; wait for 20 ns;
code_tb<="0101"; wait for 20 ns;
code_tb<="0110"; wait for 20 ns;
code_tb<="0111"; wait for 20 ns;
code_tb<="1000"; wait for 20 ns;
code_tb<="1001"; wait for 20 ns;
code_tb<="1010"; wait for 20 ns;
code_tb<="1011"; wait for 20 ns;
code_tb<="1100"; wait for 20 ns;
code_tb<="1101"; wait for 20 ns;
code_tb<="1110"; wait for 20 ns;
code_tb<="1111"; wait for 20 ns;


end process;

end beh_lock_tb;
