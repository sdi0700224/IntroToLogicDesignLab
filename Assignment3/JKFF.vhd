----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.01.2021 22:52:15
-- Design Name: 
-- Module Name: JKFF - JKFF_BEH
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

entity JKFF is

port (
CLK, reset, J, K: in STD_LOGIC;
Q: out STD_LOGIC
);

end JKFF;

architecture JKFF_BEH of JKFF is

signal Q_in: STD_LOGIC;

begin

process (CLK)
begin

if reset = '1' then
    Q_in <= '0';
elsif (CLK = '1' and CLK'event) then
    Q_in <= (J and (not Q_in)) or ((not K) and Q_in);
end if;
end process;
Q <= Q_in;

end JKFF_BEH;