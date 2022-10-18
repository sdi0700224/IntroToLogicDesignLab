----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2021 13:25:35
-- Design Name: 
-- Module Name: Mealy_FSM - fsm_beh
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

entity Mealy_FSM is
  
  Port 
  (
       signal CLK, reset: in std_logic;
       signal x: in std_logic;
       signal y: out std_logic       
  );
  
end Mealy_FSM;

architecture fsm_beh of Mealy_FSM is

    type FSM_states is 
        (S0, S1, S2, S3, S4, S5, S6);
        
    signal current_state, next_state: FSM_states;
    signal x_in : std_logic;

begin
   
    x_in<= x;
     
    SYNC:  process (CLK)
    begin
        if (CLK = '1' and CLK'event) then
            if (reset = '1') then 
                current_state <= S0;
            else 
                current_state <= next_state; 
            end if;
        end if; 
    end process;
    
    ASYNC: process (current_state, X_in, CLK)
    begin
        next_state <= S0; 
        Y <= '0';
        case current_state is
            when S0 => 
                if (X_in = '1') then 
                    next_state <= S1;
                else 
                    next_state <= S4; 
                end if;
            when S1 => 
                if (X_in = '1') then 
                    next_state <= S2;
                else 
                    next_state <= S4; 
                end if;
            when S2 =>
                if (X_in = '1') then 
                    next_state <= S2;
                else 
                    next_state <= S3; 
                end if;
            when S3 =>
                if (X_in = '1') then
                    y <= '1'; 
                    next_state <= S5;
                else 
                    next_state <= S4; 
                end if;
            when S4 =>
                if (X_in = '1') then 
                    next_state <= S5;
                else 
                    next_state <= S4; 
                end if;  
            when S5 =>
                if (X_in = '1') then 
                    next_state <= S6;
                else 
                    next_state <= S4; 
                end if; 
            when S6 =>
                if (X_in = '1') then 
                    next_state <= S2;
                else
                    y<= '1'; 
                    next_state <= S3; 
                end if;
            when others => 
                next_state <= S0; 
        end case;
        if (CLK = '1' and CLK'event) then
            if (reset = '1') then
            next_state <= S0;
            end if;
        end if; 
    end process;

end fsm_beh;
