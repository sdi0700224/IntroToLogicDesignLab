----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.01.2021 17:20:55
-- Design Name: 
-- Module Name: module12_counter - mod12_beh
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

entity module12_counter is
  
  port ( clk : in std_logic;
         reset: in std_logic;
           q : out std_logic_vector(3 downto 0) 
        );

end module12_counter;

architecture mod12_beh of module12_counter is

signal count_value : unsigned(3 downto 0);

begin

count : process (clk) is
begin

if clk = '1' and clk' event then
    if count_value = "1011" or reset = '1' then
        count_value <= "0000";
    else
        count_value <= count_value + 1;
    end if;
end if;

end process count;

q <= std_logic_vector(count_value);

end mod12_beh;
