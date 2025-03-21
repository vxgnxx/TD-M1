LIBRARY	IEEE;
USE IEEE.std_logic_1164.all;

ENTITY COMP2 IS
  PORT(
  entrada: in std_logic_vector(3 downto 0);
  saida: out std_logic_vector(3 downto 0)
  );
end COMP2;

architecture arq_COMP2 of COMP2 is

	COMPONENT ADDERSUB -- SOMADOR/SUBTRATOR
		PORT(
				entrada1, entrada2: in std_logic_vector(3 downto 0);
				controle: in std_logic;
				saidac: out std_logic_vector(3 downto 0);
				over: out std_logic			
		);
	END COMPONENT;
	
		begin
		SOMADORSUBTRATOR: ADDERSUB
			port map(entrada1 => not entrada, entrada2 => "0001", controle => '0', saidac => saida);

end arq_COMP2;
