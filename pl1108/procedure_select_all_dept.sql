-- Procedure 안에서 여러행이 조회될 때
-- dept 테이블에서 모든 부서정보를 조회하여 out parameter에
-- 설정하는 procedure
create or replace procedure select_all_dept
(cur_dept out sys_refcursor)
is
--	dept_data dept%rowtype;
begin
	open cur_dept for
		select deptno, dname, loc
		from	dept;
	-- sys_refcursor를 사용할 때는 외부에서 사용할 수 있도록
	-- 커서의 인출을 procedure 내에서 수행하지 않는다.
	
--	loop
--		fetch cur_dept into dept_data;
--		exit when cur_dept%notfound;
--	end loop;
--	
--	close cur_dept;
end;
/
