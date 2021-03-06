----------------------------------------------------------
--	AUTOR: ULISES MARTINEZ RODRIGUEZ
--	DATE: 2020-11-29
--	DESCRIPTION: REDONDEADOR, DESNORMALIZADOR Y RESULTADO
----------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ROUND IS
	PORT(
		R:	IN	STD_LOGIC_VECTOR(1 DOWNTO 0);
		S:	IN	STD_LOGIC;
		E:	IN	STD_LOGIC_VECTOR(9 DOWNTO 0);
		M:	IN	STD_LOGIC_VECTOR(47 DOWNTO 0);
		F:	OUT	STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE STRUCUTURE OF ROUND IS

COMPONENT TWO_S_COMPLE_10_BITS IS
	PORT(
		A:		IN	STD_LOGIC_VECTOR(9 DOWNTO 0);
		C:		OUT	STD_LOGIC_VECTOR(9 DOWNTO 0)
	);
END COMPONENT;

COMPONENT ADD_10_BITS IS
	PORT(
		CARRYIN:	IN	STD_LOGIC;
		ADDEND1:	IN	STD_LOGIC_VECTOR(9 DOWNTO 0);
		ADDEND2:	IN	STD_LOGIC_VECTOR(9 DOWNTO 0);
		SUM:		OUT	STD_LOGIC_VECTOR(9 DOWNTO 0);
		CARRYOUT:	OUT	STD_LOGIC
	);
END COMPONENT;

COMPONENT BITSHIFT_RIGHT_96_BITS IS
	PORT(
		A:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		O:	OUT	STD_LOGIC_VECTOR(95 DOWNTO 0)
	);
END COMPONENT;

COMPONENT MUX_128_TO_1_96_BITS IS
	PORT(
		SEL:	IN	STD_LOGIC_VECTOR(6 DOWNTO 0);
		I_0:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_1:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_2:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_3:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_4:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_5:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_6:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_7:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_8:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_9:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_10:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_11:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_12:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_13:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_14:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_15:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_16:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_17:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_18:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_19:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_20:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_21:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_22:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_23:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_24:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_25:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_26:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_27:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_28:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_29:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_30:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_31:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_32:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_33:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_34:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_35:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_36:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_37:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_38:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_39:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_40:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_41:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_42:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_43:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_44:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_45:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_46:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_47:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_48:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_49:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_50:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_51:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_52:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_53:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_54:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_55:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_56:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_57:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_58:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_59:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_60:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_61:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_62:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_63:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_64:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_65:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_66:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_67:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_68:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_69:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_70:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_71:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_72:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_73:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_74:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_75:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_76:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_77:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_78:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_79:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_80:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_81:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_82:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_83:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_84:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_85:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_86:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_87:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_88:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_89:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_90:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_91:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_92:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_93:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_94:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_95:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_96:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_97:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_98:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_99:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_100:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_101:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_102:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_103:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_104:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_105:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_106:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_107:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_108:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_109:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_110:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_111:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_112:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_113:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_114:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_115:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_116:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_117:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_118:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_119:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_120:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_121:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_122:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_123:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_124:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_125:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_126:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_127:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		O:		OUT	STD_LOGIC_VECTOR(95 DOWNTO 0)
	);
END COMPONENT;

COMPONENT MUX_2_TO_1_96_BITS IS
	PORT(
		SEL:	IN	STD_LOGIC;
		I_0:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		I_1:	IN	STD_LOGIC_VECTOR(95 DOWNTO 0);
		O:		OUT	STD_LOGIC_VECTOR(95 DOWNTO 0)
	);
END COMPONENT;

COMPONENT OR_C_71_BITS IS
	PORT(
		X:	IN	STD_LOGIC_VECTOR(70 DOWNTO 0);
		O:	OUT	STD_LOGIC
	);
END COMPONENT;

COMPONENT FUNCTION_R IS
	PORT(
		R:	IN	STD_LOGIC_VECTOR(1 DOWNTO 0);
		S:	IN	STD_LOGIC;
		RT:	IN	STD_LOGIC;
		ST:	IN	STD_LOGIC;
		V:	OUT	STD_LOGIC
	);
END COMPONENT;

COMPONENT ADD_24_BITS IS
	PORT(
		CARRYIN:	IN	STD_LOGIC;
		ADDEND1:	IN	STD_LOGIC_VECTOR(23 DOWNTO 0);
		ADDEND2:	IN	STD_LOGIC_VECTOR(23 DOWNTO 0);
		SUM:		OUT	STD_LOGIC_VECTOR(23 DOWNTO 0);
		CARRYOUT:	OUT	STD_LOGIC
	);
END COMPONENT;

COMPONENT MUX_2_TO_1_10_BITS
	PORT(
		SEL:	IN	STD_LOGIC;
		I_0:	IN	STD_LOGIC_VECTOR(9 DOWNTO 0);
		I_1:	IN	STD_LOGIC_VECTOR(9 DOWNTO 0);
		O:		OUT	STD_LOGIC_VECTOR(9 DOWNTO 0)
	);
END COMPONENT;

COMPONENT MUX_2_TO_1_8_BITS
	PORT(
		SEL:	IN	STD_LOGIC;
		I_0:	IN	STD_LOGIC_VECTOR(7 DOWNTO 0);
		I_1:	IN	STD_LOGIC_VECTOR(7 DOWNTO 0);
		O:		OUT	STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

SIGNAL REGISTER_385:	STD_LOGIC_VECTOR(9 DOWNTO 0):="0110000001";
SIGNAL REGISTER_384:	STD_LOGIC_VECTOR(9 DOWNTO 0):="0110000000";
SIGNAL REGISTER_383:	STD_LOGIC_VECTOR(9 DOWNTO 0):="0101111111";
SIGNAL REGISTER_ZERO:	STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";

SIGNAL O_COMPLE:		STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL DIFF:			STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL CARRY_D:			STD_LOGIC;
SIGNAL O_MUX_128:		STD_LOGIC_VECTOR(95 DOWNTO 0);
SIGNAL O_MUX_M:			STD_LOGIC_VECTOR(95 DOWNTO 0);
SIGNAL O_OR:			STD_LOGIC;
SIGNAL O_R:				STD_LOGIC;
SIGNAL SUM_M:			STD_LOGIC_VECTOR(23 DOWNTO 0);
SIGNAL C_SUM_M:			STD_LOGIC;
SIGNAL O_MUX_S:			STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL O_MUX_E:			STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL O_COMPLE_E:		STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL O_ADD_E:			STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL O_MUX_F:			STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL BS_R:			STD_LOGIC_VECTOR(4511 DOWNTO 0);

BEGIN
	
	COMPLE_D:	TWO_S_COMPLE_10_BITS PORT MAP(E, O_COMPLE);
	SUB:		ADD_10_BITS PORT MAP('0', O_COMPLE, REGISTER_384, DIFF, CARRY_D);
	MUX_M:		MUX_2_TO_1_96_BITS PORT MAP(CARRY_D, M & "000000000000000000000000000000000000000000000000", O_MUX_128, O_MUX_M);
	OR_C_M:		OR_C_71_BITS PORT MAP(O_MUX_M(70 DOWNTO 0), O_OR);
	FUNC:		FUNCTION_R PORT MAP(R, S, O_MUX_M(71), O_OR, O_R);
	ADD:		ADD_24_BITS PORT MAP('0', O_MUX_M(95 DOWNTO 72), "00000000000000000000000"&O_R, SUM_M, C_SUM_M);
	MUX_S:		MUX_2_TO_1_10_BITS PORT MAP(C_SUM_M, REGISTER_384, REGISTER_383, O_MUX_S);
	MUX_E:		MUX_2_TO_1_10_BITS PORT MAP(CARRY_D, E, REGISTER_385, O_MUX_E);
	COMPLE_E:	TWO_S_COMPLE_10_BITS PORT MAP(O_MUX_S, O_COMPLE_E);
	ADD_E:		ADD_10_BITS PORT MAP('0', O_MUX_E, O_COMPLE_E, O_ADD_E, OPEN);
	MUX_F:		MUX_2_TO_1_8_BITS PORT MAP(SUM_M(23) OR C_SUM_M, REGISTER_ZERO, O_ADD_E(7 DOWNTO 0), O_MUX_F);
	MUX_BS:		MUX_128_TO_1_96_BITS PORT MAP(DIFF(6 DOWNTO 0), BS_R(95 DOWNTO 0), BS_R(191 DOWNTO 96), BS_R(287 DOWNTO 192), BS_R(383 DOWNTO 288), BS_R(479 DOWNTO 384), BS_R(575 DOWNTO 480), BS_R(671 DOWNTO 576), BS_R(767 DOWNTO 672), BS_R(863 DOWNTO 768), BS_R(959 DOWNTO 864), BS_R(1055 DOWNTO 960), 
				BS_R(1151 DOWNTO 1056), BS_R(1247 DOWNTO 1152), BS_R(1343 DOWNTO 1248), BS_R(1439 DOWNTO 1344), BS_R(1535 DOWNTO 1440), BS_R(1631 DOWNTO 1536), BS_R(1727 DOWNTO 1632), BS_R(1823 DOWNTO 1728), BS_R(1919 DOWNTO 1824), BS_R(2015 DOWNTO 1920), 
				BS_R(2111 DOWNTO 2016), BS_R(2207 DOWNTO 2112), BS_R(2303 DOWNTO 2208), BS_R(2399 DOWNTO 2304), BS_R(2495 DOWNTO 2400), BS_R(2591 DOWNTO 2496), BS_R(2687 DOWNTO 2592), BS_R(2783 DOWNTO 2688), BS_R(2879 DOWNTO 2784), BS_R(2975 DOWNTO 2880), 
				BS_R(3071 DOWNTO 2976), BS_R(3167 DOWNTO 3072), BS_R(3263 DOWNTO 3168), BS_R(3359 DOWNTO 3264), BS_R(3455 DOWNTO 3360), BS_R(3551 DOWNTO 3456), BS_R(3647 DOWNTO 3552), BS_R(3743 DOWNTO 3648), BS_R(3839 DOWNTO 3744), BS_R(3935 DOWNTO 3840), 
				BS_R(4031 DOWNTO 3936), BS_R(4127 DOWNTO 4032), BS_R(4223 DOWNTO 4128), BS_R(4319 DOWNTO 4224), BS_R(4415 DOWNTO 4320), BS_R(4511 DOWNTO 4416), "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", 
				"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", 
				"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", 
				"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", 
				"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", 
				"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", 
				"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", 
				"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", 
				"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", O_MUX_128);
	BS1:			BITSHIFT_RIGHT_96_BITS PORT MAP(M & "000000000000000000000000000000000000000000000000", BS_R(95 DOWNTO 0));
	BS2:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(95 DOWNTO 0), BS_R(191 DOWNTO 96));
	BS3:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(191 DOWNTO 96), BS_R(287 DOWNTO 192));
	BS4:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(287 DOWNTO 192), BS_R(383 DOWNTO 288));
	BS5:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(383 DOWNTO 288), BS_R(479 DOWNTO 384));
	BS6:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(479 DOWNTO 384), BS_R(575 DOWNTO 480));
	BS7:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(575 DOWNTO 480), BS_R(671 DOWNTO 576));
	BS8:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(671 DOWNTO 576), BS_R(767 DOWNTO 672));
	BS9:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(767 DOWNTO 672), BS_R(863 DOWNTO 768));
	BS10:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(863 DOWNTO 768), BS_R(959 DOWNTO 864));
	BS11:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(959 DOWNTO 864), BS_R(1055 DOWNTO 960));
	BS12:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(1055 DOWNTO 960), BS_R(1151 DOWNTO 1056));
	BS13:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(1151 DOWNTO 1056), BS_R(1247 DOWNTO 1152));
	BS14:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(1247 DOWNTO 1152), BS_R(1343 DOWNTO 1248));
	BS15:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(1343 DOWNTO 1248), BS_R(1439 DOWNTO 1344));
	BS16:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(1439 DOWNTO 1344), BS_R(1535 DOWNTO 1440));
	BS17:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(1535 DOWNTO 1440), BS_R(1631 DOWNTO 1536));
	BS18:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(1631 DOWNTO 1536), BS_R(1727 DOWNTO 1632));
	BS19:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(1727 DOWNTO 1632), BS_R(1823 DOWNTO 1728));
	BS20:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(1823 DOWNTO 1728), BS_R(1919 DOWNTO 1824));
	BS21:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(1919 DOWNTO 1824), BS_R(2015 DOWNTO 1920));
	BS22:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(2015 DOWNTO 1920), BS_R(2111 DOWNTO 2016));
	BS23:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(2111 DOWNTO 2016), BS_R(2207 DOWNTO 2112));
	BS24:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(2207 DOWNTO 2112), BS_R(2303 DOWNTO 2208));
	BS25:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(2303 DOWNTO 2208), BS_R(2399 DOWNTO 2304));
	BS26:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(2399 DOWNTO 2304), BS_R(2495 DOWNTO 2400));
	BS27:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(2495 DOWNTO 2400), BS_R(2591 DOWNTO 2496));
	BS28:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(2591 DOWNTO 2496), BS_R(2687 DOWNTO 2592));
	BS29:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(2687 DOWNTO 2592), BS_R(2783 DOWNTO 2688));
	BS30:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(2783 DOWNTO 2688), BS_R(2879 DOWNTO 2784));
	BS31:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(2879 DOWNTO 2784), BS_R(2975 DOWNTO 2880));
	BS32:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(2975 DOWNTO 2880), BS_R(3071 DOWNTO 2976));
	BS33:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(3071 DOWNTO 2976), BS_R(3167 DOWNTO 3072));
	BS34:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(3167 DOWNTO 3072), BS_R(3263 DOWNTO 3168));
	BS35:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(3263 DOWNTO 3168), BS_R(3359 DOWNTO 3264));
	BS36:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(3359 DOWNTO 3264), BS_R(3455 DOWNTO 3360));
	BS37:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(3455 DOWNTO 3360), BS_R(3551 DOWNTO 3456));
	BS38:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(3551 DOWNTO 3456), BS_R(3647 DOWNTO 3552));
	BS39:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(3647 DOWNTO 3552), BS_R(3743 DOWNTO 3648));
	BS40:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(3743 DOWNTO 3648), BS_R(3839 DOWNTO 3744));
	BS41:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(3839 DOWNTO 3744), BS_R(3935 DOWNTO 3840));
	BS42:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(3935 DOWNTO 3840), BS_R(4031 DOWNTO 3936));
	BS43:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(4031 DOWNTO 3936), BS_R(4127 DOWNTO 4032));
	BS44:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(4127 DOWNTO 4032), BS_R(4223 DOWNTO 4128));
	BS45:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(4223 DOWNTO 4128), BS_R(4319 DOWNTO 4224));
	BS46:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(4319 DOWNTO 4224), BS_R(4415 DOWNTO 4320));
	BS47:			BITSHIFT_RIGHT_96_BITS PORT MAP(BS_R(4415 DOWNTO 4320), BS_R(4511 DOWNTO 4416));
	
	F(31) <= S;
	F(30 DOWNTO 23) <= O_MUX_F;
	F(22 DOWNTO 0) <= SUM_M(22 DOWNTO 0);
	
	
END ARCHITECTURE;