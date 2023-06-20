-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 20.6.2023 10:28:05 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_Biestables_Map is
end tb_Biestables_Map;

architecture tb of tb_Biestables_Map is

    component Biestables_Map
        port (clk    : in std_logic;
              reset  : in std_logic;
              leds   : out std_logic_vector (7 downto 0));
    end component;

    signal sClk    : std_logic;
    signal sReset  : std_logic;
    signal leds   : std_logic_vector (7 downto 0);

begin

    dut : Biestables_Map
    port map (clk    => sClk,
              reset  => sReset,
              leds   => leds);
              
    process
    begin
        sClk <= '0';
        wait for 5 ns;
        sClk <= '1';
        wait for 5 ns;
    end process;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        sReset <= '1';
        wait for 5 ns;
        -- EDIT Add stimuli here
        sReset <= '0';
        wait for 5 ns;
        
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_Biestables_Map of tb_Biestables_Map is
    for tb
    end for;
end cfg_tb_Biestables_Map;