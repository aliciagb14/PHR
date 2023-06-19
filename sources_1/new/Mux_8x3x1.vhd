----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.06.2023 16:51:31
-- Design Name: 
-- Module Name: Mux_8x3x1 - Behavioral
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


entity Mux_8x3x1 is
    port (
        I0, I1, I2, I3, I4, I5, I6, I7 : in std_logic;
        S2, S1, S0 : in std_logic;
        Z : out std_logic
    );
end Mux_8x3x1;

architecture Behavioral of Mux_8x3x1 is
begin
  process (S2, S1, S0, I4, I5, I6, I7)
  begin
    if S2 = '1' then  -- Reset
      Z <= I0;  -- Estado actual
    elsif S1 = '1' then  -- Movimiento izquierda
      Z <= I1;  -- Movimiento izquierda
    elsif S0 = '1' then  -- Movimiento derecha
      Z <= I2;  -- Movimiento derecha
    elsif I4 = '1' then  -- Mux inicio 4
      Z <= I4;
    elsif I5 = '1' then  -- Mux inicio 5
      Z <= I5;
    elsif I6 = '1' then  -- Mux inicio 6
      Z <= I6;
    elsif I7 = '1' then  -- Mux inicio 7
      Z <= I7;
    else
      Z <= I3;  -- Estado actual por defecto
    end if;
  end process;
end Behavioral;
