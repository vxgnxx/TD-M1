LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY OPXOR IS
  PORT(
	 entrada1, entrada2: in std_logic_vector(3 downto 0);
	 saida: out std_logic_vector(3 downto 0)
  );
end OPXOR;

architecture arq_OPXOR of OPXOR is
begin
  saida <= entrada1 xor entrada2;
end arq_OPXOR;