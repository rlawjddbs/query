-- cp_emp 테이블에 레코드가 추가되면
-- cp_emp3 테이블에 사원번호, 사원명, 부서번호, 직무, 연봉을 추가하는 trigger
-- 부서번호는 emp테이블의 사원번호가 7788인 사원과 동일한 번호로 추가
-- 연봉은 2000이하가 추가되면 cp_emp3 테이블에는 연봉에 500을 더하여 추가하는 trigger 작성

create or replace trigger tri_emp
after insert on cp_emp
for each row

declare
	cp_deptno number;
	cp_job varchar2(20);
	cp_sal number;
begin
	if inserting then
		select		deptno, job
		into		cp_deptno, cp_job
		from      emp
		where		empno=7788;
		
		cp_sal := :new.sal;
		if :new.sal <= 2000 then
			cp_sal := :new.sal + 500;
		end if;
		
		insert into cp_emp3(empno, ename, deptno, job, sal)
		values(:new.empno, :new.ename, cp_deptno, cp_job, cp_sal);
	end if;
end;
/
