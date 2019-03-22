-- bind 변수의 사용
-- 1. bind 변수 선언 : var[variable] 변수명 데이터형 (크기)
var name varchar2(30);
variable age number;

-- 2. bind 변수 값 할당  :변수명 := 값
set serveroutput on
declare
	name varchar2(30);
begin
	name :='테스트';
	-- 3. 바인드 변수에 값 할당
	:name := name||'님 안녕';
	:age := 20;
	
	dbms_output.put_line(name ||'  '||:name||'  '||:age);
end;
/

	-- 4. 바인드 변수의 값 출력
	print name age
	
	
	
	
