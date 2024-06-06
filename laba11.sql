DECLARE
  v_faculty_code FACULTY.FACULTY%TYPE;
  v_faculty_name FACULTY.FACULTY_NAME%TYPE;
BEGIN
  SELECT FACULTY, FACULTY_NAME
  INTO v_faculty_code, v_faculty_name
  FROM FACULTY
  WHERE FACULTY = 'ФЛБК';
  DBMS_OUTPUT.PUT_LINE('Факультет ' || v_faculty_code);
  DBMS_OUTPUT.PUT_LINE('Полное название ' || v_faculty_name);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Faculty not found.');
END;

DECLARE
  v_faculty_code FACULTY.FACULTY%TYPE;
  v_faculty_name FACULTY.FACULTY_NAME%TYPE;
  v_counter NUMBER := 0; 
BEGIN
  FOR c IN (
    SELECT FACULTY, FACULTY_NAME
    FROM FACULTY
    WHERE FACULTY like '%1232%'
  ) LOOP
    v_counter := v_counter + 1;
    v_faculty_code := c.FACULTY;
    v_faculty_name := c.FACULTY_NAME;
    DBMS_OUTPUT.PUT_LINE('Факультет ' || v_faculty_code);
    DBMS_OUTPUT.PUT_LINE('Полное название ' || v_faculty_name);
  END LOOP;
  IF v_counter = 0 THEN
    DBMS_OUTPUT.PUT_LINE('Факультет не найден');
  END IF;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
    DBMS_OUTPUT.PUT_LINE('Error code: ' || SQLCODE);
END;

DECLARE
  v_faculty_code FACULTY.FACULTY%TYPE;
  v_faculty_name FACULTY.FACULTY_NAME%TYPE;
BEGIN
  SELECT FACULTY, FACULTY_NAME
  INTO v_faculty_code, v_faculty_name
  FROM FACULTY
  WHERE FACULTY like '%374981742%';
  DBMS_OUTPUT.PUT_LINE('Факультет ' || v_faculty_code);
  DBMS_OUTPUT.PUT_LINE('Полное название ' || v_faculty_name);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Факультет не найден');
  WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('Факультетов слишком много');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
    DBMS_OUTPUT.PUT_LINE('Error code: ' || SQLCODE);
END;

DECLARE
  v_error_code NUMBER;
  v_error_msg VARCHAR2(4000);
BEGIN
  INSERT INTO FACULTY (FACULTY, FACULTY_NAME) VALUES ('ЛБФК', 'щцзлоауцошащшоц');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    v_error_code := SQLCODE;
    v_error_msg := 'Факультет дублируется';
    DBMS_OUTPUT.PUT_LINE('Error ' || v_error_code || ': ' || v_error_msg);
 WHEN OTHERS THEN
    v_error_code := SQLCODE;
    v_error_msg := SQLERRM;
    DBMS_OUTPUT.PUT_LINE('Error ' || v_error_code || ': ' || v_error_msg);
END;

SELECT * FROM FACULTY;

DECLARE
  v_error_code NUMBER;
  v_error_msg VARCHAR2(4000);
BEGIN
  UPDATE FACULTY SET FACULTY = 'ЛБФК' WHERE FACULTY = 'ФДИ';
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    v_error_code := SQLCODE;
    v_error_msg := 'Факультет дублируется';
    DBMS_OUTPUT.PUT_LINE('Error ' || v_error_code || ': ' || v_error_msg);
   WHEN OTHERS THEN
    v_error_code := SQLCODE;
    v_error_msg := SQLERRM;
    DBMS_OUTPUT.PUT_LINE('Error ' || v_error_code || ': ' || v_error_msg);
END;

DECLARE
  v_error_code NUMBER;
  v_error_msg VARCHAR2(4000);
BEGIN
  DELETE FROM FACULTY WHERE FACULTY = 'ЛХФ';
EXCEPTION
  WHEN OTHERS THEN
    v_error_code := SQLCODE;
    v_error_msg := SQLERRM;
    DBMS_OUTPUT.PUT_LINE('Error ' || v_error_code || ': ' || v_error_msg);
END;

DECLARE
  v_teacher      TEACHER.TEACHER%TYPE;
  v_teacher_name TEACHER.TEACHER_NAME%TYPE;
  v_pulpit       TEACHER.PULPIT%TYPE;
  CURSOR c_teacher IS
    SELECT TEACHER, TEACHER_NAME, PULPIT
    FROM TEACHER;
BEGIN
  OPEN c_teacher;
  LOOP
    FETCH c_teacher INTO v_teacher, v_teacher_name, v_pulpit;
    EXIT WHEN c_teacher%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Teacher: ' || v_teacher || ', Name: ' || v_teacher_name || ', Pulpit: ' || v_pulpit);
  END LOOP;
  CLOSE c_teacher;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;

DECLARE
  CURSOR c_subject IS
    SELECT SUBJECT, SUBJECT_NAME, PULPIT
    FROM SUBJECT;
  v_subject_record c_subject%ROWTYPE;
BEGIN
  OPEN c_subject;
  LOOP
    FETCH c_subject INTO v_subject_record;
    EXIT WHEN c_subject%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Subject: ' || v_subject_record.SUBJECT || ', Name: ' || v_subject_record.SUBJECT_NAME || ', Pulpit: ' || v_subject_record.PULPIT);
  END LOOP;
  CLOSE c_subject;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;

DECLARE
  CURSOR c_auditorium(p_min_capacity NUMBER, p_max_capacity NUMBER) IS
    SELECT AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_CAPACITY
    FROM AUDITORIUM
    WHERE AUDITORIUM_CAPACITY BETWEEN p_min_capacity AND p_max_capacity;
  v_auditorium_record c_auditorium%ROWTYPE;
BEGIN
   --Цикл FOR
  DBMS_OUTPUT.PUT_LINE('Меньше 20:');
  FOR r IN c_auditorium(0, 20) LOOP
    DBMS_OUTPUT.PUT_LINE('Auditorium: ' || r.AUDITORIUM || ', Name: ' || r.AUDITORIUM_NAME || ', Capacity: ' || r.AUDITORIUM_CAPACITY);
  END LOOP;
  --Цикл FOR + FETCH
  DBMS_OUTPUT.PUT_LINE('21 - 30:');
  OPEN c_auditorium(21, 30);
  LOOP
    FETCH c_auditorium INTO v_auditorium_record;
    EXIT WHEN c_auditorium%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Auditorium: ' || v_auditorium_record.AUDITORIUM || ', Name: ' || v_auditorium_record.AUDITORIUM_NAME || ', Capacity: ' || v_auditorium_record.AUDITORIUM_CAPACITY);
  END LOOP;
  CLOSE c_auditorium;
  -- C WHILE
  DBMS_OUTPUT.PUT_LINE('31 - 60:');
  OPEN c_auditorium(31, 60);
  FETCH c_auditorium INTO v_auditorium_record;
  WHILE c_auditorium%FOUND LOOP
    DBMS_OUTPUT.PUT_LINE('Auditorium: ' || v_auditorium_record.AUDITORIUM || ', Name: ' || v_auditorium_record.AUDITORIUM_NAME || ', Capacity: ' || v_auditorium_record.AUDITORIUM_CAPACITY);
    FETCH c_auditorium INTO v_auditorium_record;
  END LOOP;
  CLOSE c_auditorium;
  DBMS_OUTPUT.PUT_LINE('61 - 80:');
  OPEN c_auditorium(61, 80);
  LOOP
    FETCH c_auditorium INTO v_auditorium_record;
    EXIT WHEN c_auditorium%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Auditorium: ' || v_auditorium_record.AUDITORIUM || ', Name: ' || v_auditorium_record.AUDITORIUM_NAME || ', Capacity: ' || v_auditorium_record.AUDITORIUM_CAPACITY);
  END LOOP;
  CLOSE c_auditorium;
  DBMS_OUTPUT.PUT_LINE('Больше 81:');
  FOR r IN c_auditorium(81, 9999) LOOP
    DBMS_OUTPUT.PUT_LINE('Auditorium: ' || r.AUDITORIUM || ', Name: ' || r.AUDITORIUM_NAME || ', Capacity: ' || r.AUDITORIUM_CAPACITY);
  END LOOP;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;

DECLARE
  v_cursor SYS_REFCURSOR;
  v_faculty      FACULTY.FACULTY%TYPE;
  v_faculty_name FACULTY.FACULTY_NAME%TYPE;
BEGIN
    OPEN v_cursor FOR
    SELECT FACULTY, FACULTY_NAME
    FROM FACULTY
    WHERE FACULTY = 'ФДИ';
  LOOP
    FETCH v_cursor INTO v_faculty, v_faculty_name;
    EXIT WHEN v_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Faculty: ' || v_faculty || ', Name: ' || v_faculty_name);
  END LOOP;
  CLOSE v_cursor;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;

DECLARE
  CURSOR auditorium_cursor IS
    SELECT AUDITORIUM, AUDITORIUM_CAPACITY
    FROM AUDITORIUM
    WHERE AUDITORIUM_CAPACITY BETWEEN 40 AND 80
    FOR UPDATE; 
  v_new_capacity NUMBER(4);
  v_number AUDITORIUM.AUDITORIUM%TYPE;
BEGIN
  FOR auditorium_rec IN auditorium_cursor LOOP
    v_number := auditorium_rec.AUDITORIUM;
    v_new_capacity := ROUND(auditorium_rec.AUDITORIUM_CAPACITY * 0.9);
    UPDATE AUDITORIUM
    SET AUDITORIUM_CAPACITY = v_new_capacity
    WHERE CURRENT OF auditorium_cursor;
    DBMS_OUTPUT.PUT_LINE('Auditorium: ' || v_number || ', new capacity: ' || v_new_capacity);
  END LOOP;
  COMMIT;
END;