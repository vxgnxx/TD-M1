LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY SEG14 IS
	PORT(
		entrada: in std_logic_vector(3 downto 0);
		saida: out std_logic_vector(13 downto 0)
	);
end SEG14;

architecture arq_SEG14 of SEG14 is

begin
	with entrada select
		saida <= 	"11111101111110" when "0000",
						"11111100110000" when "0001",
						"11111101101101" when "0010",
						"11111101111001" when "0011",
						"11111100110011" when "0100",
						"11111101011011" when "0101",
						"11111101011111" when "0110",
						"11111101110000" when "0111",
						"11111101111111" when "1000",
						"11111101111011" when "1001",
						"01100001111110" when "1010",
						"01100000110000" when "1011",
						"01100001101101" when "1100",
						"01100001111001" when "1101",
						"01100000110011" when "1110",
						"01100001011011" when "1111";

end arq_SEG14;

