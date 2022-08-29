library IEEE;
use IEEE.std_logic_1164.all;

entity hamming_3_1_encoder is
    port (
        x : IN  std_logic;
        y : OUT std_logic_vector (2 downto 0));
end hamming_3_1_encoder;

architecture arch of hamming_3_1_encoder is
begin -- implementar la codificación
    with x select 
        y <= "000" when '0',
             "000" when others; -- '1'
end arch;