-- sys_refcursor의 사용
-- 커서의 제어권을 외부로 전달할 때 주로 사용한다.
-- 매니저번호를 입력받아 매니저가 관리하는사원의 
-- 사원번호, 사원명, 입사일, 부서번호, 연봉 조회
-- 입력된 매니저번호가 emp 테이블에 존재하는 매니저번호 일때만 검색을 수행한다. 
-- 7839, 7782, 7698, 7902, 7566, 7788

set verify off
set serveroutput on
	accept mgr prompt '매니저번호 : '
declare
	i_mgr number;
	
	-- 1. sys_refcursor 선언 : 커서명 sys_refcursor
	cur_mgr sys_refcursor;
	
	-- 조회 결과를 저장할 record type 선언
	type rec_emp is record(
		empno emp.empno%type,
		ename emp.ename%type,
		hiredate emp.hiredate%type,
		deptno emp.deptno%type,
		sal emp.sal%type
	);
	emp_data rec_emp;
	
begin
	-- 입력된 매니저 번호가 존재하는지 검색
	for temp_mgr in (select mgr from emp where mgr=&mgr)
	loop
		i_mgr := temp_mgr.mgr /*← 레코드 변수이므로 레코드변수명.컬럼명 으로 써줘야 함 */;

	end loop;
	if i_mgr is not null then
		/* dbms_output.put_line('매니저 존재'); */
		-- 2. 커서 열기 : 조회 쿼리문 작성
		open cur_mgr for
			select		empno, ename, hiredate, deptno, sal
			from		emp
			where		mgr=i_mgr;  
			
		-- 3. 인출			
			loop
				fetch cur_mgr into emp_data;
				exit when cur_mgr%notfound;
				dbms_output.put_line(emp_data.empno||'  '||emp_data.ename||'  '||to_char((emp_data.hiredate),'yyyy-mm-dd')||'  '||emp_data.deptno||'  '||emp_data.sal);
			end loop;
		-- 4. 커서 닫기
		-- 커서는 닫아주지 않으면 메모리 누수가 발생한다.
		close cur_mgr;			
	else
		dbms_output.put_line(&mgr||' 매니저는 존재하지 않습니다.'); 
	end if;
	
	
end;
/
