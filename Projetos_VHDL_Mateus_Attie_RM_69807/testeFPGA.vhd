ENTITY meio_somador IS
	PORT(x, y, habilita: IN BIT;vai_um, resultado: OUT BIT);
END meio_somador;


ARCHITECTURE structural OF meio_somador IS 

	COMPONENT not1 PORT(a: IN BIT; output: OUT BIT); END COMPONENT;
	COMPONENT or2 PORT(a, b: IN BIT; output: OUT BIT); END COMPONENT;
	COMPONENT and2 PORT(a, b: IN BIT; output: OUT BIT); END COMPONENT;
	COMPONENT and3 PORT(a, b, c: IN BIT; output: OUT BIT); END COMPONENT;
	
	FOR ALL: not1 USE ENTITY work.not_1 (data_flow);
	FOR ALL: or2 USE ENTITY work.or_2 (data_flow);
	FOR ALL: and2 USE ENTITY work.and_2 (data_flow);
	FOR ALL: and3 USE ENTITY work.and_3 (data_flow);
	
	SIGNAL v, w, z, nx, ny: BIT;
	
BEGIN

	c1: not1 PORT MAP (x, nx);
	c2: not1 PORT MAP (y, ny);
	
	c3: and2 PORT MAP (nx, y, v);
	c4: and2 PORT MAP (x, ny, w);
	
	c5: or2 PORT MAP (v, w, z);
	
	c6: and2 PORT MAP (habilita, z, resultado);
	c7: and3 PORT MAP (habilita, x, y, vai_um);
	
END structural;


--ARCHITECTURE behavior1 OF meio_somador IS
--
--BEGIN
--
--	PROCESS (habilita, x, y)
--	
--	BEGIN
--	
--		IF (habilta = '1') THEN
--			resultado <= x XOR y;
--			vai_um <= x and y;
--		ELSE 
--			resultado <= 0;
--			vai_um <= 0;
--		END IF;
--		
--	END PROCESS;
--	
--END behavior1;


--ARCHITECTURE data_flow OF meio_somador IS
--
--BEGIN
--
--	resultado <= (x XOR y) AND habilita;
--	vai_um <= x AND y AND habilita;
--	
--END data_flow; 