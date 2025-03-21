LIBRARY	IEEE;
USE IEEE.std_logic_1164.all;

ENTITY SOMADOR IS
  PORT(
	  entrada1, entrada2: in std_logic_vector(3 downto 0);
	  saidac: out std_logic_vector(3 downto 0);
	  over: out std_logic
  );
end  SOMADOR;

architecture arq_SOMADOR of SOMADOR is

SIGNAL carry: std_logic_vector(3 downto 0);

COMPONENT HALFADDER
	PORT (
		entradaA, entradaB: in std_logic;
		saida, over: out std_logic
	);
END COMPONENT;

COMPONENT FULLADDER
  PORT(
	  entradaA, entradaB, controle: in std_logic;
	  saida, over: out std_logic
  );
END COMPONENT;

begin 
  saida1: HALFADDER
    port map(entradaA => entrada1(0), entradaB => entrada2(0), saida => saidac(0), over => carry(0));
    
  saida2: FULLADDER
    port map(entradaA => entrada1(1), entradaB => entrada2(1), controle => carry(0), saida => saidac(1), over => carry(1));
    
  saida3: FULLADDER
    port map(entradaA => entrada1(2), entradaB => entrada2(2), controle => carry(1), saida => saidac(2), over => carry(2));
    
  saida4: FULLADDER
    port map(entradaA => entrada1(3), entradaB => entrada2(3), controle => carry(2), saida => saidac(3), over => carry(3));
	 
	over <= carry(3);
      
end arq_SOMADOR;