DECLARE
    -- Input variable (Substitution variable accepts user input)
    feet NUMBER := &input_feet_value;
    
    -- Variables to store conversion outputs
    inches NUMBER;
    cm NUMBER;
    meters NUMBER;
BEGIN
    -- Perform conversion mathematics
    inches := feet * 12;
    cm     := feet * 30.48;
    meters := feet * 0.3048;

    -- Display the results rounded to two decimal places
    DBMS_OUTPUT.PUT_LINE('--- Unit Conversion Results ---');
    DBMS_OUTPUT.PUT_LINE('Input in Feet: ' || feet || ' ft');
    DBMS_OUTPUT.PUT_LINE('Inches       : ' || ROUND(inches, 2) || ' in');
    DBMS_OUTPUT.PUT_LINE('Centimeters  : ' || ROUND(cm, 2) || ' cm');
    DBMS_OUTPUT.PUT_LINE('Meters       : ' || ROUND(meters, 2) || ' m');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred. Please ensure you enter a valid number.');
END;
/