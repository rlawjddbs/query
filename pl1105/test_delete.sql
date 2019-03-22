set serveroutput on

declare

begin
	delete from cp_emp2
	where empno=2222;
	
	dbms_output.put_line(sql%rowcount||'건이 지워졌습니다.');
	
end;
/