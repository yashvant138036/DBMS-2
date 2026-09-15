DECLARE
    celsius    NUMBER := &enter_celsius_temperature;
    fahrenheit NUMBER;

BEGIN
    fahrenheit := (celsius * 9 / 5) + 32;

    DBMS_OUTPUT.PUT_LINE('The temperature ' || celsius || '°C is equal to ' || fahrenheit || '°F');

END;
/