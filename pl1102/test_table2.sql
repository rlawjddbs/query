-- record를 데이터형으로 사용한 table
set serveroutput on

-- class4 학생들의 번호, 이름, 오라클점수를 처리하는 PL/SQL

declare
	-- 1.학생의 정보를 저장할 record 선언
	type stu_record is record(
		num number,
	    name varchar2(30),
	    oracle_score number(3)
	    );
	-- 2.학생들의 정보를 저장할 table 선언
	type stu_table is table of stu_record index by binary_integer;

	-- 3.table을 사용한 학생들의 정보를 처리할 변수 선언
	class4_tab stu_table;
--	class3_tab stu_table;
--	class2_tab stu_table;
    total_score number;
begin
	-- table 변수에 값 할당
	class4_tab(1).num := 1;
	class4_tab(1).name := '김정운';
	class4_tab(1).oracle_score := 66;

	class4_tab(2).num := 2;
	class4_tab(2).name := '김희철';
	class4_tab(2).oracle_score := 85;

	class4_tab(3).num := 3;
	class4_tab(3).name := '이재찬';
	class4_tab(3).oracle_score := 99;

	class4_tab(4).num := 4;
	class4_tab(4).name := '박영민';
	class4_tab(4).oracle_score := 79;

	dbms_output.put_line('응시인원 : '||class4_tab.count||'명');
	dbms_output.put_line('번호   이름    오라클점수');
	dbms_output.put_line('=========================');

	total_score := 0;
	for i in 1 .. class4_tab.count loop
	dbms_output.put_line(class4_tab(i).num||'      '||class4_tab(i).name||'      '||class4_tab(i).oracle_score);
	total_score := total_score + class4_tab(i).oracle_score;	
	end loop;
	dbms_output.put_line('=========================');
	dbms_output.put_line('총점['||total_score||'], 평균['||(total_score/class4_tab.count)||']');
	-- 이러한 작업을 보고 일괄 처리라고 한다.	
end;
/
