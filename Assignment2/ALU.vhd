----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.12.2020 09:50:35
-- Design Name: 
-- Module Name: beh_ALU - Behavioral
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

entity beh_ALU is

    generic ( digits: integer:= 4);

  Port ( 
  
  signal a : in std_logic_vector ((digits - 1) downto 0);
  signal b : in std_logic_vector ((digits - 1) downto 0);
  signal Ctr : in std_logic_vector (1 downto 0);
  signal Result : out std_logic_vector ((digits - 1) downto 0);
  signal OVF : out std_logic
  
  );
  
end beh_ALU;



architecture Behavioral of beh_ALU is

begin

test: process (a, b, Ctr) is

variable Result_var: signed (digits downto 0);

begin


if Ctr = "00" then
    Result_var:= resize(signed(a), Result_var'length) + resize(signed(b), Result_var'length); 
elsif Ctr = "01" then
    Result_var:= resize(signed(a), Result_var'length) - resize(signed(b), Result_var'length); 
elsif Ctr = "10" then
    Result_var:= resize(signed(a), Result_var'length) / 2;
elsif Ctr = "11" then
    Result_var:= resize(signed(a), Result_var'length) xor resize(signed(b), Result_var'length);
else
    Result_var:= resize("X", Result_var'length);

end if;

Result <= std_logic_vector(Result_var((digits - 1) downto 0));


OVF <= Result_var(digits - 1) xor Result_var(digits);

end process test;

end Behavioral;
