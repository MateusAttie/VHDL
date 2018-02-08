 ENTITY somador_8_bits IS
	PORT(
		habilita :IN BIT;
		x   :IN BIT_VECTOR(7 DOWNTO 0);
		y   :IN BIT_VECTOR(7 DOWNTO 0);
		s   :OUT BIT_VECTOR(7 DOWNTO 0);
		cout :OUT BIT);
END somador_8_bits;


ARCHITECTURE structural OF somador_8_bits IS
	COMPONENT somador_4_meio PORT(x0,y0,x1,y1,x2,y2,x3,y3,habilita : IN BIT; s0,s1,s2,s3,cout: OUT BIT);END COMPONENT;
	COMPONENT somador_4 PORT(
		cin :IN BIT;
		habilita :IN BIT;
		x   :IN BIT_VECTOR(3 DOWNTO 0);
		y   :IN BIT_VECTOR(3 DOWNTO 0);
		s   :OUT BIT_VECTOR(3 DOWNTO 0);
		cout :OUT BIT
	);
	END COMPONENT;
	
	FOR ALL:somador_4_meio USE ENTITY work.somador_4_bits_meio_somador(structural);
	FOR ALL:somador_4 USE ENTITY work.somador_4_bits(structural);
	
	SIGNAL c: BIT;
BEGIN
	c1:somador_4_meio PORT MAP(x(0),y(0),x(1),y(1),x(2),y(2),x(3),y(3),habilita,s(0),s(1),s(2),s(3),c);
	c2:somador_4 PORT MAP(c,habilita,x(7 DOWNTO 4),y(7 DOWNTO 4),s(7 DOWNTO 4),cout);
END structural;