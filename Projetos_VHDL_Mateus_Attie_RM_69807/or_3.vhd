ENTITY or_3 IS
	PORT (a,b,c: IN BIT; output: OUT BIT);
END or_3;

ARCHITECTURE data_flow OF or_3 IS
BEGIN
	output <= a OR b OR c;
END data_flow;