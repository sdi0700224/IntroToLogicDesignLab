----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.03.2021 20:35:26
-- Design Name: 
-- Module Name: adder6bit - adder6b_beh
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

entity adder6bit is
  Port 
  ( 
        signal x: in std_logic_vector (5 downto 0);
        signal z: in std_logic_vector (5 downto 0);
        signal c_in: in std_logic;
        signal y: out std_logic_vector (5 downto 0);
        signal c_out: out std_logic;
        signal overflow: out std_logic
  
  );
end adder6bit;

architecture adder6b_str of adder6bit is

component full_adder is

  Port 
  ( 
        signal x: in std_logic_vector (2 downto 0);
        signal z: in std_logic_vector (2 downto 0);
        signal c_in: in std_logic;
        signal y: out std_logic_vector (2 downto 0);
        signal c_out: out std_logic;
        signal overflow: out std_logic
  );
  
end component;

    signal Carry_next  : STD_LOGIC;

begin

    adder_0:    full_adder  port map (
                               x(2 downto 0),
                               z(2 downto 0),
                               c_in,
                               y(2 downto 0),
                               Carry_next
                              );
    adder_1:    full_adder  port map (
                               x(5 downto 3),
                               z(5 downto 3),
                               Carry_next,
                               y(5 downto 3),
                               c_out,
                               overflow);

end adder6b_str;
