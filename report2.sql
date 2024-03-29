-- 현재 데이터베이스 정보 조회
select * from v$database;

-- 현재 사용 중인 데이터베이스 파일 정보 출력
select * from v$datafile;
select creation_time, status, enabled, bytes, blocks, create_bytes, block_size, name, con_id from v$datafile;

-- 가동중인 데이터베이스 파일 정보 출력
select * from v$controlfile;
select name, is_recovery_dest_file, block_size, file_size_blks, con_id from v$controlfile; 

-- 로그 파일 정보 출력
select * from v$logfile;
select type, member, is_recovery_dest_file, con_id from v$logfile;

-- 현재 시스템 권한 정보 조회
select * from dba_sys_privs;

-- 현재 DBMS의 DBA 권한 정보 조회
select * from dba_tab_privs;

-- 현재 데이터베이스에 설정된 파라미터 값 출력
show parameter;

-- 모든 사용자 정보 조회
select * from all_users;

-- DBA가 적용된 사용자 정보 조회
select * from dba_users;

-- 모든 사용자 권한 조회
select grantee, privilege, admin_option from dba_sys_privs;

-- 현재 사용자 권한 조회
select username, privilege, admin_option from user_sys_privs;

-- DB가 정상적으로 open이 되어져 있는지 확인
select status from v$instance;

-- 모든 사용자의 모든 테이블 목록
select * from all_tables;

-- 현재 계정에서 사용 가능한 모든 테이블 목록
select * from tab where tabtype='TABLE';
select * from user_tables;

-- C##TEST123 계정의 사용자 테이블 목록 조회
select * from all_tables where owner='C##TEST123';
select * from all_tables where owner='SYSTEM';
-- pct_used : 어느 정도 삭제가 되어야지 테이블스펭이스를 재활용 할지
-- pct_free : 테이블스페이스 여유 공간량으로 지정한 수치까지 만큼의 양은 항상 남아 있어야 데이터베이스를 운용할 수 있음을 뜻함
select owner, table_name, tablespace_name, pct_used from all_tables where owner='SYSTEM';