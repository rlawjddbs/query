--	숙제
--	1. 차량 모델을 입력받아 car_model 테이블에서
--	년식, 가격, 옵션, 입력일을 조회하세요.
--  출력은
--	xxxx모델 검색 결과
------------------------------------------------------------------------------
--	년식	가격 		입력일	 			옵션
------------------------------------------------------------------------------
-- 2010	1,990 		월-일-년 분기	처음 , 까지만
------------------------------------------------------------------------------
-- 검색 대수 [x] 대

-- (여기서 년은 2자리만 조회,
-- 가격의 오름차순 정렬하여 조회,
-- 커서, 레코드, 테이블을 모두 사용하여 출력)

set verify off
set serveroutput on
accept u_car_model prompt '차량 모델 : '

declare
	-- 1. 커서 선언
   cursor cur_cars is
	   select 	car_year, to_char(price, '999,999,999'), substr(car_option, 1, instr(car_option, ',')), to_char(hiredate, 'mm-dd-yy')
	   from	car_model
	   where	model = '&u_car_model'
	   order by price asc;
	-- 2. 레코드 선언
	type rec_cars is record (
		rcar_year car_model.model%type,
		rprice varchar2(50),
		rcar_option car_model.car_option%type,
--		rinput_date car_model.inut_date%type
		rinput_date varchar2(8)
		);
	-- 3. 테이블 생성
	type tab_cars is table of rec_cars index by binary_integer;
	-- 4. 생성된 테이블 변수에 담기
	arr_cars tab_cars;
	-- 5. 생성한 레코드(2번)를 변수에 담기
	cars_data rec_cars;

	i number := 0;

	bungi number;
begin
	-- 5. 커서 열기
	if  cur_cars%isopen then
		close cur_cars;
	end if;
	open cur_cars;

	-- 6. 인출
	loop
		fetch cur_cars into cars_data;
		exit when cur_cars%notfound;
	-- 6-1. 데이터 처리
		i := i + 1;
		arr_cars(i) := cars_data;
	end loop;

	bungi := 0;
	if arr_cars.count != 0 then
		dbms_output.put_line('--------------------------------------------------------------------------------');
		dbms_output.put_line('&u_car_model'||'모델 검색결과');
		dbms_output.put_line('--------------------------------------------------------------------------------');
		dbms_output.put_line('년식	가격 		입력일	 			옵션');
		dbms_output.put_line('--------------------------------------------------------------------------------');
		for idx in 1 .. arr_cars.count loop
			if arr_cars(idx).rinput_date like '01%' or arr_cars(idx).rinput_date like '02%' or arr_cars(idx).rinput_date like '03%' then bungi := 1;
			elsif arr_cars(idx).rinput_date like '04%' or arr_cars(idx).rinput_date like '05%' or arr_cars(idx).rinput_date like '06%' then bungi := 1;
			elsif arr_cars(idx).rinput_date like '07%' or arr_cars(idx).rinput_date like '08%' or arr_cars(idx).rinput_date like '09%' then bungi := 1;
			elsif arr_cars(idx).rinput_date like '10%' or arr_cars(idx).rinput_date like '11%' or arr_cars(idx).rinput_date like '12%' then bungi := 1;
			end if;
			dbms_output.put_line(arr_cars(idx).rcar_year||'  '||arr_cars(idx).rprice||'            '||arr_cars(idx).rinput_date||' '||bungi||'분기                    '||arr_cars(idx).rcar_option);
		end loop;
		dbms_output.put_line('--------------------------------------------------------------------------------');
		dbms_output.put_line('검색 대수 ['||arr_cars.count||']대');
		dbms_output.put_line('--------------------------------------------------------------------------------');
	end if;


end;
/
