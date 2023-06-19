----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.06.2023 16:50:07
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
        enable : in std_logic;
        salida: out std_logic;
        S2, S1, S0: in std_logic
    );
end Biestables_Map;

architecture Behavioral of Biestables_Map is    
    signal q_temp00, q_temp01, q_temp02, q_temp03, q_temp04, q_temp05, q_temp06, q_temp07: std_logic;  
    signal q_temp10, q_temp11, q_temp12, q_temp13, q_temp14, q_temp15, q_temp16, q_temp17: std_logic;  
    signal q_temp20, q_temp21, q_temp22, q_temp23, q_temp24, q_temp25, q_temp26, q_temp27: std_logic;
    signal q_temp30, q_temp31, q_temp32, q_temp33, q_temp34, q_temp35, q_temp36, q_temp37: std_logic;
    signal q_temp40, q_temp41, q_temp42, q_temp43, q_temp44, q_temp45, q_temp46, q_temp47: std_logic;
    signal q_temp50, q_temp51, q_temp52, q_temp53, q_temp54, q_temp55, q_temp56, q_temp57: std_logic;
    signal q_temp60, q_temp61, q_temp62, q_temp63, q_temp64, q_temp65, q_temp66, q_temp67: std_logic;
    signal q_temp70, q_temp71, q_temp72, q_temp73, q_temp74, q_temp75, q_temp76, q_temp77: std_logic;
    signal Z : std_logic_vector(7 downto 0);
    
    signal clk_div : std_logic;
    
    signal D: std_logic_vector(7 downto 0);
    signal d00, d01, d02, d03, d04, d05, d06, d07: std_logic;
    
    signal random_out: std_logic_vector(2 downto 0);
    signal column: integer range 0 to 7;

    begin
    
    GenPseudoaleatorio: entity work.GeneradorPseudoaleatorio port map (clk, reset, random_out);
    
    Decodificador : entity work.Decodificador_3x8 port map (enable, random_out, D);
    d00 <= D(0);
    d01 <= D(1);
    d02 <= D(2);
    d03 <= D(3);
    d04 <= D(4);
    d05 <= D(5);
    d06 <= D(6);
    d07 <= D(7);
    salida <= random_out(0);
    
    process (reset, enable, random_out)
    begin
        if reset = '1' then
            -- Lógica de reset
            column <= 0; -- Inicializar column en 0 cuando se activa el reset
        elsif enable = '1' then
            column <= to_integer(unsigned(random_out));
        end if;
    end process;

    process (column)
    begin
        case column is
            when 0 =>
                salida <= q_temp00;
            when 1 =>
                salida <= q_temp01;
            when 2 =>
                salida <= q_temp02;
            when 3 =>
                salida <= q_temp03;
            when 4 =>
                salida <= q_temp04;
            when 5 =>
                salida <= q_temp05;
            when 6 =>
                salida <= q_temp06;
            when 7 =>
                salida <= q_temp07;
            when others =>
                -- Lógica para casos no contemplados
                salida <= '0'; -- Por ejemplo, asignar un valor por defecto
        end case;
    end process;
                 
    Divisor: entity work.Divisor_Frecuencia port map(clk, reset, clk_div);
                    
    Biestable00: entity work.Biestable_D port map (clk_div, d00, q_temp00);
    Biestable01: entity work.Biestable_D port map (clk_div, d01, q_temp01);
    Biestable02: entity work.Biestable_D port map (clk_div, d02, q_temp02);
    Biestable03: entity work.Biestable_D port map (clk_div, d03, q_temp03);
    Biestable04: entity work.Biestable_D port map (clk_div, d04, q_temp04);
    Biestable05: entity work.Biestable_D port map (clk_div, d05, q_temp05);
    Biestable06: entity work.Biestable_D port map (clk_div, d06, q_temp06);
    Biestable07: entity work.Biestable_D port map (clk_div, d07, q_temp07);
    
    Biestable10: entity work.Biestable_D port map (clk_div, q_temp00, q_temp10);
    Biestable11: entity work.Biestable_D port map (clk_div, q_temp01, q_temp11);
    Biestable12: entity work.Biestable_D port map (clk_div, q_temp02, q_temp12);
    Biestable13: entity work.Biestable_D port map (clk_div, q_temp03, q_temp13);
    Biestable14: entity work.Biestable_D port map (clk_div, q_temp04, q_temp14);
    Biestable15: entity work.Biestable_D port map (clk_div, q_temp05, q_temp15);
    Biestable16: entity work.Biestable_D port map (clk_div, q_temp06, q_temp16);
    Biestable17: entity work.Biestable_D port map (clk_div, q_temp07, q_temp17);
    
    Biestable20: entity work.Biestable_D port map (clk_div, q_temp10, q_temp20);
    Biestable21: entity work.Biestable_D port map (clk_div, q_temp11, q_temp21);
    Biestable22: entity work.Biestable_D port map (clk_div, q_temp12, q_temp22);
    Biestable23: entity work.Biestable_D port map (clk_div, q_temp13, q_temp23);
    Biestable24: entity work.Biestable_D port map (clk_div, q_temp14, q_temp24);
    Biestable25: entity work.Biestable_D port map (clk_div, q_temp15, q_temp25);
    Biestable26: entity work.Biestable_D port map (clk_div, q_temp16, q_temp26);
    Biestable27: entity work.Biestable_D port map (clk_div, q_temp17, q_temp27);
    
    Biestable30: entity work.Biestable_D port map (clk_div, q_temp20, q_temp30);
    Biestable31: entity work.Biestable_D port map (clk_div, q_temp21, q_temp31);
    Biestable32: entity work.Biestable_D port map (clk_div, q_temp22, q_temp32);
    Biestable33: entity work.Biestable_D port map (clk_div, q_temp23, q_temp33);
    Biestable34: entity work.Biestable_D port map (clk_div, q_temp24, q_temp34);
    Biestable35: entity work.Biestable_D port map (clk_div, q_temp25, q_temp35);
    Biestable36: entity work.Biestable_D port map (clk_div, q_temp26, q_temp36);
    Biestable37: entity work.Biestable_D port map (clk_div, q_temp27, q_temp37);
    
    Biestable40: entity work.Biestable_D port map (clk_div, q_temp30, q_temp40);
    Biestable41: entity work.Biestable_D port map (clk_div, q_temp31, q_temp41);
    Biestable42: entity work.Biestable_D port map (clk_div, q_temp32, q_temp42);
    Biestable43: entity work.Biestable_D port map (clk_div, q_temp33, q_temp43);
    Biestable44: entity work.Biestable_D port map (clk_div, q_temp34, q_temp44);
    Biestable45: entity work.Biestable_D port map (clk_div, q_temp35, q_temp45);
    Biestable46: entity work.Biestable_D port map (clk_div, q_temp36, q_temp46);
    Biestable47: entity work.Biestable_D port map (clk_div, q_temp37, q_temp47);
    
    Biestable50: entity work.Biestable_D port map (clk_div, q_temp40, q_temp50);
    Biestable51: entity work.Biestable_D port map (clk_div, q_temp41, q_temp51);
    Biestable52: entity work.Biestable_D port map (clk_div, q_temp42, q_temp52);
    Biestable53: entity work.Biestable_D port map (clk_div, q_temp43, q_temp53);
    Biestable54: entity work.Biestable_D port map (clk_div, q_temp44, q_temp54);
    Biestable55: entity work.Biestable_D port map (clk_div, q_temp45, q_temp55);
    Biestable56: entity work.Biestable_D port map (clk_div, q_temp46, q_temp56);
    Biestable57: entity work.Biestable_D port map (clk_div, q_temp47, q_temp57);
    
    Biestable60: entity work.Biestable_D port map (clk_div, q_temp50, q_temp60);
    Biestable61: entity work.Biestable_D port map (clk_div, q_temp51, q_temp61);
    Biestable62: entity work.Biestable_D port map (clk_div, q_temp52, q_temp62);
    Biestable63: entity work.Biestable_D port map (clk_div, q_temp53, q_temp63);
    Biestable64: entity work.Biestable_D port map (clk_div, q_temp54, q_temp64);
    Biestable65: entity work.Biestable_D port map (clk_div, q_temp55, q_temp65);
    Biestable66: entity work.Biestable_D port map (clk_div, q_temp56, q_temp66);
    Biestable67: entity work.Biestable_D port map (clk_div, q_temp57, q_temp67);
    
    Biestable70: entity work.Biestable_D port map (clk_div, q_temp60, q_temp70);
    Biestable71: entity work.Biestable_D port map (clk_div, q_temp61, q_temp71);
    Biestable72: entity work.Biestable_D port map (clk_div, q_temp62, q_temp72);
    Biestable73: entity work.Biestable_D port map (clk_div, q_temp63, q_temp73);
    Biestable74: entity work.Biestable_D port map (clk_div, q_temp64, q_temp74);
    Biestable75: entity work.Biestable_D port map (clk_div, q_temp65, q_temp75);
    Biestable76: entity work.Biestable_D port map (clk_div, q_temp66, q_temp76);
    Biestable77: entity work.Biestable_D port map (clk_div, q_temp67, q_temp77);

    Z(0) <= Z(0)or q_temp70;
    Z(1) <= Z(1) or q_temp71;
    Z(2) <= Z(2) or q_temp72;
    Z(3) <= Z(3)or q_temp73;
    Z(4) <= Z(4)or q_temp74;
    Z(5) <= Z(5)or q_temp75;
    Z(6) <= Z(6)or q_temp76;
    Z(7) <= Z(7)or q_temp77;
   
    Mux0: entity work.Mux_8x3x1 port map (q_temp70, q_temp71, q_temp70, q_temp70, '0', '0', '0', '0',
                                      S2, S1, S0, Z(0));
    Mux1: entity work.Mux_8x3x1 port map (q_temp71, q_temp72, q_temp70, q_temp71, '0', '0', '0', '0',
                                      S2, S1, S0, Z(1));
    Mux2: entity work.Mux_8x3x1 port map (q_temp72, q_temp73, q_temp71, q_temp72, '0', '0', '0', '0',
                                      S2, S1, S0, Z(2));
    Mux3: entity work.Mux_8x3x1 port map (q_temp73, q_temp74, q_temp72, q_temp73, '0', '0', '0', '0',
                                      S2, S1, S0, Z(3));
    Mux4: entity work.Mux_8x3x1 port map (q_temp74, q_temp75, q_temp73, q_temp74, '1', '1', '1', '1',
                                      S2, S1, S0, Z(4));
    Mux5: entity work.Mux_8x3x1 port map (q_temp75, q_temp76, q_temp74, q_temp75, '0', '0', '0', '0',
                                      S2, S1, S0, Z(5));
    Mux6: entity work.Mux_8x3x1 port map (q_temp76, q_temp77, q_temp75, q_temp76, '0', '0', '0', '0',
                                      S2, S1, S0, Z(6));
    Mux7: entity work.Mux_8x3x1 port map (q_temp77, q_temp77, q_temp76, q_temp77, '0', '0', '0', '0',
                                      S2, S1, S0, Z(7));
    
end Behavioral;
