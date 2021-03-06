----------------------------------------------------------
--	AUTOR: ULISES MARTINEZ RODRIGUEZ
--	DATE: 2020-11-29
--	DESCRIPTION: FUNCION OR DE 71 BITS
----------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY OR_C_71_BITS IS
	PORT(
		X:	IN	STD_LOGIC_VECTOR(70 DOWNTO 0);
		O:	OUT	STD_LOGIC
	);
END ENTITY;

ARCHITECTURE DATAFLOW OF OR_C_71_BITS IS
BEGIN
	O <= X(0) OR X(1) OR X(2) OR X(3) OR X(4) OR X(5) OR X(6) OR X(7) OR X(8) OR X(9) OR X(10) OR X(11) OR X(12) OR X(13) OR X(14) OR X(15) OR X(16) OR X(17) OR X(18) OR X(19) OR X(20) OR X(21) OR X(22) OR X(23) OR X(24) OR X(25) OR X(26) OR X(27) OR X(28) OR X(29) OR X(30) OR X(31) OR X(32) OR X(33) OR X(34) OR X(35) OR X(36) OR X(37) OR X(38) OR X(39) OR X(40) OR X(41) OR X(42) OR X(43) OR X(44) OR X(45) OR X(46) OR X(47) OR X(48) OR X(49) OR X(50) OR X(51) OR X(52) OR X(53) OR X(54) OR X(55) OR X(56) OR X(57) OR X(58) OR X(59) OR X(60) OR X(61) OR X(62) OR X(63) OR X(64) OR X(65) OR X(66) OR X(67) OR X(68) OR X(69) OR X(70);
END ARCHITECTURE;