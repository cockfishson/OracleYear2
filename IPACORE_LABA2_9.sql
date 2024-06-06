CREATE TABLE IPA_T (
    FIRSTNAME VARCHAR2(20),
    AGE NUMBER(2)
)TABLESPACE IPA_TS;

INSERT  INTO IPA_T (FIRSTNAME, AGE) VALUES ('LABKO', 19);
-- DROP TABLE IPA_T;

INSERT  INTO IPA_T (FIRSTNAME, AGE) VALUES ('LABKO', 19);

SELECT * FROM IPA_T

RA-00376: в данный момент файл 16 не может быть прочитан
ORA-01110: файл данных 16: 'C:\ORACLE\TS_IPA.DAT'
00376. 00000 -  "file %s cannot be read at this time"
*Cause:    attempting to read from a file that is not readable. Most likely
           the file is offline.
*Action:   Check the state of the file. Bring it onlin

SELECT * FROM IPA_T
