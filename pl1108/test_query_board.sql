-- emp 테이블의 사원번호 사원명 입사일 연봉 직무를 test_proc 테이블에 담아 새로운 테이블을 만들겠다.
create table test_proc as
	(select empno, ename, hiredate, sal, job from emp where 1=0);

-- test_proc 테이블의 empno 컬럼에 pk_test_proc라는 이름의  primary key 제약사항을 추가하겠다.
alter table test_proc add constraint pk_test_proc primary key(empno);

-- Primary Key 제약만 보겠다.
select * from user_constraints
where constraint_type='P';

-- procedure insert_test_proc 프로시저를 실행
var msg varchar2(300);
var cnt number;

-- 프로시저 insert_test_proc 직접 실행
exec insert_test_proc(1111, '테스트', 3000, '주임', :msg, :cnt);

-- 프로시저 실행 결과 확인
print msg;
print cnt;

-- 제약사항 1 : 사원번호 1 ~ 9999번 까지 입력 가능한지 확인, 0번 입력, 10000번 입력
-- 프로시저 insert_test_proc 직접 실행
exec insert_test_proc(0, '테스트', 3000, '주임', :msg, :cnt);
exec insert_test_proc(10000, '테스트', 3000, '주임', :msg, :cnt);

-- 프로시저 실행 결과 확인
print msg;
print cnt;


-- 제약사항 2 : 연봉 2500~8000 사이, 2500이하 2500으로
-- 8000 이상이라면 8000으로
-- 프로시저 insert_test_proc 직접 실행
exec insert_test_proc(1112, '테스트', 2400, '사원', :msg, :cnt);
exec insert_test_proc(1113, '테스트', 8500, '사원', :msg, :cnt);


-- 프로시저 실행 결과 확인
print msg;
print cnt;
select * from test_proc;

-- 제약사항 3 : 사원, 주임, 대리, 과장, 차장, 부장, 이사, 전무, 상무
exec insert_test_proc(1114, '테스트', 1400, '알바', :msg, :cnt);

-- 프로시저 실행 결과 확인
print msg;
print cnt;
select * from test_proc;

-- 제약사항 4 : 영어라면 첫 자를 대문자로
exec insert_test_proc(1114, 'kim', 1400, '사원', :msg, :cnt);

-- 프로시저 실행 결과 확인
print msg;
print cnt;
select * from test_proc;

-- 제약사항 5 : 사원명이 길게 입력되는 경우
exec insert_test_proc(1115, '선우용녀', 5000, '과장', :msg, :cnt);

-- 프로시저 실행 결과 확인
print msg;
print cnt;
select * from test_proc;

-- update_test_proc 프로시저 테스트1.
exec update_test_proc(1111, '대리', 2500, :asdf, :qwer);
print asdf;
print qwer;
select * from test_proc;

exec update_test_proc(1110, '대리', 2500, :asdf, :qwer);
print asdf;
print qwer;
select * from test_proc;

exec update_test_proc(1111, '알바', 2500, :asdf, :qwer);
print asdf;
print qwer;
select * from test_proc;

exec update_test_proc(1111, '주임', 4000, :asdf, :qwer);
print asdf;
print qwer;
select * from test_proc;

-- update_test_proc 프로시저 테스트2.
select * from user_procedures;
-- 외부변수 선언
var msg varchar2(300);
var cnt number;

-- 프로시저 실행1.
execute update_test_proc(1112, '주임', 3000, :cnt, :msg);
print cnt;
print msg;
select * from test_proc;

-- 프로시저 실행2. - 선임이라고 쓴 경우
execute update_test_proc(1112, '선임', 3100, :cnt, :msg);
print cnt;
print msg;
select * from test_proc;

-- 프로시저 실행3. - 연봉을 깎아내린 경우
execute update_test_proc(1114, '주임', 2490, :cnt, :msg);
print cnt;
print msg;
select * from test_proc;

-- delete_test_proc 프로시저 테스트1. - 존재하는 사원번호로 삭제
execute delete_test_proc(1111, :msg, :cnt);
print cnt;
print msg;
select * from test_proc;

-- delete_test_proc 프로시저 테스트2. - 존재하지 않는 사원번호로 삭제
execute delete_test_proc(1110, :msg, :cnt);
print cnt;
print msg;
select * from test_proc;

-- select_test_proc_cnt 프로시저 테스트1. -
var sal number;

exec select_test_proc_cnt('주임', :msg, :cnt, :sal);

print msg;
print cnt;
print sal;

-- select_test_proc_cnt 프로시저 테스트2. -
var sal number;

exec select_test_proc_cnt('사원', :msg, :cnt, :sal);

print msg;
print cnt;
print sal;

select * from test_proc;

-- select_test_proc_cnt 프로시저 테스트3. -
var sal number;

exec select_test_proc_cnt('김대리', :msg, :cnt, :sal);

print msg;
print cnt;
print sal;

select * from test_proc;

-- search_zipcode 프로시저 테스트 1. - 동 이름으로 우편번호 검색
execute search_zipcode('역삼동', :msg, :cnt);
print cnt;
print msg;
select dong from zipcode;

-- select_all_dept 프로시저 테스트 1. - 인출없이 사용
-- 1. bind변수 선언 : var 변수명 refcursor;
-- 2. 실행 : 			exec 프로시저명( : 변수명 )
-- 3. 출력 : 			print 변수명;

-- sys_refcursor의 사용
var cur_dept refcursor;

-- sys_refcursor 를 저장
exec select_all_dept(:cur_dept);

-- 출력
print cur_dept;



-- select_emp 프로시저 테스트 1 .
var asdfasdf refcursor;
execute select_emp(11, :asdfasdf);
                                          
-- 숙제
--아래의 Dictionary테이블을 사용하여 
--user_constraints, user_tab_cols, user_tab_columns
--입력된테이블에 대한 제약사항명, 컬럼명, 데이터형 
--을 조회하는 쿼리문을 작성 


