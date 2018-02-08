ENTITY seven_segment_decoder IS
	
	PORT(
		input: IN BIT_VECTOR(3 DOWNTO 0); 
		output: OUT BIT_VECTOR(6 DOWNTO 0)
	);
	
END seven_segment_decoder;

ARCHITECTURE structural OF seven_segment_decoder IS 

	COMPONENT and2 PORT(in_a, in_b: IN BIT; output: OUT BIT); END COMPONENT;
	COMPONENT and3 PORT(in_a, in_b, in_c: IN BIT; output: OUT BIT); END COMPONENT;
	COMPONENT not1 PORT(input: IN BIT; output: OUT BIT); END COMPONENT;
	COMPONENT or2 PORT(in_a, in_b: IN BIT; output: OUT BIT); END COMPONENT;
	COMPONENT or3 PORT(in_a, in_b, in_c: IN BIT; output: OUT BIT); END COMPONENT;
	COMPONENT or4 PORT(in_a, in_b, in_c, in_d: IN BIT; output: OUT BIT); END COMPONENT;
	COMPONENT or5 PORT(in_a, in_b, in_c, in_d, in_e: IN BIT; output: OUT BIT); END COMPONENT;
	
	FOR ALL: and2 USE ENTITY work.and_2 (data_flow);
	FOR ALL: and3 USE ENTITY work.and_3 (data_flow);
	FOR ALL: not1 USE ENTITY work.not_1 (data_flow);
	FOR ALL: or2 USE ENTITY work.or_2 (data_flow);
	FOR ALL: or3 USE ENTITY work.or_3 (data_flow);
	FOR ALL: or4 USE ENTITY work.or_4 (data_flow);
	FOR ALL: or5 USE ENTITY work.or_5 (data_flow);
	
	SIGNAL nin: BIT_VECTOR(3 DOWNTO 0);
	SIGNAL  x_z,
		nx_nz,
		ny_nz,
		y_z,
		y_nz,
		x_ny_z,
		nx_y,
		x_ny,
		x_nz: BIT;
BEGIN

	-- not expressions
	not_exp_3: not1 PORT MAP(input(3), nin(3));
	not_exp_2: not1 PORT MAP(input(2), nin(2));
	not_exp_1: not1 PORT MAP(input(1), nin(1));
	not_exp_0: not1 PORT MAP(input(0), nin(0));

	-- and expressions
	and_exp_1: and2 PORT MAP(input(2), input(0), x_z);
	and_exp_2: and2 PORT MAP(nin(2), nin(0), nx_nz);
	and_exp_3: and2 PORT MAP(nin(1), nin(0), ny_nz);
	and_exp_4: and2 PORT MAP(input(1), input(0), y_z);
	and_exp_5: and2 PORT MAP(input(1), nin(0), y_nz);
	and_exp_6: and3 PORT MAP(input(2), nin(1), input(0), x_ny_z);
	and_exp_7: and2 PORT MAP(nin(2), input(1), nx_y);
	and_exp_8: and2 PORT MAP(input(2), nin(1), x_ny);
	and_exp_9: and2 PORT MAP(input(2), nin(0), x_nz);	
	
	-- outputs(or expressions)
	a: or4 PORT MAP(input(3), input(1), x_z, nx_nz, output(6));
	b: or3 PORT MAP(nin(2), ny_nz, y_z, output(5));
	c: or3 PORT MAP(input(2), nin(1), input(0), output(4));
	d: or5 PORT MAP(nx_nz, y_nz, x_ny_z, nx_y, input(3), output(3));
	e: or2 PORT MAP(nx_nz, y_nz, output(2));
	f: or4 PORT MAP(input(3), ny_nz, x_ny, x_nz, output(1));
	g: or4 PORT MAP(input(3), x_ny, nx_y, y_nz, output(0));

END structural;
