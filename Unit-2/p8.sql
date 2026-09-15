SET SERVEROUTPUT ON;

DECLARE
	CURSOR c_emp_cursor IS
		SELECT employee_id, first_name, job_id, salary
		FROM employees
		WHERE first_name LIKE 'A%';

BEGIN
	DBMS_OUTPUT.PUT_LINE(' Employees whose first name starts with ''A'' ');
	DBMS_OUTPUT.PUT_LINE('ID' || CHR(9) || 'NAME' || CHR(9) || 'JOB' || CHR(9) || 'SALARY');

	FOR emp_record IN c_emp_cursor LOOP

		DBMS_OUTPUT.PUT_LINE(
			emp_record.employee_id || CHR(9) || 
			emp_record.first_name  || CHR(9) || 
			emp_record.job_id      || CHR(9) || 
			emp_record.salary
		);
      
	END LOOP;
   
END;
/
