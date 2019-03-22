-- 부서번호를 입력받아 emp 테이블에서 부서별 사원 정보를
-- 조회하여 out parameter에 저장하는 procedure 생성
-- 조회 : 사원번호, 사원명, 연봉, 부서번호, 부서명, 위치
-- 
-- 10~19 번 입력되면 10번 부서 조회,
-- 20~29 번 사이인 경우 20번 부서 조회
-- 그외는 30번 부서를 조회

create or replace procedure select_emp
(deptno number, cur_join out sys_refcursor)
is
	temp_deptno number := deptno;
begin
	-- 입력되는 부서번호를 10또는 20으로 생성
	temp_deptno := trunc(temp_deptno/10, 0) * 10;
	if temp_deptno not in (10, 20) then
		temp_deptno := 30;
	end if;
	
	-- refcursor 열기
    open cur_join for
    	select e.empno, e.ename, e.sal, d.deptno, d.dname, d.loc
    	from	dept d, emp e
    	where (e.deptno = d.deptno) and d.deptno = temp_deptno;
end;
/
