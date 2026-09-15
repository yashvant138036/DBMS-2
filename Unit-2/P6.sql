DECLARE
	v_dept_no      employees.department_id%TYPE := &Enter_Dept_No;

	v_rows_found   BOOLEAN := FALSE;

	CURSOR c_emp IS
		SELECT employee_id, first_name, last_name, email, hire_date, job_id, salary, department_id
		FROM employees
		WHERE department_id = v_dept_no;
	
	no_dept_found  EXCEPTION;

BEGIN
	FOR r_emp IN c_emp LOOP
	v_rows_found := TRUE;
	
	INSERT INTO emp_backup (
		employee_id, first_name, last_name, email, hire_date, job_id, salary, department_id
	) VALUES (
		r_emp.employee_id, r_emp.first_name, r_emp.last_name, r_emp.email, 
		r_emp.hire_date, r_emp.job_id, r_emp.salary, r_emp.department_id
	);
	END LOOP;

	IF NOT v_rows_found THEN
		RAISE no_dept_found;
	ELSE
		COMMIT;
		DBMS_OUTPUT.PUT_LINE('Employee records backed up successfully.');
	END IF;

EXCEPTION
	WHEN no_dept_found THEN
	ROLLBACK;
	RAISE_APPLICATION_ERROR(-20001, 'No records found for the entered Department Number: ' || v_dept_no);
      
	WHEN OTHERS THEN
		ROLLBACK;
	DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;
/
