--숙제 .
--
--1.  class4 강의장의 학생들의 교통요금을 구하는  PL/SQL을 제작
--   하고자한다.  대중교통수단 요금은 아래와 같으며
--   [버스 : 1200원,  지하철 :1250원] , 10키로를 초과하면 매 4키로마다
--  100원의 요금 더 부과된다.
--  이 정보를 이용하여 아래 학생들의 데이터를 처리하세요
--  데이터.
-- 1, 김정운, 서울시 강남구 역삼동, 5키로, 버스
--  2, 김희철, 인천시 남동구 구월동, 20키로, 지하철
--  3, 이재찬, 인천시 부평구 부평동, 16키로, 지하철
--  4, 박영민, 서울시 관악구 봉천동, 10키로, 지하철
--  5, 정택성, 서울시 동대문구 동대문동, 8키로, 버스
--
--   출력
--   번호, 이름,  주소, 거리, 교통수단, 요금

--	숙제 2.
--	학생들의 정보를 처리하는 PL/SQL작성.
--  번호, 이름, 오라클점수,자바점수,총점,평균 을 저장할 수있는 record를
--  만들고 아래의 데이터를 입력한 후
--  반복문을 사용하여  총점,평균을 처리하는 PL/SQL 작성
-- 	1, 김정운, 80,81
--  2, 김희철, 94,80
--  3, 이재찬, 97,96
--  4, 박영민, 86,92
--  5, 정택성, 76,99
--
-- 	출력
--  번호, 이름, 오라클점수,자바점수,총점,평균
--  .
--  .
--  .
--  자바최고점수 [xx] 오라클 최고점수 [xxx]

-- 3. 아래의 데이터를 처리하는  PL/SQL작성
--    "이름, 주민번호, 나이, 성별"을 저장할 수 있는 테이블을
--    생성하고 아래의 데이터를 채운다.
--   김정운, 880101-1234567
--   김희철, 890101-1234567
--   이재찬, 011231-3234567
--   박영민, 920101-2234567
--   정택성, 020420-4234567
--   위의 데이터를 사용하여
--   번호,주민번호,나이, 성별을 보여주는  PL/SQL을 작성하세요.


--set verify off /* 프롬프트 사용안하므로 주석처리 */
set serveroutput on
declare
	-- 1번 문제 ----------------------------------------------------------------
	type stu_record is record(
	num number,
	name varchar2(30),
	addr varchar2(35),
	km number,
	traffic varchar2(9)
	);
	type stu_table is table of stu_record index by binary_integer;
	class4_tab stu_table;

	traf number;
	addtax number;
	-- 1번 문제 끝 -------------------------------------------------------------
	-- 2번 문제 ----------------------------------------------------------------
	type stu_record2 is record(
	num number,
	name varchar2(30),
	o_score number,
	j_score number
	);
	type stu_table2 is table of stu_record2 index by binary_integer;
	class4_tab2 stu_table2;
	total number;
	o_high number;
	j_high number;
	-- 2번 문제끝 -------------------------------------------------------------
	-- 3번 문제 ----------------------------------------------------------------
	type people_record is record(
	name varchar2(30),
	ssn char(14),
	age number(3),
	gen char(6)
	);
	type people_tab is table of people_record index by binary_integer;
	people people_tab;
	-- 3번 문제끝 -------------------------------------------------------------
begin
	dbms_output.put_line('=============================================================================');
	-- 1번 문제 ----------------------------------------------------------------
	class4_tab(1).num := 1;
	class4_tab(1).name := '김정운';
	class4_tab(1).addr := '서울시 강남구 역삼동';
	class4_tab(1).km := 5;
	class4_tab(1).traffic := '버스';

	class4_tab(2).num := 2;
	class4_tab(2).name := '김희철';
	class4_tab(2).addr := '인천시 남동구 구월동';
	class4_tab(2).km := 20;
	class4_tab(2).traffic := '지하철';

	class4_tab(3).num := 3;
	class4_tab(3).name := '이재찬';
	class4_tab(3).addr := '인천시 부평구 부평동';
	class4_tab(3).km := 16;
	class4_tab(3).traffic := '지하철';

	class4_tab(4).num := 4;
	class4_tab(4).name := '박영민';
	class4_tab(4).addr := '서울시 관악구 봉천동';
	class4_tab(4).km := 10;
	class4_tab(4).traffic := '지하철';

	class4_tab(5).num := 5;
	class4_tab(5).name := '정택성';
	class4_tab(5).addr := '서울시 동대문구 동대문동';
	class4_tab(5).km := 8;
	class4_tab(5).traffic := '버스';

	traf := 0;
	addtax := 0;
	for i in 1 .. class4_tab.count loop
		if class4_tab(i).traffic = '버스' then traf := 1200;
		elsif class4_tab(i).traffic = '지하철' then traf := 1250; end if;

		if class4_tab(i).km > 10 then
		addtax := substr(((class4_tab(i).km - 10) / 4), 1, 1) * 100;
		end if;

		dbms_output.put_line(class4_tab(i).num||',  '||class4_tab(i).name||',  '||class4_tab(i).addr||',      '||
		class4_tab(i).km||',  '||class4_tab(i).traffic||'  '||to_char(traf,'999,999')||'  '||to_char(traf+addtax, '999,999'));
		addtax := 0;
    end loop;

	-- 1번 문제 끝 -------------------------------------------------------------

	dbms_output.put_line('=============================================================================');


	-- 2번 문제 ----------------------------------------------------------------
		class4_tab2(1).num := 1;
		class4_tab2(1).name := '김정운';
		class4_tab2(1).o_score := 80;
		class4_tab2(1).j_score := 81;
		class4_tab2(2).num := 2;
		class4_tab2(2).name := '김희철';
		class4_tab2(2).o_score := 94;
		class4_tab2(2).j_score := 80;
		class4_tab2(3).num := 3;
		class4_tab2(3).name := '이재찬';
		class4_tab2(3).o_score := 97;
		class4_tab2(3).j_score := 96;
		class4_tab2(4).num := 4;
		class4_tab2(4).name := '박영민';
		class4_tab2(4).o_score := 86;
		class4_tab2(4).j_score := 92;
		class4_tab2(5).num := 5;
		class4_tab2(5).name := '정택성';
		class4_tab2(5).o_score := 76;
		class4_tab2(5).j_score := 99;

	total := 0;
	o_high := class4_tab2(1).o_score;
	j_high := class4_tab2(1).j_score;
	for idx in 1 .. class4_tab2.count loop
		total := total + class4_tab2(idx).o_score + class4_tab2(idx).j_score;
		dbms_output.put_line(class4_tab2(idx).num||'  '||class4_tab2(idx).name||'  '||class4_tab2(idx).o_score||'  '||
		class4_tab2(idx).j_score||'  '||total||'  '||(total/2));
    	total := 0;

    	if o_high < class4_tab2(idx).o_score then o_high := class4_tab2(idx).o_score; end if;
    	if j_high < class4_tab2(idx).j_score then j_high := class4_tab2(idx).j_score; end if;
	end loop;
	dbms_output.put_line('자바최고 점수['|| j_high ||'] 오라클 최고 점수['|| o_high ||']');
	-- 2번 문제끝 -------------------------------------------------------------
	dbms_output.put_line('=============================================================================');
	-- 3번 문제 ----------------------------------------------------------------
	people(1).name := '김정운';
	people(1).ssn := '880101-1234567';
	people(2).name := '김희철';
	people(2).ssn := '890101-1234567';
	people(3).name := '이재찬';
	people(3).ssn := '011231-3234567';
	people(4).name := '박영민';
	people(4).ssn := '920101-2234567';
	people(5).name := '정택성';
	people(5).ssn := '020420-4234567';


	for pnum in 1 .. people.count loop
		if substr(people(pnum).ssn, 8, 1) = 3 or substr(people(pnum).ssn, 8, 1) = 4 then
		people(pnum).age := to_number(to_char(sysdate, 'yyyy')) - (2000 + to_number(substr(people(pnum).ssn, 1, 2))) + 1;
		else people(pnum).age := to_number(to_char(sysdate, 'yyyy')) - (1900+ to_number(substr(people(pnum).ssn, 1, 2)))+ 1	;
		end if;
		
		if substr(people(pnum).ssn, 8, 1) in ('1', '3') then people(pnum).gen := '남자';
		elsif substr(people(pnum).ssn, 8, 1) in ('2', '4') then people(pnum).gen := '여자'; end if;

		dbms_output.put_line(people(pnum).name||', '||people(pnum).ssn||', '||people(pnum).age||'살, '||people(pnum).gen);
	end loop;
	-- 3번 문제끝 -------------------------------------------------------------
end;
/

