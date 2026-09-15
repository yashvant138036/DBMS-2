DECLARE
	rno RESULT.Rollno%TYPE;
	s1 RESULT.Sub1%TYPE;
	s2 RESULT.Sub2%TYPE;
	s3 RESULT.Sub3%TYPE;
	s4 RESULT.Sub4%TYPE;
	s5 RESULT.Sub5%TYPE;
	tot NUMBER;
	per NUMBER(5, 2);
	grd CHAR(1);
BEGIN
	rno:=&Rollno;

	SELECT Sub1, Sub2, Sub3, Sub4, Sub5
	INTO s1, s2, s3, s4, s5
	FROM RESULT
	WHERE Rollno=rno;

	tot:=s1+s2+s3+s4+s5;
	per:=tot/5;

	IF per>=80 THEN
		grd:='A';
	ELSIF per>=60 THEN
		grd:='B';
	ELSIF per>=50 THEN
		grd:='C';
	ELSIF per>=35 THEN
		grd:='D';
	ELSE
		grd:='F';
	END IF;

    UPDATE RESULT
    SET Total = tot,
        Per = per,
        Grade = grd
    WHERE Rollno = rno;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Roll No    : ' || rno);
    DBMS_OUTPUT.PUT_LINE('Total Marks: ' || tot);
    DBMS_OUTPUT.PUT_LINE('Percentage : ' || per || '%');
    DBMS_OUTPUT.PUT_LINE('Grade      : ' || grd);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Roll Number not found.');
END;
/