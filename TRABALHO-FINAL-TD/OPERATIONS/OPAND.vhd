LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY OPAND IS
  PORT(
	 entrada1, entrada2: in std_logic_vector(3 downto 0);
	 saida: out std_logic_vector(3 downto 0)
  );
end OPAND;

architecture arq_OPAND of OPAND is
begin
  saida <= entrada1 and entrada2;
end arq_OPAND;