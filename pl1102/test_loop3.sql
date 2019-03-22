-- 1에서 부터 100까지 짝수 만 출력

set serveroutput on
declare
    eve number(3);
begin
	eve := 1;
	loop
		eve := eve + 1;
--		if mod(eve,2) = 0 then 
			dbms_output.put(eve||' '); 
--		end if;
		eve := eve + 1;
		dbms_output.put_line(' ');
		exit when eve > 100;
  	end loop;
end;
/
