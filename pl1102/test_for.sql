-- for : 시작과 끝을 한눈에 알 수 있고 1씩 증가하는 반복문
set serveroutput on

declare
	i number;
	num number;
	total number;
	
	msg varchar2(30);
begin
    -- for문 안에서의 변수 i는 for문 바깥의 변수 i와 이름은 같을지라도 
    -- for문 내에서만 유효한 다른 변수이다. (지역변수)
	for i in 1 .. 10 loop
		dbms_output.put_line('i = ' || i);
	end loop;
	-- for의 index를 저장하는 변수는 declare 에서 선언된 변수를
	-- 사용하지 않는다. for문 내에서 자체적으로 만들어 사용되는 변수이기 때문에
	-- for문 외부에 작성된 또다른 for문에서 사용되는 동명의 변수와도 충돌되지 않는다.
	dbms_output.put_line('for 종료 i = ' || i);
	-- 1 ~ 9 까지 1씩 증가하는 for 작성하여 출력
	num := 2;
	for i in 1 .. 9 loop
		dbms_output.put_line(num||' * '|| i ||' = '||(num*i));
	end loop;
	
	-- 1 ~ 100까지의 합 출력 : 5050 (누적합)
	-- 1+2+3+4+5+ ... + 00
	total := 0;
	for idx in 1 .. 100 loop
		total := total + idx;
	end loop;
	dbms_output.put_line('1~100까지의 합은 '||total||' 입니다.');   
	
	dbms_output.put_line('----------------------------------------------------------------------------------------');
	-- 바깥 for의 인덱스는 단으로 사용.
	for i in 2 .. 9 loop
		dbms_output.put_line(i||'단 시작');
			-- 안쪽 for의 인덱스는 곱해지는 수 사용.
			for j in 1 .. 9 loop
			dbms_output.put_line(i||' * '||j||' = '||(i * j));
			end loop;
		dbms_output.put_line(i||'단 끝');
	end loop;
	dbms_output.put_line('----------------------------------------------------------------------------------------');
	
	msg := '오늘은 금요일 입니다.';
	-- for를 사용하여 글자 한자씩 잘라내서 출력
	for i in 1..length(msg) loop
	dbms_output.put_line(substr(msg, i, 1));
	end loop; 
	-- reverse 를 시작수 앞에 쓰면 끝 수부터 시작해서 시작 수 까지 반복시킬 수 있다.
	for i in reverse 1..length(msg) loop
	dbms_output.put_line(substr(msg, i, 1));
	end loop;
end;
/