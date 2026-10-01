CREATE OR REPLACE PROCEDURE increase_salary (
    	p_deptno IN NUMBER,
    	p_percent IN NUMBER
) AS
BEGIN
    	UPDATE emp
	SET basic_salary = basic_salary + (basic_salary * p_percent / 100)
    	WHERE deptno = p_deptno;
    
    	COMMIT;
    	DBMS_OUTPUT.PUT_LINE('Salaries updated successfully for Department: ' || p_deptno);
END increase_salary;
/