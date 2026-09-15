SET SERVEROUTPUT ON;

DECLARE
    CURSOR top_earners IS
        SELECT emp_name, department, basic_salary
        FROM employees
        ORDER BY basic_salary DESC;
    emp_rec top_earners%ROWTYPE;

BEGIN
    OPEN top_earners;
    
    LOOP
        FETCH top_earners INTO emp_rec;
        EXIT WHEN top_earners%NOTFOUND OR top_earners%ROWCOUNT > 5;

        DBMS_OUTPUT.PUT_LINE('Rank: ' || top_earners%ROWCOUNT || 
                             ' | Name: ' || emp_rec.emp_name || 
                             ' | Dept: ' || emp_rec.department || 
                             ' | Salary: ' || emp_rec.basic_salary);
    END LOOP;
    CLOSE top_earners;
END;
/
