----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.06.2023 10:28:52
-- Design Name: 
-- Module Name: Biestable_D - Behavioral
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



entity Biestable_D is
    port(
            clk, reset: in std_logic;
            d: in std_logic;
            q: out std_logic
   );
end Biestable_D;

architecture Behavioral of Biestable_D is
begin
	process(clk, reset)
	begin
		if (reset = '0') then 
			q <= '0';
		elsif (clk'event and clk = '1') then-- si no existe un reset y el cambio de clk=1
			q <= d;-- funcionamiento normal del ffd
		end if;
	end process;
end Behavioral;
