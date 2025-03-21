LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY MUX21 IS
	PORT(
	  entrada0: in std_logic;
	  entrada1: in std_logic;
	  sel: in std_logic;
	  saida: out std_logic
  );
end MUX21;
architecture arq_MUX21 of MUX21 is
begin 
	with sel select
	
	saida <= entrada0 when '0',
				entrada1 when '1';

end arq_MUX21;
