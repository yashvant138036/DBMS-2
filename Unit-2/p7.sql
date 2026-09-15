SET SERVEROUTPUT ON;

DECLARE
	CURSOR customer_cursor IS
		SELECT customer_id, first_name, last_name, email 
		FROM customer;

	customer_record customer_cursor%ROWTYPE;

BEGIN
	OPEN customer_cursor;

	LOOP
		FETCH customer_cursor INTO customer_record;

		EXIT WHEN customer_cursor%NOTFOUND;

		DBMS_OUTPUT.PUT_LINE(
		'ID: ' || customer_record.customer_id || 
		' | Name: ' || customer_record.first_name || ' ' || customer_record.last_name || 
		' | Email: ' || customer_record.email
		);
	END LOOP;

	CLOSE customer_cursor;
    
EXCEPTION
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
		IF customer_cursor%ISOPEN THEN
			CLOSE customer_cursor;
	END IF;
END;
/
