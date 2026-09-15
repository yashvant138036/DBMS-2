DECLARE
   	v_number NUMBER;
   	v_text VARCHAR2(10) := 'ABC';
BEGIN
   	SELECT TO_NUMBER(v_text) INTO v_number FROM DUAL;
   	DBMS_OUTPUT.PUT_LINE('Converted Number: ' || v_number);
EXCEPTION
   	WHEN INVALID_NUMBER OR VALUE_ERROR THEN
      		DBMS_OUTPUT.PUT_LINE('Error: Conversion failed. Invalid numerical input.');
END;
/