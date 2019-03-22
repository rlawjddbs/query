-- 사원번호, 사원명, 부서번호, 직무를 입력받아 cp_emp3 테이블에
-- 추가하는 PL/SQL 작성
-- 단, 사원의 연봉은 부서번호에 따라 동일 연봉으로 추가한다.
-- 10번 부서 : emp 테이블의 사원번호가 7566인 사원과 같은 연봉으로,
-- 20번 부서 : emp 테이블의 사원번호가 7698인 사원과 같은 연봉,
-- 30번 부서 : emp 테이블의 사원번호가 7782인 사원과 같은 연봉,
-- 그외 부서번호가 입력되면 emp테이블의 7788사원의 연봉으로 추가

set verify off
set serveroutput on
accept u_empno prompt '사원번호 : '
accept u_ename prompt '사원명 : '
accept u_deptno prompt '부서번호 : '
accept u_job prompt '직무 : '

declare
	i_empno cp_emp3.empno%type := &u_empno;
	i_ename cp_emp3.ename%type := '&u_ename';
	i_deptno cp_emp3.deptno%type := &u_deptno;	
	i_job cp_emp3.job%type := '&u_job';
	
	i_sal cp_emp.sal%type;
	select_empno cp_emp.empno%type := 7788;
begin
	-- 입력되는 부서번호별로 고정된 참조할 연봉을 조회하기 위한
	-- 사원번호를 설정
	if i_deptno = 10 then 
		select_empno := 7566;
	elsif i_deptno = 20 then
		select_empno := 7698;
	elsif i_deptno = 30 then
		select_empno :=7782;
	end if;
	
	-- 설정된 사원번호 별로 연봉을 조회
	select	sal
	into 	s_sal
	from	emp
	where empno = select_empno;
	
	-- 조회된 연봉으로 추가 작업
	insert into cp_emp3(empno, ename, deptno, job, sal) values(i_empno, i_ename, i_deptno, s_job, i_sal);
	
	dbms_output.put_line(i_empno||'번 사원 정보를 추가하였습니다.');
	commit;
end;
/
