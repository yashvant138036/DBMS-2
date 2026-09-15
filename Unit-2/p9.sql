SET SERVEROUTPUT ON;

DECLARE
	CURSOR c_employees IS
		SELECT employee_id, first_name, salary 
		FROM employees 
		ORDER BY salary DESC; -- Sorts records from highest to lowest salary
      
BEGIN
	DBMS_OUTPUT.PUT_LINE(' Employee Records Sorted by Salary (Highest First) ');

	FOR r_emp IN c_employees LOOP
		DBMS_OUTPUT.PUT_LINE('ID: ' || r_emp.employee_id || ' | Name: ' || r_emp.first_name || ' | Salary: $' || r_emp.salary);
	END LOOP;
   
END;
/
