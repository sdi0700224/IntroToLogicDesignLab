----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.01.2021 17:38:31
-- Design Name: 
-- Module Name: module12_count_tb - module12_count_beh_tb
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity module12_count_tb is
--  Port ( );
end module12_count_tb;

architecture module12_count_beh_tb of module12_count_tb is

component module12_counter is
  
  port ( clk : in std_logic;
       reset : in std_logic;
           q : out std_logic_vector(3 downto 0) 
        );

end component module12_counter;

signal clk : std_logic;
signal reset :  std_logic;
signal q : std_logic_vector(3 downto 0);

constant CLK_period : time := 10.000 ns;

begin

utt: module12_counter port map (clk,reset, q);

CLK_process : process
    begin
		CLK <= '0';
		wait for clk_period/2;
		CLK <= '1';
		wait for clk_period/2;
end process CLK_process;

test: process is

begin


RESET <= '1';
wait for 100 ns;
wait until (CLK = '0' and CLK'event);
RESET <= '0';
wait;

end process test;

end module12_count_beh_tb;
