-- 최소 0번 수행, 최대 조건까지 반복수행하는 while 

set serveroutput on

declare
	i number;
	odd number;
begin
	-- 1에서 10까지 1씩 증가하는 출력 while
	i := 1;
	-- 조건식
	while i <= 10 loop
	-- 반복수행문장
	dbms_output.put_line(i);
	-- 증가식, 감소식 - 조건에 도달하여 반복을 멈추기 위해
	i := i + 1;
	end loop;
	dbms_output.put_line('----------------------------------------------------------------------------------------------');
	-- 1 ~ 100 사이의 홀수만 출력하는 while
	odd := 1;
	while odd <= 100 loop
	if mod(odd,2) = 1 then 
	dbms_output.put_line(odd); end if;
		odd := odd + 1;
	end loop;
end;
/