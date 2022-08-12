library IEEE;
use IEEE.std_logic_1164.all;

entity hamming_3_1_decoder is
    port (
        x : IN  std_logic_vector (2 downto 0);
        y : OUT std_logic);
end hamming_3_1_decoder;

architecture arch of hamming_3_1_decoder is
begin -- implementar la decodificación con corrección de error
    y <= '0' ;
end arch;