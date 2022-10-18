----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.01.2021 15:23:12
-- Design Name: 
-- Module Name: GraterA_tb - GraterA_Beh_tb
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

entity GraterA_tb is
--  Port ( );
end GraterA_tb;

architecture GraterA_Beh_tb of GraterA_tb is

component GraterA is

Port (
  
        a, b, c, d : in std_logic_vector(3 downto 0);
        clk, reset : in std_logic;
        Grater : out std_logic_vector(3 downto 0)
  
   );
end component GraterA;

signal        a, b, c, d :  std_logic_vector(3 downto 0);
signal        clk, reset :  std_logic;
signal        Grater :  std_logic_vector(3 downto 0);

constant CLK_period : time := 10.000 ns;


begin

utt : GraterA port map (a, b, c, d, clk, reset, Grater);

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
		

for i in 0 to 15 loop
    a<=std_logic_vector(to_unsigned(i,a'length));
    for x in 0 to 15 loop
        b<=std_logic_vector(to_unsigned(x,b'length));
        for y in 0 to 15 loop
            c<=std_logic_vector(to_unsigned(y,c'length));
                for k in 0 to 15 loop
                d<=std_logic_vector(to_unsigned(k,d'length)); wait for CLK_period;
                end loop;
        end loop;
    end loop;
end loop;


end process test;


end GraterA_Beh_tb;
