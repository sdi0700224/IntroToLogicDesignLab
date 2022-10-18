----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.01.2021 23:16:21
-- Design Name: 
-- Module Name: JKFF_tb - JKFF_Beh_tb
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity JKFF_tb is
--  Port ( );
end JKFF_tb;

architecture JKFF_Beh_tb of JKFF_tb is

component JKFF is

port (
CLK, reset, J, K: in STD_LOGIC;
Q: out STD_LOGIC
);

end component JKFF;

signal CLK, reset, J, K:  STD_LOGIC;
signal Q:  STD_LOGIC;

constant CLK_period : time := 10.000 ns;

begin

utt: JKFF port map(CLK, reset, J, K, Q);

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
		
J<='0'; K<='0';wait for 5*CLK_period;
J<='0'; K<='1';wait for 5*CLK_period;
J<='1'; K<='0';wait for 5*CLK_period;
J<='1'; K<='1';wait for 5*CLK_period;

end process test;

end JKFF_Beh_tb;
