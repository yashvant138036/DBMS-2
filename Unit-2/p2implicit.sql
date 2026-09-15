DECLARE
    TYPE empno IS TABLE OF emp.empno%TYPE;
    TYPE sal   IS TABLE OF emp.sal%TYPE;
    
    empnos empno;
    sals   sal;
    raise  NUMBER;
BEGIN
    UPDATE emp
    SET sal = sal * 1.05
    WHERE deptno = 20
    RETURNING empno, (sal - (sal / 1.05)) BULK COLLECT INTO empnos, sals;

    IF SQL%ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('Implicit cursor is open.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Implicit cursor is closed (standard behavior).');
    END IF;

    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employee records found for Department 20. No updates made.');
    ELSE
        DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' employee record(s) found and updated.');

        FOR i IN 1..empnos.COUNT LOOP
            INSERT INTO emp_update (empno, raise_amount, update_date)
            VALUES (empnos(i), sals(i), SYSDATE);
        END LOOP;
        
        DBMS_OUTPUT.PUT_LINE('Audit records successfully written to emp_update.');
    END IF;

EXCEPTION
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
