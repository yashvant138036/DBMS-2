DECLARE
   	v_salary EMP.basic_salary%TYPE;
   	v_name EMP.emp_name%TYPE;
BEGIN
   	SELECT emp_name, basic_salary INTO v_name, v_salary
   	FROM EMP
   	WHERE age = 50;

   	DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_name);
   	DBMS_OUTPUT.PUT_LINE('Salary: ' || v_salary);
EXCEPTION
   	WHEN NO_DATA_FOUND THEN
      		DBMS_OUTPUT.PUT_LINE('Error: No employee found with age 50.');
   	WHEN TOO_MANY_ROWS THEN
      		DBMS_OUTPUT.PUT_LINE('Error: Multiple employees exist with age 50.');
END;
/