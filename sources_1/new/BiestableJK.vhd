----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.06.2023 16:56:26
-- Design Name: 
-- Module Name: BiestableJK - Behavioral
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

entity BiestableJK is
    port (
        J, K, clk, reset: in std_logic;
        Q: out std_logic
    );
end BiestableJK;

architecture Behavioral of BiestableJK is
    signal q_internal: std_logic;
begin
    process (clk, reset)
    begin
        if reset = '1' then
            q_internal <= '0';
        elsif rising_edge(clk) then
            if J = '0' and K = '0' then
                q_internal <= q_internal; -- Mantener estado actual
            elsif J = '0' and K = '1' then
                q_internal <= '0';
            elsif J = '1' and K = '0' then
                q_internal <= '1';
            elsif J = '1' and K = '1' then
                q_internal <= not q_internal;
            end if;
        end if;
    end process;

    Q <= q_internal;
end Behavioral;


