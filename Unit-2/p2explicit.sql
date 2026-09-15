DECLARE
	CURSOR emp_cursor IS
		SELECT empno, sal 
		FROM emp 
		WHERE deptno = 20 
		FOR UPDATE;
        
	empno emp.empno%TYPE;
	sal   emp.sal%TYPE;
	v_raise emp.sal%TYPE;
	found BOOLEAN := FALSE;
BEGIN
	IF NOT emp_cursor%ISOPEN THEN
		DBMS_OUTPUT.PUT_LINE('Opening the cursor now...');
		OPEN emp_cursor;
		END IF;

	LOOP
		FETCH emp_cursor INTO empno, sal;

		EXIT WHEN emp_cursor%NOTFOUND;

		found := TRUE;
		v_raise := sal * 0.05;

		UPDATE emp 
		SET sal = sal + v_raise 
		WHERE CURRENT OF emp_cursor;

		INSERT INTO emp_update (empno, raise_amount, update_date)
		VALUES (empno, v_raise, SYSDATE);
        
		DBMS_OUTPUT.PUT_LINE('Employee ID ' || empno || ' received a 5% raise of ' || v_raise);
	END LOOP;

	IF NOT found THEN
		DBMS_OUTPUT.PUT_LINE('No employee records found for Department 20.');
	ELSE
		DBMS_OUTPUT.PUT_LINE('Salary updates completed successfully.');
	END IF;

END;
/
