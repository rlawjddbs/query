set serveroutput on
set verify off

accept u_hiredate prompt '입사년도: '
declare
--	hiredate = '&u_hiredate';	
begin
	dbms_output.put_line(years_of_service('&u_hiredate'));

end;
/