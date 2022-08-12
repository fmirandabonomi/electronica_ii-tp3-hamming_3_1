library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use WORK.utils.all;

entity hamming_3_1_tb is
-- vacía
end hamming_3_1_tb;

architecture tb of hamming_3_1_tb is
    component hamming_3_1_encoder is
        port (
            x : IN  std_logic;
            y : OUT std_logic_vector (2 downto 0));
    end component;
    component hamming_3_1_decoder is
        port (
            x : IN  std_logic_vector (2 downto 0);
            y : OUT std_logic);
    end component;
    signal x   : std_logic := '0';
    signal y_1 : std_logic_vector (2 downto 0);
    signal y_2 : std_logic_vector (2 downto 0);
    signal z   : std_logic;
    signal err : std_logic_vector (2 downto 0) := o"0";
begin
    enc: hamming_3_1_encoder port map(
        x => x,
        y => y_1);
    dec: hamming_3_1_decoder port map(
        x => y_2,
        y => z);
    y_2 <= y_1 xor err;
    process
        constant s_test   : string := "Debe implementar codificacion y decodificacion de codigo Hamming (3,1)";
        constant s_pass   : string := " [PASS]";
        constant s_fail   : string := " [FAIL]";
        variable a        : std_logic_vector(2 downto 0);
        variable pass     : boolean := true;
        variable pass_all : boolean := true;
    begin
        x <= '0';
        wait for 1 ns;
        a := y_1;
        x <= '1';
        wait for 1 ns;
        pass     := hdist(a,y_1) = 3;
        pass_all := pass and pass_all;
        assert pass
            report "Distancia entre los codigos para 0 y 1 debe ser 3" severity error;
        for i in 0 to 1 loop
            if not pass_all then
                exit;
            end if;
            x   <= std_logic(to_unsigned(i,1)(0));
            err <= "000";
            wait for 1 ns;
            pass     := z = x;
            pass_all := pass and pass_all;
            assert pass
                report "Salida ("&std_logic'image(z)&") distinta de entrada ("&std_logic'image(x)&")" severity error;
            for j in 0 to 2 loop
                if not pass_all then
                    exit;
                end if;
                err <= std_logic_vector(to_unsigned(2**j,3));
                wait for 1 ns;
                pass     := z = x;
                pass_all := pass and pass_all;
                assert pass
                    report "No pudo recuperarse el error """&str_lv(err)&"""" severity error;
            end loop;
        end loop;
        if pass_all then
            report s_test&s_pass severity note;
        else
            report s_test&s_fail severity error;
        end if;
        wait;
    end process;
end tb;