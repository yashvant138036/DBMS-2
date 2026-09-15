DECLARE
	v_dept_id    employee.department_id%TYPE := 20;
	v_pct_raise  NUMBER := 0.10;
BEGIN
	UPDATE employee
	SET salary = salary + (salary * v_pct_raise)
	WHERE department_id = v_dept_id;

	IF SQL%FOUND THEN
		DBMS_OUTPUT.PUT_LINE('Update successful!');
		DBMS_OUTPUT.PUT_LINE('Total employees updated: ' || SQL%ROWCOUNT);
	ELSE
		DBMS_OUTPUT.PUT_LINE('No employee records matched Department ID ' || v_dept_id);
	END IF;

EXCEPTION
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
		ROLLBACK;
END;
/
