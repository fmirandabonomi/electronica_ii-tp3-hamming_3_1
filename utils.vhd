library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
package utils is
    function hdist (a : std_logic_vector; b : std_logic_vector) return natural;
    function str_lv(a : std_logic_vector) return string;
end package utils;

package body utils is
    function hdist (a : std_logic_vector; b : std_logic_vector) return natural is
    variable w : unsigned(a'range);
    variable d : natural :=0;
    begin
        w := unsigned(a xor b);
        while to_integer(w) /= 0 loop
            w := w and (w - 1);
            d := d + 1;
        end loop;
        return d;
    end function;
    function str_lv(a: std_logic_vector) return string is
        variable str : string(a'range);
    begin
        for i in a'range loop
            case a(i) is
                when '0' => str(i) := '0';
                when '1' => str(i) := '1';
                when 'U' => str(i) := 'U';
                when 'Z' => str(i) := 'Z';
                when 'W' => str(i) := 'W';
                when 'L' => str(i) := 'L';
                when 'H' => str(i) := 'H';
                when '-' => str(i) := '-';
                when others => str(i) := 'X';
            end case;
        end loop;
        return str;
    end function;
end package body utils;