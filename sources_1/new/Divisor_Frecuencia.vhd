----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.06.2023 16:55:32
-- Design Name: 
-- Module Name: Divisor_Frecuencia - Behavioral
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

entity Divisor_Frecuencia is
    generic (
        DIVIDER_VALUE : integer := 8  -- Valor de división deseado
    );
    port (
        clk      : in  std_logic;
        reset    : in  std_logic;
        divided  : out std_logic
    );
end Divisor_Frecuencia;

architecture Behavioral of Divisor_Frecuencia is
    constant max_count : integer := (5000000);  
    signal jk_out : std_logic;
    signal toggle : std_logic := '0';
begin
    BiestableInst : entity work.BiestableJK port map ('1','0', clk, reset, jk_out);

    process(jk_out)
        variable counter : integer range 0 to DIVIDER_VALUE - 1 := 0;
    begin
        if rising_edge(jk_out) then
            if counter = max_count then -- DIVIDER_VALUE - 1 then
                toggle <= not toggle;
                counter := 0;
            else counter := counter + 1;
            end if;
        end if;
    end process;

    divided <= toggle;

end Behavioral;
