-- 여러행을 조회할 때 사용하는 cursor
-- dept 테이블의 모든 레코드를 조회하는 cursor


set serveroutput on

declare
	-- 1. 선언 : cursor 커서명 is select ... ; 
	cursor cur_dept is
		select deptno, dname, loc
		from dept;
	-- 조회결과를 저장할 변수 선언
		-- 1-1. 각각 담아보기
	deptno dept.deptno%type;
	dname dept.dname%type;
	loc dept.loc%type;
		-- 1-2. 한번에 담아보기	
	dept_data dept%rowtype;
begin
	-- 2. 열기
	open cur_dept;
--	close cur_dept;
    if cur_dept%isopen then
    	-- 커서가 열려 있다면 열린 커서를 닫고
    	dbms_output.put_line('커서가 열려있음');
    else
    	dbms_output.put_line('커서가 닫혀있음');
    end if;
    
    -- 3. 인출 : 반복
--    fetch cur_dept into deptno, dname, loc; 
--    fetch cur_dept into deptno, dname, loc;
--    fetch cur_dept into deptno, dname, loc; 
--    fetch cur_dept into deptno, dname, loc;  
      loop
-- 		3-1. into 절에 개별 변수를 사용하여 처리
--		fetch cur_dept into deptno, dname, loc;
-- 		if cur_dept%notfound then
--  	dbms_output.put_line('레코드 없음');
-- 		exit은 가장 가까이 있는 loop를 빠져나간다.
--		exit;
--		else
--		dbms_output.put_line('레코드 있음');

--		end if;  	      	                               
--		dbms_output.put_line( deptno||' '||dname||' '||loc );

-- 		3-2. into 절에 레코드 변수를 사용하여 처리
		fetch cur_dept into dept_data;
	    exit when cur_dept%notfound;
		dbms_output.put_line( dept_data.deptno||' '||dept_data.dname||' '||dept_data.loc );
		
      end loop;
      dbms_output.put_line('조회된 레코드 수 : '||cur_dept%rowcount);
		
     -- 4. 커서 닫기
     close cur_dept;

end;
/
