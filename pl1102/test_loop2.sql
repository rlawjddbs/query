-- 1 ~ 100까지 출력하는 loop
set serveroutput on
declare
	-- 반복문에 사용할 변수는 초기화보단 선언만 해놓고 후에 초기화 하는 것이 좋다. (코드가 길어지면 스크롤해서 올라가야 하므로 불편함)
	cnt number(3);
begin
	-- 초기값
	cnt := 1;
	loop
		dbms_output.put(cnt||' ');
		cnt := cnt + 1;    
		exit when cnt = 101;
	end loop;
	dbms_output.put_line(' ');
end;
/