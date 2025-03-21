LIBRARY	IEEE;
USE IEEE.std_logic_1164.all;

ENTITY SHIFTR IS
	PORT(
		entrada: in std_logic_vector(3 downto 0);
		saida: out std_logic_vector(3 downto 0)
	);
end SHIFTR;

architecture arq_SHIFTR of SHIFTR is

COMPONENT MUX21
	PORT(
	  entrada0: in std_logic;
	  entrada1: in std_logic;
	  sel: in std_logic;
	  saida: out std_logic
  );
END COMPONENT;

begin 
  shift1: MUX21
    port map(entrada0 => entrada(0), entrada1 => entrada(1), sel => '1', saida => saida(0));
    
  shift2: MUX21
    port map(entrada0 => entrada(1), entrada1 => entrada(2), sel => '1', saida=> saida(1));
    
  shift3: MUX21
    port map(entrada0 => entrada(2), entrada1 => entrada(3), sel => '1', saida => saida(2));
    
  shift4: MUX21
    port map(entrada0 => entrada(3), entrada1 => '0', sel => '1', saida => saida(3));
	 
end arq_SHIFTR;