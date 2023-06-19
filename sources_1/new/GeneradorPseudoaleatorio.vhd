----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.06.2023 16:58:51
-- Design Name: 
-- Module Name: GeneradorPseudoaleatorio - Behavioral
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

entity GeneradorPseudoaleatorio is
    port (
        clk, reset: in std_logic;
        random_out: out std_logic_vector(2 downto 0)
    );
end GeneradorPseudoaleatorio;

architecture Behavioral of GeneradorPseudoaleatorio is
    signal shift_reg: std_logic_vector(2 downto 0);
    begin
        process(clk, reset)
        begin
            if reset = '1' then
                shift_reg <= "000";
            elsif rising_edge(clk) then
                if shift_reg = "111" then
                    shift_reg <= "001"; -- Cargar un nuevo valor inicial después de alcanzar el máximo
                else
                    shift_reg <= shift_reg(1 downto 0) & shift_reg(2); -- Desplazar el registro
                end if;
            end if;
        end process;
    
        random_out <= shift_reg; -- La salida es el contenido actual del registro de desplazamiento
    

end Behavioral;
