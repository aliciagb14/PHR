----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.06.2023 16:46:13
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

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
