-- 코드를 여러번 반복 실행시켜주는 loop 사용
set serveroutput on

declare
	i number;
begin
	i := 0;
    loop

    	dbms_output.put_line('오늘은 금요일인 부분'||i);
    	i := i+1; 
  		exit when (i=10);
--	    	if i = 10 then
--    			exit;
--    		end if;
    end loop;
    dbms_output.put_line('내일 퇼');
end;
/
