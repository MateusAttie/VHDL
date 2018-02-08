ENTITY or_4 IS
	PORT (a,b,c,d: IN BIT; output: OUT BIT);
END or_4;

ARCHITECTURE data_flow OF or_4 IS
BEGIN
	output <= a OR b OR c OR d;
END data_flow;