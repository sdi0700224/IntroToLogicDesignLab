----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.02.2021 23:32:27
-- Design Name: 
-- Module Name: accumulator_tb - accumul_tb_beh
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

entity accumulator_tb is
--  Port ( );
end accumulator_tb;

architecture accumul_tb_beh of accumulator_tb is

component accumulator is
  Port 
  (
        signal number : in std_logic_vector(3 downto 0);
        signal sum : out std_logic_vector(6 downto 0);
        signal reset, clk : in std_logic  
  );
end component;

signal number : std_logic_vector(3 downto 0);
signal sum : std_logic_vector(6 downto 0);
signal reset, clk : std_logic;  

constant CLK_period : time := 10.000 ns;

begin

utt: accumulator port map (number, sum, reset, clk);

clk_process : process
    begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
end process CLK_process;

test1: process is

begin


RESET <= '1';
wait for 100 ns;
wait until (CLK = '0' and CLK'event);
RESET <= '0';wait;

end process test1;
		
test2: process is

begin

for i in 0 to 15 loop
    number<=std_logic_vector(to_unsigned(i,number'length));wait for 10 ns;
end loop;


end process test2;

end accumul_tb_beh;
