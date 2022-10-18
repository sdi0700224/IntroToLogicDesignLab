----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.12.2020 22:39:47
-- Design Name: 
-- Module Name: ALU_tb - beh_ALU_tb
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

entity ALU_tb is

generic ( digits: integer:= 4);
--  Port ( );
end ALU_tb;

architecture beh_ALU_tb of ALU_tb is


component beh_ALU is

  Port ( 
  
  signal a : in std_logic_vector ((digits - 1) downto 0);
  signal b : in std_logic_vector ((digits - 1) downto 0);
  signal Ctr : in std_logic_vector (1 downto 0);
  signal Result : out std_logic_vector ((digits - 1) downto 0);
  signal OVF : out std_logic
  
  );
  
end component;

signal a_tb : std_logic_vector ((digits - 1) downto 0);
signal b_tb : std_logic_vector ((digits - 1) downto 0);
signal Ctr_tb : std_logic_vector (1 downto 0);
signal Result_tb : std_logic_vector ((digits - 1) downto 0);
signal OVF_tb : std_logic;

begin

utt: beh_ALU port map ( a=>a_tb, b=>b_tb, Ctr=>Ctr_tb, Result=>Result_tb, OVF=>OVF_tb
);

test_1: process is

variable Temp1: unsigned (digits downto 0);

begin

Temp1:= (others=>'0');
Temp1(digits):= '1';

Ctr_tb<="00";
for i in 0  to (to_integer(Temp1) - 1) loop
    a_tb<=std_logic_vector(to_signed(i,a_tb'length));
    for j in 0 to (to_integer(Temp1) - 1) loop
        b_tb<=std_logic_vector(to_signed(j,b_tb'length));wait for 10ns;
    end loop j;
end loop i;    

Ctr_tb<="01";
for i in 0  to (to_integer(Temp1) - 1) loop
    a_tb<=std_logic_vector(to_signed(i,a_tb'length));
    for j in 0 to (to_integer(Temp1) - 1) loop
        b_tb<=std_logic_vector(to_signed(j,b_tb'length));wait for 10ns;
    end loop j;
end loop i;  

Ctr_tb<="10";
for i in 0  to (to_integer(Temp1) - 1) loop
    a_tb<=std_logic_vector(to_signed(i,a_tb'length));
    for j in 0 to (to_integer(Temp1) - 1) loop
        b_tb<=std_logic_vector(to_signed(j,b_tb'length));wait for 10ns;
    end loop j;
end loop i;    

Ctr_tb<="11";
for i in 0  to (to_integer(Temp1) - 1) loop
    a_tb<=std_logic_vector(to_signed(i,a_tb'length));
    for j in 0 to (to_integer(Temp1) - 1) loop
        b_tb<=std_logic_vector(to_signed(j,b_tb'length));wait for 10ns;
    end loop j;
end loop i;  

end process test_1;


end beh_ALU_tb;
