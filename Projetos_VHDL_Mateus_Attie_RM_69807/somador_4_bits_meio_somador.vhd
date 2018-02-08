ENTITY somador_4_bits_meio_somador IS
	PORT(x0,y0,x1,y1,x2,y2,x3,y3,habilita: IN BIT; s0,s1,s2,s3,cout: OUT BIT);
END somador_4_bits_meio_somador;


ARCHITECTURE structural OF somador_4_bits_meio_somador IS
	COMPONENT somador1bit PORT(x,y,habilita,cin : IN BIT; s,cout: OUT BIT);END COMPONENT;
	COMPONENT meiosomador PORT(x,y,habilita: IN BIT; vai_um, resultado: OUT BIT);END COMPONENT;
	
	FOR ALL:somador1bit USE ENTITY work.ProjetoSomador1Bit(structural);
	FOR ALL:meiosomador USE ENTITY work.meio_somador(structural);
	
	SIGNAL cout0,cout1,cout2,cin1,cin2,cin3: BIT;
BEGIN
	c1:meiosomador PORT MAP(x0,y0,habilita,cout0,s0);
	c2:somador1bit PORT MAP(x1,y1,habilita,cout0,s1,cout1);
	c3:somador1bit PORT MAP(x2,y2,habilita,cout1,s2,cout2);
	c4:somador1bit PORT MAP(x3,y3,habilita,cout2,s3,cout);
END structural;
	


