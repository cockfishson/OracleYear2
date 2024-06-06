CREATE TABLE IPA_table (
    One NUMBER(3,0) NOT NULL PRIMARY KEY,
    Two VARCHAR2(50)
);

INSERT INTO IPA_t (
    One,
    Two
)
VALUES
    (1, 'Pavel');
    
SELECT tablespace_name
FROM dba_tablespaces
WHERE tablespace_name = 'PDB_TS';

SELECT file_name, tablespace_name
FROM dba_data_files
WHERE tablespace_name = 'PDB_TS';

SELECT grantee, granted_role
FROM dba_role_privs
WHERE grantee IN (SELECT username FROM dba_users WHERE tablespace_name = 'PDB_TS');

SELECT profile
FROM dba_profiles;

SELECT grantee, granted_role
FROM dba_role_privs
WHERE grantee IN (SELECT username FROM dba_users WHERE tablespace_name = 'PDB_TS');



select * from IPA_table;