----------------------------------------------------------
--	AUTOR: ULISES MARTINEZ RODRIGUEZ
--	DATE: 2020-11-25
--	DESCRIPTION: COMPUERTA XOR
----------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY XOR_C IS
	PORT(
		X:		IN		STD_LOGIC;
		Y:		IN		STD_LOGIC;
		Z:		OUT		STD_LOGIC
	);
END ENTITY;					  

ARCHITECTURE DATAFLOW OF XOR_C IS
BEGIN
	
	Z <= X XOR Y;
	
END ARCHITECTURE;
