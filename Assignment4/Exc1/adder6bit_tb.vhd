----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.03.2021 20:51:33
-- Design Name: 
-- Module Name: adder6bit_tb - adder6b_str
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

entity adder6bit_tb is
--  Port ( );
end adder6bit_tb;

architecture adder6b_str of adder6bit_tb is

    component adder6bit is
      Port 
      ( 
            signal x: in std_logic_vector (5 downto 0);
            signal z: in std_logic_vector (5 downto 0);
            signal c_in: in std_logic;
            signal y: out std_logic_vector (5 downto 0);
            signal c_out: out std_logic;
            signal overflow: out std_logic
      
      );
    end component;
    
    signal x: std_logic_vector (5 downto 0);
    signal z: std_logic_vector (5 downto 0);
    signal c_in: std_logic;
    signal y: std_logic_vector (5 downto 0);
    signal c_out: std_logic;
    signal overflow: std_logic;

begin

    uut: adder6bit port map (x, z, C_in, y, c_out, overflow);
    
    test: process is
   

    procedure sim_test
    (
            carrey: in std_logic;
            down, top: in integer; 
            step_a, step_b: in integer
    ) is

    begin

    c_in<= carrey;
    for i in down  to top loop
        x<=std_logic_vector(to_signed(i*step_a,x'length));
        for j in down to top loop
            z<=std_logic_vector(to_signed(j*step_b,z'length));wait for 20 ns;
        end loop j;
    end loop i;  
    
    end procedure;

begin

sim_test('0',0,4,15,22);
sim_test('0',0,4,13,20);

end process test;

end adder6b_str;
