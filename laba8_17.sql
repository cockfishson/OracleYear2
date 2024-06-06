create global temporary table TEMP_IPA_TB(
    x varchar2(10),
    y INT
);

INSERT INTO temp_ipa_tb (x,y) VALUES ('1',1);
INSERT INTO temp_ipa_tb (x,y) VALUES ('2',2);
INSERT INTO temp_ipa_tb (x,y) VALUES ('3',3);
COMMIT;

SELECT * FROM TEMP_IPA_TB;

--sys
GRANT DBA TO C##IPA;
GRANT CREATE SEQUENCE TO C##IPA;


CREATE SEQUENCE C##IPA.S1
  START WITH 1000
  INCREMENT BY 10
  NOMINVALUE
  NOMAXVALUE
  NOCYCLE
  NOCACHE
  NOORDER;

SELECT S1.NEXTVAL FROM DUAL CONNECT BY LEVEL <= 5;

CREATE SEQUENCE C##IPA.S2
  START WITH 10
  INCREMENT BY 10
  MAXVALUE 100
  NOCYCLE
  NOCACHE
  NOORDER;

SELECT S2.NEXTVAL FROM DUAL CONNECT BY LEVEL <= 10;

CREATE SEQUENCE C##IPA.S3
  START WITH 10
  INCREMENT BY -10
  MINVALUE -100
  MAXVALUE 100
  NOCYCLE
  NOCACHE
  ORDER;

SELECT S3.NEXTVAL FROM DUAL CONNECT BY LEVEL <= 12;

CREATE SEQUENCE C##IPA.S4
  START WITH 1
  INCREMENT BY 1
  NOMINVALUE
  MAXVALUE 10
  CYCLE
  CACHE 5
  NOORDER;

BEGIN
  FOR i IN 1..15 LOOP
    DBMS_OUTPUT.PUT_LINE('Next value of S4: ' || S4.NEXTVAL);
  END LOOP;
END;

SELECT * FROM SYS.USER_SEQUENCES;


SELECT * FROM T1;
CREATE TABLE T1 (
  N1 NUMBER(20),
  N2 NUMBER(20),
  N3 NUMBER(20),
  N4 NUMBER(20) 
)STORAGE(buffer_pool KEEP);

ALTER SEQUENCE S1 INCREMENT BY 430; 
SELECT S1.NEXTVAL FROM DUAL; 

ALTER SEQUENCE S2 INCREMENT BY -80; 
SELECT S2.NEXTVAL FROM DUAL; 

ALTER SEQUENCE S3 INCREMENT BY -10;
SELECT S3.NEXTVAL FROM DUAL;

ALTER SEQUENCE S4 INCREMENT BY -5; 
SELECT S4.NEXTVAL FROM DUAL; 

INSERT INTO T1 (N1, N2, N3, N4)
VALUES (S1.NEXTVAL, S2.NEXTVAL, S3.NEXTVAL, S4.NEXTVAL);

INSERT INTO T1 (N1, N2, N3, N4)
VALUES (S1.NEXTVAL, S2.NEXTVAL, S3.NEXTVAL, S4.NEXTVAL);

INSERT INTO T1 (N1, N2, N3, N4)
VALUES (S1.NEXTVAL, S2.NEXTVAL, S3.NEXTVAL, S4.NEXTVAL);

INSERT INTO T1 (N1, N2, N3, N4)
VALUES (S1.NEXTVAL, S2.NEXTVAL, S3.NEXTVAL, S4.NEXTVAL);

INSERT INTO T1 (N1, N2, N3, N4)
VALUES (S1.NEXTVAL, S2.NEXTVAL, S3.NEXTVAL, S4.NEXTVAL);

INSERT INTO T1 (N1, N2, N3, N4)
VALUES (S1.NEXTVAL, S2.NEXTVAL, S3.NEXTVAL, S4.NEXTVAL);

INSERT INTO T1 (N1, N2, N3, N4)
VALUES (S1.NEXTVAL, S2.NEXTVAL, S3.NEXTVAL, S4.NEXTVAL);

CREATE CLUSTER ABC (
      X NUMBER(10),
      V VARCHAR2(12))
      HASHKEYS 200;
COMMIT;

CREATE TABLE A(
    XA NUMBER(10),
    VA VARCHAR2(12), 
    AA NUMBER(10)
)CLUSTER ABC (XA, VA);

CREATE TABLE B(
    XB NUMBER(10),
    VB VARCHAR2(12), 
    BB NUMBER(10)
)CLUSTER ABC (XB, VB); 

CREATE TABLE C(
    XC NUMBER(10),
    VC VARCHAR2(12), 
    CC NUMBER(10)
)CLUSTER ABC (XC, VC); 

SELECT * FROM USER_TABLES;

SELECT * FROM USER_CLUSTERS;

CREATE SYNONYM COPY_C FOR C;
COMMIT;

SELECT * FROM COPY_C;

CREATE PUBLIC SYNONYM COPY_B for B;
COMMIT;

SELECT * FROM COPY_B;

create table FirstTable(
    x number(21), 
    y varchar(12),
    constraint x_pk primary key (x)
    );
    
create table SecondTable(
    i number(21),
    j varchar(12), 
    constraint i_fk foreign key (i) references FirstTable(x)
    );
commit;

insert into FirstTable (x, y) values (1,'s');
insert into FirstTable (x, y) values (2,'y');
insert into FirstTable (x, y) values (3,'n');
insert into FirstTable (x, y) values (4,'k');

insert into SecondTable (i, j) values (1,'a');
insert into SecondTable (i, j) values (2,'r');
insert into SecondTable (i, j) values (3,'y');
insert into SecondTable (i, j) values (4,'k');
commit;

select * from FirstTable;
select * from SecondTable;

create view ThisIsAView as select FirstTable.x,
    FirstTable.y as FirstT,
    SecondTable.j as SecondT
from FirstTable inner join SecondTable on FirstTable.x=SecondTable.i;
commit;

select * from ThisIsAView;

drop view ThisIsAView;

drop table FirstTable;

drop table SecondTable;

create materialized view MaterialView
build immediate
refresh complete on demand next sysdate+numtodsinterval(2,'minute')
as select * from FirstTable;
commit;

select * from MaterialView;

insert into FirstTable(x,y) values (5, 'pavou');
insert into FirstTable(x,y) values (6, 'pavel');
commit;

drop materialized view MaterialView;
commit;

CREATE DATABASE LINK LisaNavichok 
CONNECT TO  C##ENI_remote
IDENTIFIED BY "111111" USING 'lisalaba8';

DROP DATABASE LINK LisaNavichok;

SELECT * FROM REMOTE_TB@LisaNavichok;
insert into REMOTE_TB@LisaNavichok (id, name) values (5, 'LABKo');
commit;
update REMOTE_TB@LisaNavichok set name='Labkovski' where id=5;
delete from REMOTE_TB@LisaNavichok where id=5;
