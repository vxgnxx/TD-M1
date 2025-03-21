LIBRARY	IEEE;
USE IEEE.std_logic_1164.all;

ENTITY ADDERSUB IS
  PORT(
	  entrada1, entrada2: in std_logic_vector(3 downto 0);
	  controle: in std_logic;
	  saidac: out std_logic_vector(3 downto 0);
	  over: out std_logic
  );
end ADDERSUB;

architecture arq_ADDERSUB of ADDERSUB is

SIGNAL carry: std_logic_vector(3 downto 0);

COMPONENT FULLADDER
  PORT(
	  entradaA, entradaB, controle: in std_logic;
	  saida, over: out std_logic
  );
END COMPONENT;

begin 
  saida1: FULLADDER
    port map(entradaA => entrada1(0), entradaB => entrada2(0) xor controle, controle => controle, saida => saidac(0), over => carry(0));
    
  saida2: FULLADDER
    port map(entradaA => entrada1(1), entradaB => entrada2(1) xor controle, controle => carry(0), saida => saidac(1), over => carry(1));
    
  saida3: FULLADDER
    port map(entradaA => entrada1(2), entradaB => entrada2(2) xor controle, controle => carry(1), saida => saidac(2), over => carry(2));
    
  saida4: FULLADDER
    port map(entradaA => entrada1(3), entradaB => entrada2(3) xor controle, controle => carry(2), saida => saidac(3), over => carry(3));
	 
	over <= carry(3) xor carry(2);
      
end arq_ADDERSUB;