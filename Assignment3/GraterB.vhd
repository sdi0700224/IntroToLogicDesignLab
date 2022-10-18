----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.01.2021 16:29:16
-- Design Name: 
-- Module Name: GraterB - GraterB_Beh
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

entity GraterB is

Port (
  
        a, b, c, d : in std_logic_vector(3 downto 0);
        clk, reset : in std_logic;
        Grater : out std_logic_vector(3 downto 0)
  
   );
   
end GraterB;

architecture GraterB_Beh of GraterB is

signal a_temp1, b_temp1, c_temp1, d_temp1, ab_max, cd_max, temp_ab_max2, temp_cd_max2, max : unsigned (3 downto 0);    

begin

dff0: process (clk, reset) is
begin

    if reset = '1' then
        a_temp1<= (others=>'0');
        b_temp1<= (others=>'0');
        c_temp1<= (others=>'0');
        d_temp1<= (others=>'0');
    elsif clk = '1' and clk' event then
        a_temp1<= unsigned(a);
        b_temp1<= unsigned(b);
        c_temp1<= unsigned(c);
        d_temp1<= unsigned(d);
    end if;
    
end process dff0;

cl1 : process(a_temp1, b_temp1, c_temp1, d_temp1, ab_max, cd_max) is
begin

    if a_temp1>b_temp1 then
        ab_max<= a_temp1 ;
    else
        ab_max<= b_temp1;
    end if;
    if c_temp1>d_temp1 then
        cd_max<= c_temp1 ;
    else
        cd_max<= d_temp1;
    end if;
    
end process cl1;

dff1: process (clk, reset) is
begin

    if reset = '1' then
        temp_ab_max2<= (others=>'0');
        temp_cd_max2<= (others=>'0');
    elsif clk = '1' and clk' event then
        temp_ab_max2<= ab_max;
        temp_cd_max2<= cd_max;
    end if;
    
end process dff1;

cl2 : process(temp_ab_max2, temp_cd_max2, max) is
begin

    if temp_ab_max2>temp_cd_max2 then
        max<= temp_ab_max2 ;
    else
        max<= temp_cd_max2;
    end if;
    
end process cl2;

dff2: process (clk, reset) is
begin

    if reset = '1' then
        Grater <= (others=>'0');
    elsif clk = '1' and clk' event then
        Grater <= std_logic_vector(max);
    end if;
    
end process dff2;


end GraterB_Beh;
