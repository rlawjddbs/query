-- 사원번호를 입력받아 사원명, 연봉, 직무, 입사일을 조회 
-- 단 연봉이 2000 미만 이라면 연봉의 2배를 연산하여 출력하고
-- 부서번호가 10, 20번 이라면 입사일을 월-일-년의 형식으로
-- 그렇지 않다면 년-월-일의 형식으로 출려할 것.

set verify off
set serveroutput on
accept empno prompt '사원번호 : '
declare
	i_empno emp.empno%type := &empno;
	ename emp.ename%type;
	sal emp.sal%type;
	job emp.job%type;
	hiredate emp.hiredate%type;
	deptno emp.deptno%type;
	
	date_format varchar2(30) := 'yyyy-mm-dd';
begin

	select		ename, sal, job, hiredate, deptno
	into		ename, sal, job, hiredate, deptno
	from		emp
	where		empno = i_empno;
    
    -- 연봉이 2000미만인 사원에 대한 처리
	if sal < 2000 then
	dbms_output.put_line(ename||'사원의 연봉은 현재 '||sal||'(으)로 두배 상승되어 '||(sal*2)||'(으)로 올랐습니다.');
	sal := sal*2;
	end if;
	
	-- 부서번호에 대한 날짜 출력 형식 변경 (mm-dd-yyyy)
	if deptno in (10, 20) then
		date_format := 'mm-dd-yyyy';
	end if;
    
	dbms_output.put_line(ename||' / '||sal||' / '||job||' / '||hiredate||' / '||deptno);
 	dbms_output.put_line(i_empno||'번 사원 정보');
 	dbms_output.put_line('사원명 : '||ename||', 직무 : '||job||', 연봉 : '||sal||', 부서번호 : '||deptno||', 입사일 : '||to_char(hiredate,date_format));
	
	exception when no_data_found then
	dbms_output.put_line('입력하신 ['||i_empno||']번의 사원번호는 존재하지 않습니다.'); 
	

	
end;
/