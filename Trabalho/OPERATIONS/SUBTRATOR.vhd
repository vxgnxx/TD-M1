LIBRARY	IEEE;
USE IEEE.std_logic_1164.all;

ENTITY SUBTRATOR IS
  PORT(
	  entrada1, entrada2: in std_logic_vector(3 downto 0);
	  saidac: out std_logic_vector(3 downto 0);
	  over: out std_logic
  );
end  SUBTRATOR;

architecture arq_SUBTRATOR of SUBTRATOR is

SIGNAL carry, saida: std_logic_vector(3 downto 0);

COMPONENT FULLADDER
  PORT(
	  entradaA, entradaB, controle: in std_logic;
	  saida, over: out std_logic
  );
END COMPONENT;

begin 
  saida1: FULLADDER
    port map(entradaA => entrada1(0), entradaB => not entrada2(0), controle => '1', saida => saida(0), over => carry(0));
    
  saida2: FULLADDER
    port map(entradaA => entrada1(1), entradaB => not entrada2(1), controle => carry(0), saida => saida(1), over => carry(1));
    
  saida3: FULLADDER
    port map(entradaA => entrada1(2), entradaB => not entrada2(2), controle => carry(1), saida => saida(2), over => carry(2));
    
  saida4: FULLADDER
    port map(entradaA => entrada1(3), entradaB => not entrada2(3), controle => carry(2), saida => saida(3), over => carry(3));
	 
	over <= carry(3);
	saidac <= saida;
      
end arq_SUBTRATOR;