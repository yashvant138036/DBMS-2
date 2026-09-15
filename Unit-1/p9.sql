DROP TABLE emp;

CREATE TABLE emp (
    emp_id     NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name  VARCHAR2(50),
    gender     VARCHAR2(10),
    department VARCHAR2(30),
    salary     NUMBER(10,2)
);

INSERT INTO emp VALUES (101, 'Biplab', 'Das Mohapatra', 'Male', 'HR', 55000);
INSERT INTO emp VALUES (102, 'Bhargav', 'Yadav', 'Male', 'HR', 62000);
INSERT INTO emp VALUES (103, 'Hitesh', 'Gadhavi', 'Male', 'HR', 48000);
INSERT INTO emp VALUES (104, 'Michael', 'Brown', 'Male', 'IT', 75000);
INSERT INTO emp VALUES (105, 'David', 'Miller', 'Male', 'hr', 51000);

COMMIT;

SET SERVEROUTPUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE('--- Male Employees in HR Department ---');
    
    FOR emp_rec IN (
        SELECT emp_id, first_name, last_name, salary 
        FROM emp 
        WHERE UPPER(gender) = 'MALE' 
          AND UPPER(department) = 'HR'
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(
            'ID: ' || emp_rec.emp_id || 
            ' | Name: ' || emp_rec.first_name || ' ' || emp_rec.last_name || 
            ' | Salary: $' || emp_rec.salary
        );
    END LOOP;
    
END;
/
