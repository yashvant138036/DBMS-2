DECLARE
   	v_name EMP.emp_name%TYPE;
BEGIN
   	SELECT emp_name INTO v_name
   	FROM EMP
   	WHERE emp_id = 999;

   	DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_name);
EXCEPTION
   	WHEN NO_DATA_FOUND THEN
      		DBMS_OUTPUT.PUT_LINE('Error: No record found for the given criteria.');
END;
/