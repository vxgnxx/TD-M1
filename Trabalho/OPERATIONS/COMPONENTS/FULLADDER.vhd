LIBRARY	IEEE;
USE IEEE.std_logic_1164.all;

ENTITY FULLADDER IS
  PORT(
	  entradaA, entradaB, controle: in std_logic;
	  saida, over: out std_logic
  );
end FULLADDER;

architecture arq_FULLADDER of FULLADDER is

begin 
  saida <= controle xor entradaA xor entradaB;
  over <= (entradaA and entradaB) or (entradaA and controle) or (entradaB and controle);
end arq_FULLADDER;