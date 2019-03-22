--숙제1.
--제조사를 두개 입력받아 제조사에 해당하는 모든 차량의
-- 제조국, 제조사,모델명,년식,가격, 입력일을 조회 하세요.
-- 출력은 가격의 오름차순으로 조회하였을 때 조회된 결과에
--   3~6번째 레코드만  출력하세요.
--
--현대, 기아를 입력하였을 때
-- 출력 예
-------------------------------------------------------------------
--번호 제조국  제조사  모델명  년식  가격   입력일
-------------------------------------------------------------------
--1     국산     현대    아반테  2001  3,500 mm-dd-yyyy
--
--
-------------------------------------------------------------------
--검색 결과 현대 [x]대, 기아 [x]대
--
--현대 x대와 기아 x대는 검색 결과에 나온 대수만 카운트 합니다.

set verify off
set serveroutput on

accept maker1 prompt '제조사 1 : '
accept maker2 prompt '제조사 2 : '
declare
	type rec_maker is record(
		country car_country.country%type,
		maker car_country.maker%type,
		model car_maker.model%type,
		car_year car_model.car_year%type,
		price car_model.price%type,
		hiredate car_model.hiredate%type
	);
	type tab_maker is table of rec_maker index by binary_integer;
	arr_maker tab_maker;

	search_cnt number := 0;
	i number := 0;
	mi1 number :=0;
	mi2 number := 0;
begin
	for temp in (
		select	cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.hiredate
		from	car_country cc, car_maker cma, car_model cmo
		where (cma.maker = cc.maker and cma.model = cmo.model) and (cc.maker = '&maker1' or cc.maker = '&maker2')
		order by cmo.price asc
		)
	loop
		i := i + 1;
		arr_maker(i) := temp;
	end loop;

	if arr_maker.count > 0 then
		dbms_output.put_line('-------------------------------------------------------------------');
		dbms_output.put_line('번호 제조국  제조사  모델명  년식  가격   입력일 ');
		dbms_output.put_line('-------------------------------------------------------------------');

		for i in 1 .. arr_maker.count loop
			if i between 3 and 6 then
				dbms_output.put_line(to_char(i,'99')||'   '||arr_maker(i).country||'    '||arr_maker(i).maker||'    '||arr_maker(i).model||'  '||arr_maker(i).car_year||'  '||
				to_char((arr_maker(i).price),'999,999')||'  '||
				to_char((arr_maker(i).hiredate),'mm-dd-yyyy'));
				if arr_maker(i).maker = '&maker1' then
				mi1 := mi1 + 1;
				end if;
				if arr_maker(i).maker = '&maker2' then
				mi2 := mi2 + 1;
				end if;			
			end if;
		end loop;
		dbms_output.put_line('-------------------------------------------------------------------');
		dbms_output.put_line('검색된 결과 '||'&maker1'||'['||mi1||']대, '||'&maker2'||' ['||mi2||']대');
--		dbms_output.put_line('&maker1'||' 총 대수 : '||mi1);
--		dbms_output.put_line('&maker2'||' 총 대수 : '||mi2);
		
	else
		dbms_output.put_line('검색결과가 없습니다.');
	end if;
end;
/
