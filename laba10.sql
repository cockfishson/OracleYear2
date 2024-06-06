DROP TABLE FACULTY CASCADE CONSTRAINTS;
DROP TABLE PULPIT CASCADE CONSTRAINTS;
DROP TABLE TEACHER CASCADE CONSTRAINTS;
DROP TABLE AUDITORIUM_TYPE CASCADE CONSTRAINTS;
DROP TABLE AUDITORIUM CASCADE CONSTRAINTS;
DROP TABLE SUBJECT CASCADE CONSTRAINTS;


CREATE TABLE FACULTY (
    FACULTY CHAR(10) NOT NULL,
    FACULTY_NAME VARCHAR2(90),
    PRIMARY KEY(FACULTY)
);

CREATE TABLE PULPIT (
    PULPIT CHAR(30) NOT NULL,
    PULPIT_NAME VARCHAR2(200),
    FACULTY CHAR(10) NOT NULL,
    PRIMARY KEY(PULPIT),
    FOREIGN KEY(FACULTY) REFERENCES FACULTY(FACULTY)
);

CREATE TABLE TEACHER (
    TEACHER CHAR(20) NOT NULL,
    TEACHER_NAME VARCHAR2(70),
    PULPIT CHAR(30) NOT NULL,
    PRIMARY KEY(TEACHER),
    FOREIGN KEY(PULPIT) REFERENCES PULPIT(PULPIT)
);

CREATE TABLE SUBJECT (
    SUBJECT CHAR(20) NOT NULL,
    SUBJECT_NAME VARCHAR2(100) NOT NULL,
    PULPIT CHAR(30) NOT NULL,
    PRIMARY KEY(SUBJECT),
    FOREIGN KEY(PULPIT) REFERENCES PULPIT(PULPIT)
);

CREATE TABLE AUDITORIUM_TYPE (
    AUDITORIUM_TYPE CHAR(10),
    AUDITORIUM_TYPENAME VARCHAR2(70) NOT NULL,
    PRIMARY KEY(AUDITORIUM_TYPE)
);

CREATE TABLE AUDITORIUM (
    AUDITORIUM CHAR(10),
    AUDITORIUM_NAME VARCHAR2(200),
    AUDITORIUM_CAPACITY NUMBER(4),
    AUDITORIUM_TYPE CHAR(10) NOT NULL,
    PRIMARY KEY(AUDITORIUM),
    FOREIGN KEY(AUDITORIUM_TYPE) REFERENCES AUDITORIUM_TYPE(AUDITORIUM_TYPE)
);

insert into FACULTY   (FACULTY,   FACULTY_NAME )
             values  ('����',   '����������� ���� � ����������');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('����',   '���������� ���������� � �������');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('���',     '����������������� ���������');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('���',     '���������-������������� ���������');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('����',    '���������� � ������� ������ ��������������');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('���',     '���������� ������������ �������');

insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY )
             values  ('����',    '������������� ������ � ���������� ',                         '����'  );
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY )
             values  ('������', '���������������� ������������ � ������ ��������� ���������� ', '����'  );
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
              values  ('��',      '�����������',                                                 '���') ;         
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('��',      '������������',                                                 '���') ;   
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('��',      '��������������',                                              '���');           
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('�����',   '���������� � ����������������',                               '���');                
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('������',  '������������ �������������� � ������-��������� �������������','���');                  
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('��',     '���������� ����',                                              '����');                        
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('�����',  '������ ����� � ���������� �������������',                      '����');                        
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('��',     '������������ �����',                                           '���');            
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                              FACULTY)
             values  ('��������','���������� ���������������� ������� � ����������� ���������� ����������','���');             
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                      FACULTY)
             values  ('�������','���������� �������������� ������� � ����� ���������� ���������� ','����');                    
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                                         FACULTY)
             values  ('��������','�����, ���������� ����������������� ����������� � ���������� ����������� �������', '����');
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                      FACULTY)
             values  ('����',    '������������� ������ � ����������',                              '���');   
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                      FACULTY)
             values  ('����',   '����������� � ��������� ������������������',                       '���');  
             
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT )
                       values  ('����',    '������ �������� �������������',  '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('�����',    '�������� ��������� ��������',  '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('�����',    '���������� ������ ����������',  '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('����',    '������ ���� �����������',  '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('����',    '������� �������� ��������',  '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('�����',    '�������� ������ ���������',  '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('���',     '����� ��������� ����������',  '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('���',     '������� ��������� �����������',  '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('���',     '��������� ����� ��������',  '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('����',     '��������� ������� ����������',  '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('������',  '����������� ������� ����������', '����' );
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('?',     '�����������',  '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                      values  ('���',     '����� ������� ��������',  '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('���',     '����� ������� �������������',  '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('������',   '���������� ��������� �������������',  '������');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('�����',   '������� ������ ����������',  '������');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('������',   '����������� ��������� ��������',  '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('����',   '������� ��������� ����������',  '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('����',   '������ ������ ��������',  '��');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('����', '������� ������ ����������',  '������');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('������',   '���������� �������� ��������',  '��');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('���',   '������ ���������� ������������',  '��');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('�����',   '��������� �������� ���������',  '�����'); 
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('������',   '���������� �������� ����������',  '��'); 
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('������',   '��������� ������� ���������',  '��������'); 
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('�����',   '�������� ������ ����������',  '��'); 
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('���',   '����� ������ ��������',  '�����'); 
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('����',   '������ ������� ���������',  '�������'); 
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('����',   '������� ���� ����������',  '��������'); 
                    
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('����',   '������� ���������� ������ ������',                   '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT)
                       values ('��',     '���� ������',                                        '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('���',    '�������������� ����������',                          '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('����',  '������ �������������� � ����������������',            '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('��',     '������������� ������ � ������������ ��������',       '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('���',    '��������������� ������� ����������',                 '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('����',     '������������� ������ ��������� ����������',        '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('���',     '�������������� �������������� ������',              '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('��',      '������������ ��������� ',                           '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('�����',   '��������������� ������, �������� � �������� �����', '������');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('���',     '������������ �������������� �������',               '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('���',     '����������� ���������������� ������������',         '������');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,                            PULPIT)
               values ('��',   '���������� ���������',                     '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,                             PULPIT )
               values ('��',   '�������������� ����������������',          '����');  
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,                             PULPIT )
               values ('����', '���������� ������ ���',                     '����');                   
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,                             PULPIT )
               values ('���',  '��������-��������������� ����������������', '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('��',     '��������� ������������������',                       '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('��',     '������������� ������',                               '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('������OO','�������� ������ ������ � ���� � ���. ������.',      '��');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('�������','������ ��������������� � ������������� ���������',  '������');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('��',     '���������� �������� ',                              '��');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('��',    '�����������',                                        '�����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('��',    '������������ �����',                                 '��');   
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('���',    '���������� ��������� �������',                      '��������'); 
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('���',    '������ ��������� ����',                             '��');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('����',   '���������� � ������������ �������������',           '�����'); 
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('����',   '���������� ���������� �������� ���������� ',        '�������');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('���',    '���������� ������������',                           '��������');
                       
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,   AUDITORIUM_TYPENAME )
                       values  ('��',   '����������');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,   AUDITORIUM_TYPENAME )
                       values  ('��-�',   '������������ �����');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,   AUDITORIUM_TYPENAME )
                       values  ('��-�', '���������� � ���. ������������');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,   AUDITORIUM_TYPENAME )
                       values  ('��-X', '���������� �����������');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,   AUDITORIUM_TYPENAME )
                       values  ('��-��', '����. ������������ �����');
                       
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('206-1',   '206-1', '��-�', 15);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)
                       values  ('301-1',   '301-1', '��-�', 15);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('236-1',   '236-1', '��',   60);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('313-1',   '313-1', '��',   60);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('324-1',   '324-1', '��',   50);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('413-1',   '413-1', '��-�', 15);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('423-1',   '423-1', '��-�', 90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('408-2',   '408-2', '��',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('103-4',   '103-4', '��',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('105-4',   '105-4', '��',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('107-4',   '107-4', '��',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('110-4',   '110-4', '��',  30);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('111-4',   '111-4', '��',  30);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                      values  ('114-4',   '114-4', '��-�',  90 );
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values ('132-4',   '132-4', '��',   90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values ('02�-4',   '02�-4', '��',   90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values ('229-4',   '229-4', '��',   90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('304-4',   '304-4','��-�', 90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('314-4',   '314-4', '��',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('320-4',   '320-4', '��',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('429-4',   '429-4', '��',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                        values  ('?',   '???', '��',  90);
                        
BEGIN 
    NULL;
END;

BEGIN 
    DBMS_OUTPUT.PUT_LINE('HELLO WORLD!');
END;

SELECT KEYWORD FROM V$RESERVED_WORDS WHERE LENGTH=1 AND KEYWORD !='A';

SELECT KEYWORD FROM V$RESERVED_WORDS WHERE LENGTH>1 AND KEYWORD !='A' ORDER BY KEYWORD;

DECLARE
  num1 NUMBER := 10;
  num2 NUMBER := 3;
  result_add NUMBER;
  result_sub NUMBER;
  result_mul NUMBER;
  result_div NUMBER;
  result_mod NUMBER;
  num_fixed1 NUMBER(7, 2) := 12345.67;
  num_fixed2 NUMBER(7, 2) := 69.01;
  num_rounded NUMBER(7, -2) := 12345.67;
  num_exp NUMBER := 1.23E4;
  date_var DATE := SYSDATE;
  date_custom DATE := TO_DATE('2024-05-19', 'YYYY-MM-DD');
  char_var CHAR(15) := 'Hello World';
  varchar_var VARCHAR2(20) := 'Laba 10';
  clob_var CLOB := 'This is a CLOB type variable LOL I dont know what to say else';
  bool_true BOOLEAN := TRUE;
  bool_false BOOLEAN := FALSE;
BEGIN
  result_add := num1 + num2;
  result_sub := num1 - num2;
  result_mul := num1 * num2;
  result_div := num1 / num2;
  result_mod := MOD(num1, num2);
  DBMS_OUTPUT.PUT_LINE('�������������� ��������:');
  DBMS_OUTPUT.PUT_LINE('num1 + num2 = ' || result_add);
  DBMS_OUTPUT.PUT_LINE('num1 - num2 = ' || result_sub);
  DBMS_OUTPUT.PUT_LINE('num1 * num2 = ' || result_mul);
  DBMS_OUTPUT.PUT_LINE('num1 / num2 = ' || result_div);
  DBMS_OUTPUT.PUT_LINE('num1 % num2 = ' || result_mod);
  DBMS_OUTPUT.PUT_LINE('num_fixed1 = ' || num_fixed1);
  DBMS_OUTPUT.PUT_LINE('num_fixed2 = ' || num_fixed2);
  DBMS_OUTPUT.PUT_LINE('num_rounded = ' || num_rounded);
  DBMS_OUTPUT.PUT_LINE('num_exp = ' || num_exp);
  DBMS_OUTPUT.PUT_LINE('date_var = ' || TO_CHAR(date_var, 'SS:MI:HH24 DD-MM-YYYY'));
  DBMS_OUTPUT.PUT_LINE('date_custom = ' || TO_CHAR(date_custom, 'YYYY-MM-DD'));
  DBMS_OUTPUT.PUT_LINE('char_var = ' || char_var);
  DBMS_OUTPUT.PUT_LINE('varchar_var = ' || varchar_var);
  DBMS_OUTPUT.PUT_LINE('clob_var = ' || DBMS_LOB.SUBSTR(clob_var, 100));
  DBMS_OUTPUT.PUT_LINE('bool_true = ' || CASE WHEN bool_true THEN 'TRUE' ELSE 'FALSE' END);
  DBMS_OUTPUT.PUT_LINE('bool_false = ' || CASE WHEN bool_false THEN 'TRUE' ELSE 'FALSE' END);
END;

DECLARE
  const_varchar2 CONSTANT VARCHAR2(20) := 'Hello PL/SQL';
  const_char CONSTANT CHAR(5) := 'World';
  const_number CONSTANT NUMBER := 100;
  const_fixed_number CONSTANT NUMBER(5, 2) := 99.99;
  result_concat VARCHAR2(25);
  result_length NUMBER;
  result_upper VARCHAR2(20);
  result_add NUMBER;
  result_mul NUMBER;
BEGIN
  result_concat := const_varchar2 || ' ' || const_char;
  DBMS_OUTPUT.PUT_LINE('������������ �����: ' || result_concat);
  result_length := LENGTH(const_varchar2);
  DBMS_OUTPUT.PUT_LINE('����� ������ const_varchar2: ' || result_length);
  result_upper := UPPER(const_char);
  DBMS_OUTPUT.PUT_LINE('������� ������� const_char: ' || result_upper);
  result_add := const_number + const_fixed_number;
  DBMS_OUTPUT.PUT_LINE('�������� �����: ' || result_add);
  result_mul := const_number * const_fixed_number;
  DBMS_OUTPUT.PUT_LINE('��������� �����: ' || result_mul);
END;

DECLARE
  v_faculty faculty.faculty%TYPE;
  v_faculty_name faculty.faculty_name%TYPE;
BEGIN
  v_faculty := '1';
  v_faculty_name := '1111';
  INSERT INTO faculty (faculty, faculty_name)
  VALUES (v_faculty, v_faculty_name);
  DBMS_OUTPUT.PUT_LINE('FACULTY: ' || v_faculty);
  DBMS_OUTPUT.PUT_LINE('FACULTY_NAME: ' || v_faculty_name);
  SELECT faculty, faculty_name
  INTO v_faculty, v_faculty_name
  FROM faculty
  WHERE faculty = '����';
  DBMS_OUTPUT.PUT_LINE('�������� ����������� ������:');
  DBMS_OUTPUT.PUT_LINE('FACULTY: ' || v_faculty);
  DBMS_OUTPUT.PUT_LINE('FACULTY_NAME: ' || v_faculty_name);
END;

SELECT * FROM FACULTY;

DECLARE
  v_faculty_row FACULTY%ROWTYPE;
BEGIN
  v_faculty_row.FACULTY := '2';
  v_faculty_row.FACULTY_NAME := '222';
  INSERT INTO FACULTY (FACULTY, FACULTY_NAME)
  VALUES (v_faculty_row.FACULTY, v_faculty_row.FACULTY_NAME);
  DBMS_OUTPUT.PUT_LINE('����������� ������:');
  DBMS_OUTPUT.PUT_LINE('FACULTY: ' || v_faculty_row.FACULTY);
  DBMS_OUTPUT.PUT_LINE('FACULTY_NAME: ' || v_faculty_row.FACULTY_NAME);
  SELECT *
  INTO v_faculty_row
  FROM FACULTY
  WHERE FACULTY = '2';
  DBMS_OUTPUT.PUT_LINE('����������� ������:');
  DBMS_OUTPUT.PUT_LINE('FACULTY: ' || v_faculty_row.FACULTY);
  DBMS_OUTPUT.PUT_LINE('FACULTY_NAME: ' || v_faculty_row.FACULTY_NAME);
END;

DECLARE
  v_num1 NUMBER := 10;
  v_num2 NUMBER := 20;
BEGIN
 IF v_num1 = v_num2 THEN
    DBMS_OUTPUT.PUT_LINE('v_num1 ����� v_num2');
  ELSIF v_num1 < v_num2 THEN
    DBMS_OUTPUT.PUT_LINE('v_num1 ������ v_num2');
  ELSE
    DBMS_OUTPUT.PUT_LINE('v_num1 ������ v_num2');
  END IF;
END;

DECLARE
    v_num NUMBER :=11;
    v_RESULT NUMBER;
BEGIN
  v_RESULT := MOD(v_num,2);
  CASE v_RESULT
    WHEN 0 THEN
      DBMS_OUTPUT.PUT_LINE('����� ������');
    WHEN 1 THEN
      DBMS_OUTPUT.PUT_LINE('����� ��������');
    ELSE
      DBMS_OUTPUT.PUT_LINE('���?');
  END CASE;
END;

DECLARE
  v_counter NUMBER := 1;
BEGIN
  LOOP
    DBMS_OUTPUT.PUT_LINE('���� ����� ' || v_counter);
    v_counter := v_counter + 1;
    EXIT WHEN v_counter > 10;
  END LOOP;
END;

DECLARE
  v_counter NUMBER := 1;
BEGIN
  WHILE v_counter <= 10 LOOP
    DBMS_OUTPUT.PUT_LINE('���� ����� ' || v_counter);
    v_counter := v_counter + 1;
  END LOOP;
END;

BEGIN
 FOR i IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE('���� ����� ' || i);
  END LOOP;
END;