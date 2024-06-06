SELECT *
FROM dba_tablespaces;

SELECT *
FROM dba_temp_files;

SELECT TABLESPACE_NAME   
FROM dba_undo_extents
GROUP BY TABLESPACE_NAME;

SELECT tablespace_name, file_name
FROM dba_data_files;

SELECT tablespace_name, file_name
FROM dba_temp_files;

SELECT tablespace_name, segment_name
FROM dba_undo_extents;

SELECT * FROM V$LOG;

SELECT * FROM v$logfile;

ALTER SYSTEM SWITCH LOGFILE;

SELECT * FROM V$LOG;

ALTER DATABASE ADD LOGFILE GROUP 4 'C:\OracleDB\oradata\ORCL\REDO04.LOG'
SIZE 50m blocksize 512;

ALTER DATABASE ADD LOGFILE MEMBER 'C:\OracleDB\oradata\ORCL\REDO041.LOG' TO GROUP 4;

ALTER DATABASE ADD LOGFILE MEMBER 'C:\OracleDB\oradata\ORCL\REDO042.LOG' TO GROUP 4;

ALTER DATABASE ADD LOGFILE MEMBER 'C:\OracleDB\oradata\ORCL\REDO043.LOG' TO GROUP 4;

SELECT * FROM v$logfile;
