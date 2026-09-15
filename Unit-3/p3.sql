CREATE TABLE EMP (
   	emp_id NUMBER,
   	emp_name VARCHAR2(50),
   	basic_salary NUMBER,
   	age NUMBER,
   	dept_no NUMBER,
   	comm NUMBER
);

INSERT INTO EMP VALUES (101, 'John', 50000, 50, 10, 500);
INSERT INTO EMP VALUES (102, 'Smith', 60000, 45, 20, NULL);
INSERT INTO EMP VALUES (103, 'Blake', 70000, 50, 10, 1000);
COMMIT;

DECLARE
   	v_name EMP.emp_name%TYPE := '&Enter_Employee_Name';
   	v_salary EMP.basic_salary%TYPE;
BEGIN
   	SELECT basic_salary INTO v_salary
   	FROM EMP
   	WHERE LOWER(emp_name) = LOWER(v_name);

   	DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_name);
   	DBMS_OUTPUT.PUT_LINE('Basic Salary: ' || v_salary);
EXCEPTION
   	WHEN NO_DATA_FOUND THEN
      		DBMS_OUTPUT.PUT_LINE('Error: Employee does not exist.');
   	WHEN TOO_MANY_ROWS THEN
      		DBMS_OUTPUT.PUT_LINE('Error: Multiple employees found with the same name.');
END;
/