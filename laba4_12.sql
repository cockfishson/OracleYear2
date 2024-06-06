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

select dest_name, status,destination FROM V$ARCHIVE_DEST;
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

ALTER DATABASE DROP LOGFILE GROUP 4;

SELECT * FROM V$LOG;

SELECT NAME,LOG_MODE FROM V$DATABASE;

ARCHIVE LOG LIST

ALTER SYSTEM ARCHIVE LOG CURRENT;

SELECT a.GROUP#, a.THREAD#, a.SEQUENCE#, a.ARCHIVED, a.STATUS, b.MEMBER AS REDOLOG_FILE_NAME, (a.BYTES/1024/1024) AS SIZE_MB
FROM v$log a
INNER JOIN v$logfile b ON a.GROUP# = b.GROUP#
WHERE a.STATUS = 'CURRENT';

SHOW PARAMETER CONTROL;
SELECT * FROM V$CONTROLFILE

SELECT * FROM v$parameter WHERE name LIKE 'control_files' OR name LIKE 'log_archive%';


SELECT MAX(SEQUENCE#) FROM V$ARCHIVED_LOG;