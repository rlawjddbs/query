-- 외부값 입력 받기
set serveroutput on
-- 검증 옵션 끄기
set verify off

accept name1 prompt '이름입력 : '
accept age1 prompt '나이입력 : '
--accept age3 prompt '나이 입력 : '
--accept birth prompt '태어난해를 4자리수로 입력 : '

declare
		name varchar2(90);
		age number;
--		age2 number;
		birth number(4);
begin
		-- 입력된 값을 변수에 저장
		-- 입력 값이 문자열인 경우에는 '로 묶어서 사용한다.
		name := '&name1';
		age := &age1;

--		dbms_output.put_line('이름 : '||name||'님 나이는 '||age||'살 입니다.');   
--		-- 태어난해 출력 : xx살 태어난해 xxxx년생   
--		age2 := &age3;
--		birth := &birth;   

dbms_output.put_line('이름 : '||name||'님 나이는 '||age||'살 입니다.');   
		-- 태어난해 출력 : xx살 태어난해 xxxx년생   
--		age2 := &age3;
		birth := to_char(sysdate, 'yyyy') -age + 1;
		
		dbms_output.put_line(age||'살 태어난해 '||birth||'년생');
		
		-- 산술 연산자가 아닌 연산자의 결과를 출력할 수 없다.
		dbms_output.put_line(age > 10);
end;
/
