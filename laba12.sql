ALTER TABLE TEACHER ADD SALARY NUMBER(7,2);
ALTER TABLE TEACHER ADD BIRTHDAY DATE;

select * from TEACHER;

declare
    v_salary NUMBER(7,2);
    v_birthday  DATE;
    fromDate DATE;
    toDate DATE;
    CURSOR c_teacher IS
        SELECT birthday, salary
        FROM teacher
        FOR UPDATE;
BEGIN
    fromDate := TO_DATE('01.01.1954','DD.MM.YYYY');
    toDate := TO_DATE('01.01.2004','DD.MM.YYYY');
    FOR rec IN c_teacher LOOP
    v_birthday := fromDate + DBMS_RANDOM.VALUE(0, toDate - fromDate);
    v_salary := DBMS_RANDOM.VALUE(1000, 5000);
    UPDATE teacher
        SET birthday = v_birthday , salary = v_salary
        WHERE CURRENT OF c_teacher;
    END LOOP;
END;

DECLARE
    CURSOR c_teacher IS
        SELECT teacher, teacher_name, pulpit, salary, birthday
        FROM teacher
        WHERE TO_CHAR(birthday, 'D') = '2'; 
    v_full_name VARCHAR2(100);
BEGIN
    FOR rec IN c_teacher
    LOOP
        select regexp_substr(rec.teacher_name,'(\S+)',1, 1)||' '||substr(regexp_substr(rec.teacher_name,'(\S+)',1, 2),1, 1)||'. '||substr(regexp_substr(rec.teacher_name,'(\S+)',1, 3),1, 1)||'. ' into v_full_name from dual; 
        DBMS_OUTPUT.PUT_LINE(rec.teacher || ' - ' || v_full_name);
    END LOOP;
END;


select regexp_substr(teacher_name,'(\S+)',1, 1)||' '||substr(regexp_substr(teacher_name,'(\S+)',1, 2),1, 1)||'. '||substr(regexp_substr(teacher_name,'(\S+)',1, 3),1, 1)||'. '

CREATE OR REPLACE VIEW teachers_born_next_month AS
SELECT teacher, teacher_name, TO_CHAR(birthday, 'DD/MM/YYYY') AS formatted_birthday
FROM
    teacher
WHERE
    EXTRACT(MONTH FROM birthday) = EXTRACT(MONTH FROM SYSDATE) + 1;
    
SELECT * FROM teachers_born_next_month;

CREATE OR REPLACE VIEW teachers_birth_month AS
SELECT TO_CHAR(birthday, 'Month') AS birth_month, COUNT(*) AS teacher_count
FROM teacher
GROUP BY TO_CHAR(birthday, 'Month');

SELECT * FROM teachers_birth_month;

DECLARE
    CURSOR c_teach IS SELECT teacher_name, birthday FROM teacher;
    v_age NUMBER;
BEGIN
    FOR r_teach IN c_teach
    LOOP
        IF MOD(to_number(extract(year from r_teach.birthday)) - to_number(extract(year from (add_months(sysdate, 12)))), 5) = 0 
            THEN 
            v_age := to_number(extract(year from (add_months(sysdate, 12))) - to_number(extract(year from r_teach.birthday)));
            dbms_output.put_line(r_teach.teacher_name|| ' '|| v_age);
        END IF;
    END LOOP;
END;

SELECT * FROM TEACHER;

DECLARE
    v_avg_salary_pulpit NUMBER;
    v_avg_salary_faculty NUMBER;
    v_avg_salary_total NUMBER;
    CURSOR cur_pulpit_avg IS
        SELECT P.PULPIT_NAME, 
               FLOOR(AVG(T.SALARY)) AS AVG_SALARY
        FROM PULPIT P
        JOIN TEACHER T ON P.PULPIT = T.PULPIT
        GROUP BY P.PULPIT_NAME;
    CURSOR cur_faculty_avg IS
        SELECT F.FACULTY_NAME, 
               FLOOR(AVG(T.SALARY)) AS AVG_SALARY
        FROM FACULTY F
        JOIN PULPIT P ON F.FACULTY = P.FACULTY
        JOIN TEACHER T ON P.PULPIT = T.PULPIT
        GROUP BY F.FACULTY_NAME;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Средняя зарплата по кафедрам:');
    FOR rec IN cur_pulpit_avg LOOP
        DBMS_OUTPUT.PUT_LINE(rec.PULPIT_NAME || ': ' || rec.AVG_SALARY);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Средняя зарплата по факультетам:');
    FOR rec IN cur_faculty_avg LOOP
        DBMS_OUTPUT.PUT_LINE(rec.FACULTY_NAME || ': ' || rec.AVG_SALARY);
    END LOOP;
    SELECT FLOOR(AVG(SALARY)) INTO v_avg_salary_total
    FROM TEACHER;
    DBMS_OUTPUT.PUT_LINE('Средняя зарплата по всем факультетам: ' || v_avg_salary_total);
END;

DECLARE
    x NUMBER := 10; 
    y NUMBER := 0; 
    result NUMBER;
    e_divide_by_zero EXCEPTION;
BEGIN
    IF y = 0 THEN
        RAISE e_divide_by_zero;
    END IF;
    result := x / y;
    DBMS_OUTPUT.PUT_LINE('Результат деления: ' || result);

EXCEPTION
    WHEN e_divide_by_zero THEN
        DBMS_OUTPUT.PUT_LINE('Ошибка: деление на 0 невозможно.');
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Ошибка: делитель не может быть равен 0.');
END;

DECLARE
    v_teacher_code CHAR(20) := 'ЛБКО'; 
    v_teacher_name VARCHAR2(70);
BEGIN
    BEGIN
        SELECT TEACHER_NAME
        INTO v_teacher_name
        FROM TEACHER
        WHERE TEACHER = v_teacher_code;
        DBMS_OUTPUT.PUT_LINE('Имя преподавателя: ' || v_teacher_name);
    EXCEPTION
        WHEN NO_DATA_FOUND  THEN
            DBMS_OUTPUT.PUT_LINE('Преподаватель не найден!');
    END;
END;

DECLARE
    v_teacher_code CHAR(20) := 'ЛБКО';
    v_teacher_name VARCHAR2(70);
    e_teacher_not_found EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_teacher_not_found, -1403);
BEGIN
        SELECT TEACHER_NAME
        INTO v_teacher_name
        FROM TEACHER
        WHERE TEACHER = v_teacher_code;
        DBMS_OUTPUT.PUT_LINE('Имя преподавателя: ' || v_teacher_name);
EXCEPTION
        WHEN e_teacher_not_found THEN
            DBMS_OUTPUT.PUT_LINE('Преподаватель не найден! (переопределенное исключение)');
END;

DECLARE
    main_exception EXCEPTION;
    PRAGMA EXCEPTION_INIT(main_exception, -20001);
BEGIN
    DECLARE
        nested_exception EXCEPTION;
        PRAGMA EXCEPTION_INIT(nested_exception, -20001);
    BEGIN
        RAISE nested_exception;
    EXCEPTION
        WHEN nested_exception THEN
            DBMS_OUTPUT.PUT_LINE('Исключение обработано во вложенном блоке.');
            RAISE_APPLICATION_ERROR(-20001, 'Исключение во вложенном блоке.');
    END;
EXCEPTION
    WHEN main_exception THEN
        DBMS_OUTPUT.PUT_LINE('Исключение обработано в основном блоке.');
END;

DECLARE
    v_max_salary NUMBER;
BEGIN
    SELECT MAX(SALARY)
    INTO v_max_salary
    FROM TEACHER;
    DBMS_OUTPUT.PUT_LINE('Максимальное значение: ' || v_max_salary);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Исключение NO_DATA_FOUND сработало.');
END;

ALTER TABLE TEACHER ADD gabagool INT;

DECLARE
    v_max_salary NUMBER;
BEGIN
    SELECT MAX(gabagool)
    INTO v_max_salary
    FROM TEACHER;
    IF v_max_salary IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Максимальное значение: ' || v_max_salary);
    ELSE
        RAISE NO_DATA_FOUND;
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Исключение NO_DATA_FOUND сработало.');
END;

ALTER TABLE TEACHER DROP COLUMN gabagool;
COMMIT;