-- table : 인덱스를 가지며, 순차적으로 값을 저장하고 사용하는 데이터형
set serveroutput on

declare
	--1. 테이블 데이터형 선언(테이블의 방의 데이터형이 무엇인지)
	type num_tab is table of number index by binary_integer;
	type varchar2_tab is table of varchar2(60) index by binary_integer;
	--2. 선언한 테이블 데이터형으로 테이블 변수 생성
	age_arr num_tab;
	name_arr varchar2_tab;
	total_age number;
	i number;
begin
	--3. 값 넣기: 인덱스 사용
	dbms_output.put_line('table변수 값 추가 전 방의 갯수'||age_arr.count);
	age_arr(1) := 20;
	age_arr(2) := 25;
	age_arr(3) := 27;
	age_arr(4) := 26;
	dbms_output.put_line('table변수 값 추가 후 방의 갯수'||age_arr.count);
		
		total_age := 0;
		for i in 1 .. age_arr.count loop
		dbms_output.put_line('age_arr('||i||') = '||age_arr(i));
		total_age := total_age +age_arr(i);
		end loop;
		dbms_output.put_line('총 나이 : '|| total_age);
		dbms_output.put_line('평균 나이 : '|| 
		   trunc(total_age/age_arr.count, 1));
--		dbms_output.put_line('age_arr(2) = '||age_arr(2));
--		dbms_output.put_line('age_arr(3) = '||age_arr(3));
--		dbms_output.put_line('age_arr(4) = '||age_arr(4));


		name_arr(1) := '정택성';
		name_arr(2) := '이재현';
		name_arr(3) := '이재찬';
		name_arr(4) := '김정운';
		name_arr(5) := '김희철';
		i:=1;
		while i < name_arr.count loop
			if name_arr(i) = '이재찬' then
			dbms_output.put('반장 ');
			end if;
			dbms_output.put_line(name_arr(i));
			i:= i+1;
		end loop;
end;
/