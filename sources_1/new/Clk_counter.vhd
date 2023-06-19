----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.06.2023 17:23:30
-- Design Name: 
-- Module Name: Clk_counter - Behavioral
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

entity clock_counter is
  generic
  (
    f: integer := 50000000
  );
  port
  (
    clock_i: in std_logic;
    clock_o: out std_logic
  );
end entity;

architecture behavior of clock_counter is
begin
  process (clock_i)
    variable counter: integer := 0;
  begin
    if rising_edge(clock_i) then
      if counter < f/2 then
        counter := counter + 1;
        clock_o <= '0';
      elsif counter < f then
        counter := counter + 1;
        clock_o <= '1';
      end if;

      if counter = f then
        counter := 0;
      end if;
    end if;
  end process;
end architecture;