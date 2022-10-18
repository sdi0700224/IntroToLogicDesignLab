----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.01.2021 15:19:42
-- Design Name: 
-- Module Name: GraterA - GraterA_Beh
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

entity GraterA is

Port (
  
        a, b, c, d : in std_logic_vector(3 downto 0);
        clk, reset : in std_logic;
        Grater : out std_logic_vector(3 downto 0)
  
   );
end GraterA;

architecture GraterA_Beh of GraterA is

signal a_temp1, b_temp1, c_temp1, d_temp1, ab_max, temp_ab_max2, c_temp2, d_temp2, abc_max, temp_abc_max3, d_temp3, max : unsigned (3 downto 0);    

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

cl1 : process(a_temp1, b_temp1, ab_max) is
begin

    if a_temp1>b_temp1 then
        ab_max<= a_temp1 ;
    else
        ab_max<= b_temp1;
    end if;
    
end process cl1;

dff1: process (clk, reset) is
begin

    if reset = '1' then
        temp_ab_max2<= (others=>'0');
        c_temp2<= (others=>'0');
        d_temp2<= (others=>'0');
    elsif clk = '1' and clk' event then
        temp_ab_max2<= ab_max;
        c_temp2<= c_temp1;
        d_temp2<= d_temp1;
    end if;
    
end process dff1;

cl2 : process(temp_ab_max2, c_temp2, abc_max) is
begin

    if temp_ab_max2>c_temp2 then
        abc_max<= temp_ab_max2 ;
    else
        abc_max<= c_temp2;
    end if;
    
end process cl2;

dff2: process (clk, reset) is
begin

    if reset = '1' then
        temp_abc_max3<= (others=>'0');
        d_temp3<= (others=>'0');
    elsif clk = '1' and clk' event then
        temp_abc_max3<= abc_max;
        d_temp3<= d_temp2;
    end if;
    
end process dff2;

cl3 : process(temp_abc_max3, d_temp3, max) is
begin

    if temp_abc_max3>d_temp3 then
        max<= temp_abc_max3 ;
    else
        max<= d_temp3;
    end if;
    
end process cl3;

dff3: process (clk, reset) is
begin

    if reset = '1' then
        Grater<= (others=>'0');
    elsif clk = '1' and clk' event then
        Grater<= std_logic_vector(max);
    end if;
    
end process dff3;


end GraterA_Beh;
