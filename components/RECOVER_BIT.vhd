----------------------------------------------------------
--	AUTOR: ULISES MARTINEZ RODRIGUEZ
--	DATE: 2020-11-26
--	DESCRIPTION: RECUPERA MSB DE UNA MANTISA DE 24 BITS
--				APARTIR DEL EXPONENTE DE 8 BITS
----------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY RECOVER_BIT IS
	PORT(
		E:		IN	STD_LOGIC_VECTOR(7 DOWNTO 0);
		M:		IN 	STD_LOGIC_VECTOR(22 DOWNTO 0);
		P:		OUT	STD_LOGIC_VECTOR(23 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE DATAFLOW OF RECOVER_BIT IS
BEGIN
	P(23) <= E(7) OR E(6) OR E(5) OR E(4) OR E(3) OR E(2) OR E(1) OR E(0);
	P(22 DOWNTO 0) <= M;
	
END ARCHITECTURE;