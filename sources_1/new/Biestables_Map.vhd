----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.06.2023 10:23:36
-- Design Name: 
-- Module Name: Biestables_Map - Behavioral
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
use ieee.numeric_std.all;

entity Biestables_Map is
  port (
        clk: in std_logic;
        reset : in std_logic;
 --       enable : in std_logic;
--        salida: inout std_logic;
        leds: out std_logic_vector(7 downto 0)
        --d00, d01, d02, d03, d04, d05, d06, d07: in std_logic;
--        S2, S1, S0: in std_logic
    );
end Biestables_Map;

architecture Behavioral of Biestables_Map is    
    signal q_temp00, q_temp01, q_temp02, q_temp03, q_temp04, q_temp05, q_temp06, q_temp07: std_logic := '0';
--    signal q_temp10, q_temp11, q_temp12, q_temp13, q_temp14, q_temp15, q_temp16, q_temp17: std_logic;  
--    signal q_temp20, q_temp21, q_temp22, q_temp23, q_temp24, q_temp25, q_temp26, q_temp27: std_logic;
--    signal q_temp30, q_temp31, q_temp32, q_temp33, q_temp34, q_temp35, q_temp36, q_temp37: std_logic;
--    signal q_temp40, q_temp41, q_temp42, q_temp43, q_temp44, q_temp45, q_temp46, q_temp47: std_logic;
--    signal q_temp50, q_temp51, q_temp52, q_temp53, q_temp54, q_temp55, q_temp56, q_temp57: std_logic;
--    signal q_temp60, q_temp61, q_temp62, q_temp63, q_temp64, q_temp65, q_temp66, q_temp67: std_logic;
--    signal q_temp70, q_temp71, q_temp72, q_temp73, q_temp74, q_temp75, q_temp76, q_temp77: std_logic;
    signal Z : std_logic_vector(7 downto 0);
    
    signal clk_div : std_logic;
    
    signal D: std_logic_vector(7 downto 0);
    signal d00, d01, d02, d03, d04, d05, d06, d07: std_logic;
    
    signal random_out: integer range 0 to 7;
    signal column: integer range 0 to 7;
    
--    signal leds: std_logic_vector(7 downto 0);

    begin
    Divisor: entity work.Divisor_Frecuencia port map(clk, clk_div);
    GenPseudoaleatorio: entity work.GeneradorPseudoaleatorio port map (clk_div, reset, random_out);
    
--    Decodificador : entity work.Decodificador_3x8 port map (enable, random_out, D);
--    D(0) <= d00;
--    D(1) <= d01;
--    D(2) <= d02;
--    D(3) <= d03;
--    D(4) <= d04;
--    D(5) <= d05;
--    D(6) <= d06;
--    D(7) <= d07;

--    d00 <= D(0);
--    d01 <= D(1);
--    d02 <= D(2);
--    d03 <= D(3);
--    d04 <= D(4);
--    d05 <= D(5);
--    d06 <= D(6);
--    d07 <= D(7);
    
--    process (reset, enable, random_out)
--    begin
--        if reset = '1' then
--            column <= 0; -- Inicializar column en 0 cuando se activa el reset
--        elsif enable = '1' then
--            column <= random_out;
--        end if;
--    end process;
    
    process (clk_div, random_out)
    begin
        if rising_edge(clk_div) then
            case random_out is
                when 0 =>
                     q_temp00 <= '1';
                when 1 =>
                     q_temp01 <= '1';
                when 2 =>
                     q_temp02 <= '1';
                when 3 =>
                     q_temp03 <= '1'; 
                when 4 =>
                     q_temp04 <= '1'; 
                when 5 =>
                     q_temp05 <= '1'; 
                when 6 =>
                     q_temp06 <= '1'; 
                when 7 =>
                     q_temp07 <= '1';
                end case;
        end if;
    end process;
--    process (column)
--    begin
--        case column is
--            when 0 =>
--                salida <= q_temp00;
--            when 1 =>
--                salida <= q_temp01;
--            when 2 =>
--                salida <= q_temp02;
--            when 3 =>
--                salida <= q_temp03;
--            when 4 =>
--                salida <= q_temp04;
--            when 5 =>
--                salida <= q_temp05;
--            when 6 =>
--                salida <= q_temp06;
--            when 7 =>
--                salida <= q_temp07;
--            when others =>
--                -- Lógica para casos no contemplados
--                salida <= '0'; -- Por ejemplo, asignar un valor por defecto
--        end case;
--    end process;
  
                    
--    Biestable00: entity work.Biestable_D port map (clk_div, reset, d00, q_temp00);
--    Biestable01: entity work.Biestable_D port map (clk_div, reset, d01, q_temp01);
--    Biestable02: entity work.Biestable_D port map (clk_div, reset, d02, q_temp02);
--    Biestable03: entity work.Biestable_D port map (clk_div, reset, d03, q_temp03);
--    Biestable04: entity work.Biestable_D port map (clk_div, reset, d04, q_temp04);
--    Biestable05: entity work.Biestable_D port map (clk_div, reset, d05, q_temp05);
--    Biestable06: entity work.Biestable_D port map (clk_div, reset, d06, q_temp06);
--    Biestable07: entity work.Biestable_D port map (clk_div, reset, d07, q_temp07);
    
    leds(0) <= q_temp00;
    leds(1) <= q_temp01;
    leds(2) <= q_temp02;
    leds(3) <= q_temp03;
    leds(4) <= q_temp04;
    leds(5) <= q_temp05;
    leds(6) <= q_temp06;
    leds(7) <= q_temp07;
    
    
end Behavioral;