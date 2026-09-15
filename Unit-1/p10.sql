SET SERVEROUTPUT ON;

DECLARE
	eid employees.employee_id%TYPE := &input_employee_id; 
BEGIN
	DELETE FROM employees 
	WHERE employee_id = eid;

	IF SQL%ROWCOUNT = 0 THEN
		DBMS_OUTPUT.PUT_LINE('No employee found with EID: ' || eid);
    ELSE
	DBMS_OUTPUT.PUT_LINE('Successfully deleted ' || SQL%ROWCOUNT || ' employee record(s).');
	COMMIT; 
	END IF;
END;
/