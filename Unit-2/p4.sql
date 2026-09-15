SET SERVEROUTPUT ON;

DECLARE
	CURSOR cur_top_sal IS 
		SELECT ename, basic_sal 
		FROM emp 
		ORDER BY basic_sal DESC;

	counter NUMBER := 0;
BEGIN
	DBMS_OUTPUT.PUT_LINE('---Top 3 Highest Paid Employees---');

	FOR emp_rec IN cur_top_sal LOOP
		counter := counter + 1;

		DBMS_OUTPUT.PUT_LINE('Rank ' || counter || ': ' || emp_rec.ename || ' - Salary: ' || emp_rec.basic_sal);

		EXIT WHEN counter = 3;
	END LOOP;
END;
/
