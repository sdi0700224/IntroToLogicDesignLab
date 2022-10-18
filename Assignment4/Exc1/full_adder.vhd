----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.03.2021 14:40:55
-- Design Name: 
-- Module Name: full_adder - full_adder_beh
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

entity full_adder is

  Port 
  ( 
        signal x: in std_logic_vector (2 downto 0);
        signal z: in std_logic_vector (2 downto 0);
        signal c_in: in std_logic;
        signal y: out std_logic_vector (2 downto 0);
        signal c_out: out std_logic;
        signal overflow: out std_logic
  );
  
end full_adder;

architecture full_adder_beh of full_adder is

begin

    add: process(x, z, c_in) is
    
    variable carreytemp1, carreytemp2, carreytemp3: std_logic;
    
    begin
    
        y(0)<= x(0) xor z(0) xor c_in;
        carreytemp1:= (x(0) and z(0)) or (x(0) and c_in) or (z(0) and c_in);
        y(1)<= x(1) xor z(1) xor carreytemp1;
        carreytemp2:= (x(1) and z(1)) or (x(1) and carreytemp1) or (z(1) and carreytemp1);
        y(2)<= x(2) xor z(2) xor carreytemp2;
        carreytemp3:= (x(2) and z(2)) or (x(2) and carreytemp2) or (z(2) and carreytemp2);
        c_out<= carreytemp3;
        overflow<= carreytemp2 xor carreytemp3;
    
    end process add;
    


end full_adder_beh;
