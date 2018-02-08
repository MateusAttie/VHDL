ENTITY ProjetoSomador1Bit IS
PORT (x,y,habilita,cin: IN BIT;
		s,cout: OUT BIT);
END ProjetoSomador1Bit;

--ARCHITECTURE behavior1 OF ProjetoSomador1Bit IS
--BEGIN
--	PROCESS(x,y,habilita,cin)
--	BEGIN
--		IF(habilita = '1')THEN
--			s <= x XOR y XOR cin;
--			cout <= (y AND cin) OR (x AND cin) OR (x AND y);
--		ELSE
--			s <= '0';
--			cout <= '0';
--		END IF;
--	END PROCESS;
--END behavior1;
--
--ARCHITECTURE data_flow OF ProjetoSomador1Bit IS
--BEGIN	
--	cout <= ((y AND cin) OR (x AND cin) OR (x AND y)) AND habilita;
--	s <= (x XOR y XOR cin) AND habilita;
--END data_flow;

ARCHITECTURE structural OF ProjetoSomador1Bit IS
	COMPONENT and3 PORT(a,b,c: IN BIT; output: OUT BIT);END COMPONENT;
	COMPONENT and2 PORT(a,b: IN BIT; output: OUT BIT);END COMPONENT;
	COMPONENT or4  PORT(a,b,c,d: IN BIT; output: OUT BIT);END COMPONENT;
	COMPONENT or3  PORT(a,b,c: IN BIT; output: OUT BIT);END COMPONENT;
	COMPONENT not1  PORT(a: IN BIT; output: OUT BIT);END COMPONENT;
	
	FOR ALL:and3 USE ENTITY work.and_3(data_flow);
	FOR ALL:and2 USE ENTITY work.and_2(data_flow);
	FOR ALL:or4 USE ENTITY work.or_4(data_flow);
	FOR ALL:or3 USE ENTITY work.or_3(data_flow);
	FOR ALL:not1 USE ENTITY work.not_1(data_flow);
	
	SIGNAL t,u,v,w,z,l,k,m,n,nx,ny,ncin: BIT;
	
BEGIN
	c1: not1 PORT MAP(x,nx);
	c2: not1 PORT MAP(y,ny);
	c3: not1 PORT MAP(cin,ncin);
	c4: and3 PORT MAP(nx,y,ncin,t);
	c5: and3 PORT MAP(x,ny,ncin,u);
	c6: and3 PORT MAP(nx,ny,cin,v);
	c7: and3 PORT MAP(x,y,cin,w);
	c8: or4  PORT MAP(t,u,v,w,z);
	c9: and2 PORT MAP(z,habilita,s);
	c10: and2 PORT MAP(y,cin,k);
	c11: and2 PORT MAP(x,cin,l);
	c12: and2 PORT MAP(x,y,m);
	c13: or3  PORT MAP(k,l,m,n);
	c14: and2 PORT MAP(n,habilita,cout);	
END structural; 

