-- 계정 생성 : 관리자 계정만 생성가능
-- create user 계정명 identified by 초기비번;
create user test_user identified by 1111;

-- 접속권한, 자원사용권한, 관리자 권한:
grant connect,resource,dba to test;

-- 테이블 생성 X (resource 권한이 부여되면 가능)
create table my_table(num number);
insert into my_table values(1);
commit;
select * from my_table;

select sysdate, '연습' msg from dual;

-- 관리자 권한 부여 후 일반 계정이 관리자의 업무 수행
create view test_view as (select num from my_table);
select * from user_views;
drop view test_view;

-- 권한 회수 :
-- revoke 권한... from 계정명;
revoke dba from test;

-- 권한 회수후 실행해보기(비밀번호 바꾸기, 권한 부족으로 실행이 안되야 정상)
create user test1 identified by 2222;

-- system 계정으로 접속 (system/managerum)
-- 관리자 계정으로 접속 후 어떤 테이블이 있는지 확인
select tname from tab;

-- 관리자 계정으로 접속 후 계정 조회해보기 (all_users, dba_users)
-- all_users : 계정명, 계정ID, 생성일자 표시
-- dba_users : 계정의 여러정보 표시
select * from all_users;
select * from dba_users;

