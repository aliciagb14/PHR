----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.06.2023 16:54:18
-- Design Name: 
-- Module Name: Decodificador_3x8 - Behavioral
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

entity Decodificador_3x8 is
    port (
        E: in std_logic;
        S: in std_logic_vector(2 downto 0);
        D: out std_logic_vector(7 downto 0)
    );
end Decodificador_3x8;

architecture Behavioral of Decodificador_3x8 is
begin
  process(S,E)
  begin
    case s is
        when "000" =>
            if E ='1' then
                D <= "00000001";
            else
                D <= "00000000";
            end if;
        when "001" =>
            if E ='1' then
                D <= "00000010";
            else
                D <= "00000000";
            end if;
        when "010" =>
            if E ='1' then
                D <= "00000100";
            else
                D <= "00000000";
            end if;
            when "011" =>
            if E ='1' then
                D <= "00001000";
            else
                D <= "00000000";
            end if;
            when "100" =>
            if E ='1' then
                D <= "00010000";
            else
                D <= "00000000";
            end if;
            when "101" =>
            if E ='1' then
                D <= "00100000";
            else
                D <= "00000000";
            end if;
            when "110" =>
            if E ='1' then
                D <= "01000000";
            else
                D <= "00000000";
            end if;
            when "111" =>
            if E ='1' then
                D <= "10000000";
            else
                D <= "00000000";
            end if;
            when others =>
                D <= "00000000";           
        end case;

  end process;      
end Behavioral;
