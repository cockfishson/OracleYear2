CREATE TABLE IPA_T1(
    FIRSTNAME VARCHAR2(20),
    AGE NUMBER(2)
)TABLESPACE IPA_QDATA;

INSERT  INTO IPA_T1 (FIRSTNAME, AGE) VALUES ('LABKO', 19);

COMMIT

SELECT segment_name, segment_type
FROM user_segments
WHERE segment_name = '%IPA%';

DROP TABLE IPA_T1;

SELECT * FROM USER_RECYCLEBIN;

FLASHBACK TABLE IPA_T1 TO BEFORE DROP;

DECLARE
    v_firstname VARCHAR2(20);
    v_age NUMBER(2);
BEGIN
    FOR i IN 1..10000 LOOP
        v_firstname := 'Name_' || i;
        v_age := TRUNC(DBMS_RANDOM.VALUE(18, 99));
        INSERT INTO IPA_T1 (FIRSTNAME, AGE)
        VALUES (v_firstname, v_age);
    END LOOP;
    COMMIT;
END;

SELECT ROWID FROM IPA_T1;

SELECT ORA_ROWSCN FROM IPA_T1;
