LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY double_digit_regular_counter IS

	PORT(
		enable_in, true_reset, clock: IN STD_LOGIC;
		first_limit, second_limit: IN STD_LOGIC_VECTOR(3 DOWNTO 0); 
		first_output, second_output: INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		carry: OUT STD_LOGIC
	);
	
END double_digit_regular_counter;

ARCHITECTURE structural OF double_digit_regular_counter IS

	COMPONENT counter
		PORT(
			enable_in, true_reset, clock: IN STD_LOGIC;
			limit: IN STD_LOGIC_VECTOR(3 DOWNTO 0); 
			output: INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			carry: OUT STD_LOGIC
		);
	END COMPONENT;
	
	FOR ALL: counter USE ENTITY work.single_digit_decimal_counter;
	
	SIGNAL m_c: STD_LOGIC;

BEGIN

	c1: counter PORT MAP(
		enable_in, true_reset, clock, first_limit, first_output, m_c
	);
	c2: counter PORT MAP(
		m_c, true_reset, clock, second_limit, second_output, carry
	);
	
END structural;