LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY OPOR IS
  PORT(
	 entrada1, entrada2: in std_logic_vector(3 downto 0);
	 saida: out std_logic_vector(3 downto 0)
  );
end OPOR;

architecture arq_OPOR of OPOR is
begin
  saida <= entrada1 or entrada2;
end arq_OPOR;