----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.03.2021 13:57:18
-- Design Name: 
-- Module Name: Mealy_FSM_tb - fsm_beh_tb
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
use STD.ENV.ALL;

entity Mealy_FSM_tb is
--  Port ( );
end Mealy_FSM_tb;

architecture fsm_beh_tb of Mealy_FSM_tb is

    component Mealy_FSM is
    
      Port 
      (
           signal CLK, reset: in std_logic;
           signal x: in std_logic;
           signal y: out std_logic       
      );
      
    end component;

    signal CLK   : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '1';
    signal x     : STD_LOGIC := 'X';
    signal y     : STD_LOGIC;

    constant CLK_period : time := 10 ns;

begin

    uut: Mealy_FSM
        port map (
            CLK   => CLK,  
            reset => reset,
            x     => x,   
            y     => y
            );
    
    CLK_process : process
        begin
        
            CLK <= '0';
            wait for clk_period/2;
            CLK <= '1';
            wait for clk_period/2;
            
        end process;
       
    Stimulus_process: process
        begin
        
            reset <= '1';
            wait for 100 ns;
            wait until (CLK = '0' and CLK'event);
            reset <= '0';
                
          X <= '1';                 
          wait for 1*CLK_period;
          X <= '1';                 
          wait for 1*CLK_period;
          X <= '0';                 
          wait for 1*CLK_period;
          X <= '1';                
          wait for 1*CLK_period;
          X <= '1';                 
          wait for 1*CLK_period;
          X <= '0';                 
          wait for 1*CLK_period;
          X <= '1';                 
          wait for 1*CLK_period;
          X <= '1';                 
          wait for 1*CLK_period;
          X <= '0';                 
          wait for 1*CLK_period;
                
        report "TESTS COMPLETED";
        stop(2);	
        end process;


end fsm_beh_tb;
