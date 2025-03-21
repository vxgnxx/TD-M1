LIBRARY	IEEE;
USE IEEE.std_logic_1164.all;

ENTITY HALFADDER IS
  PORT(
	  entradaA, entradaB: in std_logic;
	  saida, over: out std_logic
  );
end HALFADDER;

architecture arq_HALFADDER of HALFADDER is

begin 
  saida <= entradaA xor entradaB;
  over <= entradaA and entradaB;
end arq_HALFADDER;