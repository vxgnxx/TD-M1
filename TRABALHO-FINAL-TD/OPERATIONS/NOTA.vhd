LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY NOTA IS
  PORT(
	 entrada: in std_logic_vector(3 downto 0);
	 saida: out std_logic_vector(3 downto 0)
  );
end NOTA;

architecture arq_NOTA of NOTA is
begin
  saida <= not entrada;
end arq_NOTA;