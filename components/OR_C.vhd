----------------------------------------------------------
--	AUTOR: ULISES MARTINEZ RODRIGUEZ
--	DATE: 2020-12-07
--	DESCRIPTION: FUNCION OR
----------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY OR_C IS
	PORT(
		X:	IN	STD_LOGIC;
		Y:	IN	STD_LOGIC;
		Z:	OUT	STD_LOGIC
	);
END ENTITY;

ARCHITECTURE DATAFLOW OF OR_C IS
BEGIN
	Z <= X OR Y;
END ARCHITECTURE;