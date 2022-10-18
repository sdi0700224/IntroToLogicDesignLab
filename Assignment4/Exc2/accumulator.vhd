----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.02.2021 22:16:21
-- Design Name: 
-- Module Name: accumulator - accumul_beh
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

entity accumulator is
  Port 
  (
        signal number : in std_logic_vector(3 downto 0);
        signal sum : out std_logic_vector(6 downto 0);
        signal clk, reset : in std_logic  
  );
end accumulator;


architecture accumul_beh of accumulator is

    signal tempsum : unsigned(6 downto 0);
    signal savesum : unsigned(6 downto 0);
    
    begin
    
    add: process (number, tempsum) is
    
        variable sum1 : unsigned(6 downto 0);
    begin
    
        sum1:= unsigned("00"&number) + savesum;
        tempsum<= sum1 mod 100;
    
    end process add;
    
    
    
    save: process (clk) is
    begin
    
        if reset = '1' then
            savesum<= (others=>'0');
        elsif clk = '1' and clk' event then
            savesum<=tempsum;
        end if;
    
    end process save;

    sum<=std_logic_vector(savesum);

end accumul_beh;
