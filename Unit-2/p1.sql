SET SERVEROUTPUT ON;

BEGIN
    UPDATE emp 
    SET sal = sal * 1.10 
    WHERE deptno = 10;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No records found for Department 10. No salaries were updated.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Salary updated successfully! Total number of employee records updated: ' || SQL%ROWCOUNT);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;
/