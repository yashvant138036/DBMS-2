DECLARE
   	v_empno EMP.emp_id%TYPE := &Enter_Emp_No;
   	v_comm EMP.comm%TYPE;
   	NULL_COMMISSION EXCEPTION;
BEGIN
   	SELECT comm INTO v_comm
   	FROM EMP
   	WHERE emp_id = v_empno;

   	IF SQL%FOUND THEN
      		IF v_comm IS NULL THEN
         		RAISE NULL_COMMISSION;
      		ELSE
         		DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_empno);
         		DBMS_OUTPUT.PUT_LINE('Commission: ' || v_comm);
      		END IF;
   	END IF;
EXCEPTION
   	WHEN NO_DATA_FOUND THEN
      		DBMS_OUTPUT.PUT_LINE('Error: Employee ID ' || v_empno || ' does not exist.');
   	WHEN NULL_COMMISSION THEN
      		DBMS_OUTPUT.PUT_LINE('Error: Commission is NULL for Employee ID ' || v_empno);
END;
/