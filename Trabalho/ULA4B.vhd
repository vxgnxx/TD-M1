LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY ULA4B IS
	PORT(
		a: in std_logic_vector(3 downto 0);  -- ENTRADA A
		b: in std_logic_vector(3 downto 0);  -- ENTRADA B
		f: in std_logic_vector(2 downto 0);  -- SELECIONAR FUNÇÃO
		v: out std_logic;                    -- OVERFLOW
		n: out std_logic;                    -- NEGATIVO
		z: out std_logic;                    -- ZERO
		s: out std_logic_vector(13 downto 0) -- SAIDA
	);
end ULA4B;


architecture arq_ULA4B of ULA4B is

	SIGNAL saidaSomador, saidaSubtrator, saidaSL, saidaSR, saidaAnd, saidaXor, saidaOr, saidaNotA, saidaModulo, saidaGeral, entradaSeg: std_logic_vector(3 downto 0);
	SIGNAL saidaSeg14: std_logic_vector(13 downto 0);
	SIGNAL neg, osoma, osub: std_logic;
	
	COMPONENT SEG14 -- SAIDA 14 BITS
		PORT(
			entrada: in std_logic_vector(3 downto 0);
			saida: out std_logic_vector(13 downto 0)		
		);
	END COMPONENT;
	
	COMPONENT COMP2 -- VALOR ABSOLUTO
		PORT(
			entrada: in std_logic_vector(3 downto 0);
			saida: out std_logic_vector(3 downto 0)		
		);
	END COMPONENT;
	

	COMPONENT SUBTRATOR -- SOMADOR/SUBTRATOR
		PORT(
				entrada1, entrada2: in std_logic_vector(3 downto 0);
				saidac: out std_logic_vector(3 downto 0);
				over: out std_logic			
		);
	END COMPONENT;
	
	COMPONENT SOMADOR -- SOMADOR
		PORT(
			entrada1, entrada2: in std_logic_vector(3 downto 0);
			saidac: out std_logic_vector(3 downto 0);
			over: out std_logic
		);
	END COMPONENT;

	COMPONENT SHIFTL -- DESLOCADOR ESQUERDA
		PORT(
				entrada: in std_logic_vector(3 downto 0);
				saida: out std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	COMPONENT SHIFTR -- DESLOCADOR DIREITA
		PORT(
				entrada: in std_logic_vector(3 downto 0);
				saida: out std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	COMPONENT OPAND -- OPERAÇÃO AND
		PORT(
				entrada1, entrada2: in std_logic_vector(3 downto 0);
				saida: out std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	COMPONENT OPXOR -- OPERAÇÃO XOR
		PORT(
				entrada1, entrada2: in std_logic_vector(3 downto 0);
				saida: out std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	COMPONENT OPOR -- OPERAÇÃO OR
		PORT(
				entrada1, entrada2: in std_logic_vector(3 downto 0);
				saida: out std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	COMPONENT NOTA -- OPERAÇÃO NOT A
		PORT(
				entrada: in std_logic_vector(3 downto 0);
				saida: out std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	begin
		DESLOCAL: SHIFTL
			port map(entrada => a, saida => saidaSL);
		DESLOCAR: SHIFTR
			port map(entrada => a, saida => saidaSR);
		FUNCAOE: OPAND
			port map(entrada1 => a, entrada2 => b, saida => saidaAnd);
		FUNCAOXOU: OPXOR
			port map(entrada1 => a, entrada2 => b, saida => saidaXor);
		FUNCAOOU: OPOR
			port map(entrada1 => a, entrada2 => b, saida => saidaOr);
		FUNCAONAOA: NOTA
			port map(entrada => a, saida => saidaNotA);
		SAIDA: SEG14
			port map(entrada => entradaSeg, saida => saidaSeg14);
		ABSOLUTO: COMP2
			port map(entrada => saidaGeral, saida => saidaModulo);
		SOMA: SOMADOR	
			port map(entrada1 => a, entrada2 => b, over => osoma, saidac => saidaSomador);
		SUBTRACAO: SUBTRATOR
			port map(entrada1 => a, entrada2 => b, over => osub, saidac => saidaSubtrator);
				 
		with f select -- Selecionar Funcao 
			saidaGeral <= saidaOr when "000",
							  saidaNotA when "001",
							  saidaAnd when "010",
							  saidaXor when "011",
							  saidaSL when "100",
							  saidaSR when "101",
							  saidaSomador when "110",
							  saidaSubtrator when "111";
							  
		with saidaGeral select -- Teste Num. Zero
			z <= '1' when "0000",
		    	  '0' when others;
						  
		with f select -- Teste Negativo.
			neg <= 	'0' when "110",
						saidaSomador(3) when "111",
						'0' when others;
								
		with neg select
			entradaSeg <= saidaModulo when '1',
							  saidaGeral  when others;
	   
		with f select 
			v <= osoma when "110",
				  osub when "111",
				  '0' when others;
				  
	   n <= neg;
		s <= not saidaSeg14;
			
end arq_ULA4B;