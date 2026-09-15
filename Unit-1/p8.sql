SET SERVEROUTPUT ON;

DECLARE
    eid      EMP.EID%TYPE := &Enter_Employee_ID;
    ename    EMP.EName%TYPE;
    basic    EMP.BasicSal%TYPE;

    da       NUMBER(10, 2);
    hra      NUMBER(10, 2);
    medical  NUMBER(10, 2);
    pf       NUMBER(10, 2);
    gross    NUMBER(10, 2);
BEGIN
    SELECT EName, BasicSal
    INTO ename, basic
    FROM EMP
    WHERE EID = eid 
      AND ROWNUM = 1;

    da      := basic * 0.50;
    hra     := basic * 0.15;
    medical := 500.00;
    pf      := basic * 0.10;

    gross := basic + (da + hra + medical) - pf;

    DBMS_OUTPUT.PUT_LINE('Employee ID     : ' || eid);
    DBMS_OUTPUT.PUT_LINE('Employee Name   : ' || ename);
    DBMS_OUTPUT.PUT_LINE('Basic Salary    : ' || TO_CHAR(basic, '999,999.00'));
    DBMS_OUTPUT.PUT_LINE('(+) DA (50%)    : ' || TO_CHAR(da, '999,999.00'));
    DBMS_OUTPUT.PUT_LINE('(+) HRA (15%)   : ' || TO_CHAR(hra, '999,999.00'));
    DBMS_OUTPUT.PUT_LINE('(+) Medical     : ' || TO_CHAR(medical, '999,999.00'));
    DBMS_OUTPUT.PUT_LINE('(-) PF (10%)    : ' || TO_CHAR(pf, '999,999.00'));
    DBMS_OUTPUT.PUT_LINE('GROSS SALARY    : ' || TO_CHAR(gross, '999,999.00'));

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Employee with ID ' || eid || ' does not exist.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;
/