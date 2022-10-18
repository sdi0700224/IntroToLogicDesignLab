----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.11.2020 00:54:03
-- Design Name: 
-- Module Name: lock - beh lock
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
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lock is
  Port (
  
  signal code: in std_logic_vector (3 downto 0);
  signal lock_out : out std_logic
  
   );
end lock;

architecture beh_lock of lock is

begin
lock_out <= ((not code(0)) and (not code(1)) and code(2) and (not code(3)));

end beh_lock;
