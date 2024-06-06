SELECT SUM(VALUE) FROM V$SGA;

SELECT *
FROM v$sga_dynamic_components
WHERE CURRENT_SIZE > 0;

SELECT NAME, BYTES
FROM
    v$sgainfo
WHERE NAME = 'Granule Size';

SELECT *
FROM v$sga_dynamic_free_memory

SELECT * FROM V$SGASTAT

SELECT NAME, BYTES
FROM
    v$sgainfo
WHERE NAME = 'Free SGA Memory Available';

SELECT value
FROM v$parameter
WHERE name = 'sga_target' or name = 'sga_max_size';

SELECT COMPONENT, CURRENT_SIZE, MIN_SIZE FROM v$sga_dynamic_components  where component='KEEP buffer cache' or component='DEFAULT buffer cache' or component='RECYCLE buffer cache';

create table MyTable(x int) storage(buffer_pool keep);

COMMIT 

select segment_name, segment_type, tablespace_name, buffer_pool from user_segments where lower(segment_name) like '%mytable%';

drop table MyTable;

create table mytable2 (x int) storage(buffer_pool default);

select segment_name, segment_type, tablespace_name, buffer_pool from user_segments where lower(segment_name)='mytable2';

show parameter log_buffer;

select *from (select pool, name, bytes from v$sgastat where pool = 'shared pool' order by bytes desc) where NAME = 'free memory';

select username, server from v$session where server = 'DEDICATED' or server='SHARED';

select * from v$bgprocess;

select * from v$bgprocess where paddr != '00';

select count(*) from v$bgprocess where paddr!= '00' and name like 'DBW%';

select * from V$SERVICES;

select * from v$dispatcher;
show parameter dispatchers;

SELECT *
FROM V$SGASTAT
where pool = 'large pool' and name='free memory';


