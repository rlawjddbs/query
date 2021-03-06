-- 부서번호를 입력받아 해당부서에 근무하는 사원번호
-- 사원명, 연봉, 입사일을 조회 한 후 총 사원 수와,

set serveroutput on
set verify off

	accept u_deptno prompt '부서번호 : '
declare
	-- 1. 커서선언
	cursor cur_emp is
		select empno, ename, sal, to_char(hiredate, 'yyyy-mm-dd')
		from emp
		where	deptno = &u_deptno;
	-- 레코드 변수 선언
	type rec_emp is record(
		empno emp.empno%type,
		ename emp.ename%type,
		sal emp.sal%type,
		hiredate varchar2(10)
	);
    
	-- 테이블 생성 (데이터처리와 보여지는 부분을 분리하여 만들기 위해)
	type tab_emp is table of rec_emp index by binary_integer;
	arr_emp tab_emp;
	
	
	emp_data rec_emp;
	-- 연봉의 합 저장
	total_sal number := 0;
begin
	-- 2. 커서 열기
	if cur_emp%isopen then
		close cur_emp;
	end if;

	open cur_emp;

	-- 3. 인출
	dbms_output.put_line('사원번호   사원명   연봉   입사일');
	loop
		fetch cur_emp into emp_data;
		exit when cur_emp%notfound;
		dbms_output.put_line(emp_data.empno||'       '||emp_data.ename||'     '||emp_data.sal||'    '||emp_data.hiredate);
        

		
		total_sal := total_sal + emp_data.sal;
	end loop;
		if cur_emp%rowcount = 0 then
		dbms_output.put_line(&u_deptno||'번 부서는 존재하지 않거나 사원이 없습니다.');
		else
		dbms_output.put_line(&u_deptno||'번 부서 사원수 '||cur_emp%rowcount||' 명');
		dbms_output.put_line('연봉 합 : '||total_sal);
		end if;
		dbms_output.put_line('사용해주셔서 감사합니다.');
	-- 4. 커서 닫기
	close cur_emp;
end;
/
