ENTITY and_3 IS

	PORT(a, b, c: IN BIT; output: OUT BIT);
	
END and_3;


ARCHITECTURE data_flow OF and_3 IS

BEGIN

	output <= a AND b AND c;
	
END data_flow;