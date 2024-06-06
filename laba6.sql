SELECT value
FROM v$parameter
WHERE name = 'spfile';

CREATE PFILE = 'IPA_PFILE.ORA' FROM SPFILE;

ALTER SYSTEM SET OPEN_CURSORS=330 SCOPE=SPFILE;

ALTER SYSTEM SET OPEN_CURSORS=300 SCOPE=SPFILE;

CREATE SPFILE='IPA_SPFILE.ora' FROM PFILE='IPA_PFILE.ORA';

show parameter SPFILE;

startup pfile='C:/WINDOWS.X64_193000_db_home/database/IPA_PFILE.ORA' 

show parameter SPFILE;

show parameter SPFILE;

show parameter control;

Select * from V$Passwordfile_info;
SELECT * FROM V$DIAG_INFO;

