----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.06.2023 10:25:54
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity GeneradorPseudoaleatorio is
    port (
        clk, reset: in std_logic;
        random_out: out integer range 0 to 7
    );
end GeneradorPseudoaleatorio;

architecture Behavioral of GeneradorPseudoaleatorio is
    signal counter: integer range 0 to 7; -- Contador para recorrer los ciclos
    signal column_random: integer range 0 to 7; -- Columna actual
begin
    process(clk, reset)
    begin
        if reset = '1' then
            counter <= 0; -- Reiniciar el contador en el inicio
            column_random <= 0; -- Inicializar la columna con el valor correspondiente al primer ciclo
        elsif rising_edge(clk) then
            if counter = 7 then
                counter <= 0; -- Reiniciar el contador después de alcanzar el último ciclo
            else
                counter <= counter + 1; -- Incrementar el contador
            end if;
            
            case counter is
                when 0 =>
                    column_random <= 0; 
                when 1 =>
                    column_random <= 5; 
                when 2 =>
                    column_random <= 3; 
                when 3 =>
                    column_random <= 4; 
                when 4 =>
                    column_random <= 2; 
                when 5 =>
                    column_random <= 6;
                when 6 =>
                    column_random <= 1; 
                when 7 =>
                    column_random <= 7;
            end case;
        end if;
    end process;

    random_out <= column_random;
end Behavioral;