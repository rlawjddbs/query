-- 단일 if : 조건에 맞는 경우에만 코드를 실행 해야할 때.
-- 이름을 입력받아 이름이 '이재찬' 이라면 이름 출력 전에
-- '인천시 자랑'을 출력 할 것. 다른 이름은 이름만 출력
set serveroutput on
set verify off

accept name prompt '이름입력 : '
declare
        -- name varchar2(30);
        name table_primary.name%type := '&name';

begin
		if name='이재찬' then 
		dbms_output.put_line('인천시의 자랑 ');
		end if;
        dbms_output.put_line(name||'님 안녕하세요?');
end;
/