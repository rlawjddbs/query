-- 사원번호, 사원명, 연봉을 사용자에게 입력받아 CP_EMP2 테이블에
-- 추가하는 PL/SQL을 작성하라.
-- 단, 연봉이 5000 이상 입력되면 9000으로 변경하여 추가
-- 입사일은 추가되는 시점의 날짜로 추가한다.
set verify off
set serveroutput on

accept empno prompt'사원번호 : '
accept ename prompt'사원명 : '
accept sal prompt'연봉 : '
declare
	empno cp_emp2.empno%type;
	ename cp_emp2.ename%type;
	sal number := &sal;
begin
	empno := &empno;
	ename := '&ename';

	if 	sal > 9000 then
		sal := 9000;
	end if;
	-- 값을 제어한 후에 SQL문을 수행한다.
	insert into cp_emp2(empno, ename, hiredate, sal) values(empno, ename, sysdate, sal);

	commit;
	dbms_output.put_line(empno||'번 사원의 연봉을 '||sal||'으로 입력하였습니다.');

end;
/
--;
--
--select * from cp_emp2;
--trunc