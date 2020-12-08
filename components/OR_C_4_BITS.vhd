----------------------------------------------------------
--	AUTOR: ULISES MARTINEZ RODRIGUEZ
--	DATE: 2020-12-07
--	DESCRIPTION: FUNCION OR DE 4 BITS
----------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY OR_C_4_BITS IS
	PORT(
		I:	IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
		O:	OUT	STD_LOGIC
	);
END ENTITY;

ARCHITECTURE DATAFLOW OF OR_C_4_BITS IS
BEGIN
	O <= I(0) OR I(1) OR I(2) OR I(3);
END ARCHITECTURE;