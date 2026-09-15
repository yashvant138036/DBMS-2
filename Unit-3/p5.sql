CREATE TABLE EMP_BACKUP AS SELECT * FROM EMP WHERE 1=2;

DECLARE
   	v_deptno EMP.dept_no%TYPE := &Enter_Dept_No;
   	v_count NUMBER := 0;
   	NO_DEPT_FOUND EXCEPTION;

   	CURSOR emp_cursor IS
      		SELECT * FROM EMP WHERE dept_no = v_deptno;
BEGIN
   	FOR rec IN emp_cursor LOOP
      		INSERT INTO EMP_BACKUP (emp_id, emp_name, basic_salary, age, dept_no, comm)
      		VALUES (rec.emp_id, rec.emp_name, rec.basic_salary, rec.age, rec.dept_no, rec.comm);
      		v_count := v_count + 1;
   	END LOOP;

   	IF v_count = 0 THEN
      		RAISE NO_DEPT_FOUND;
   	ELSE
      		COMMIT;
      		DBMS_OUTPUT.PUT_LINE(v_count || ' records successfully backed up.');
   	END IF;
EXCEPTION
   	WHEN NO_DEPT_FOUND THEN
      		DBMS_OUTPUT.PUT_LINE('Error: No records found for Department Number ' || v_deptno);
END;
/