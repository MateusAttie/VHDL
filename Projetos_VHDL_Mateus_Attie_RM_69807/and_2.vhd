ENTITY and_2 IS

	PORT(a, b: IN BIT; output: OUT BIT);
	
END and_2;


ARCHITECTURE data_flow OF and_2 IS

BEGIN

	output <= a AND b;
	
END data_flow;