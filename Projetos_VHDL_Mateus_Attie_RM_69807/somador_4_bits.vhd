ENTITY somador_4_bits IS
	PORT(
		cin :IN BIT;
		habilita :IN BIT;
		x   :IN BIT_VECTOR(3 DOWNTO 0);
		y   :IN BIT_VECTOR(3 DOWNTO 0);
		s   :OUT BIT_VECTOR(3 DOWNTO 0);
		cout :OUT BIT);
END somador_4_bits;


ARCHITECTURE structural OF somador_4_bits IS
	COMPONENT somador1bit PORT(x,y,habilita,cin : IN BIT; s,cout: OUT BIT);END COMPONENT;
	FOR ALL:somador1bit USE ENTITY work.ProjetoSomador1Bit(structural);
	
	SIGNAL c: BIT_VECTOR(2 DOWNTO 0);
BEGIN
	c1:somador1bit PORT MAP(x(0),y(0),habilita,cin,s(0),c(0));
	c2:somador1bit PORT MAP(x(1),y(1),habilita,c(0),s(1),c(1));
	c3:somador1bit PORT MAP(x(2),y(2),habilita,c(1),s(2),c(2));
	c4:somador1bit PORT MAP(x(3),y(3),habilita,c(2),s(3),cout);
END structural;