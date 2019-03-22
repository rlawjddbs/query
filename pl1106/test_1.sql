/*
차량 모델을 입력받아 car_model 테이블에서
제조국, 제조사, 년식, 가격, 옵션, 입력일 조회
*/

set verify off
set serveroutput on
	accept maker prompt '제조사   : '
declare
--번호 제조국  제조사  모델명  년식  가격   입력일
	type rec_car is record(
		country car_country.country%type,
		maker car_country.maker%type,
		model car_model.model%type,
		
		car_year car_model.car_year%type,
		price car_model.price%type,
		hiredate car_model.hiredate%type
		);
	-- 선언된 record 데이터형으로 table 선언
	type tab_car is table of rec_car index by binary_integer;
	-- 선언된 table로 table 변수 선언
	arr_car tab_car;
	
	-- 처음 ,까지만 출력하기 위해  옵션을 저장하는 변수 만들기
	-- 전체 검색 갯수를 저장하기 위한 변수
	cnt number := 0;
	 
	-- 인덱스를 저장하기 위한 변수
	i number := 0;
	j number := 0;
begin
	
	dbms_output.put_line('---------------------------------------------------------');
	dbms_output.put_line('제조국 제조사     년식  가격   입력일     옵션');
	dbms_output.put_line('---------------------------------------------------------');
	
	-- 검색된 결과를 table에 저장 (코드 분리) - 사용할 데이터 생성
	for temp in
		(select		cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.hiredate
		 from			car_country cc, car_maker cma, car_model cmo
		 where		(cma.maker=cc.maker and cma.model=cmo.model) and cma.maker = '&maker'
		 order by		cmo.price	)	
	loop   	   
		i := i+1;
	    arr_car(i) := temp;	 	
	end loop;
--		search_cnt := i;
	-- 생성된 데이터를 사용하여 출력 형식을 만들어 출력한다.
	
		for j in 1 .. arr_car.count loop
		
			if  j between 3 and 6 then
						dbms_output.put_line(j||arr_car(j).country ||'     '||arr_car(j).maker||'     '||arr_car(j).model||'  '||arr_car(j).car_year||' '||to_char((arr_car(j).price),'9,999')||'   '||to_char((arr_car(j).hiredate),'mm-dd-yy') ); 
						cnt := cnt+1;
			end if;
		end loop;
		
	dbms_output.put_line('---------------------------------------------------------');
	dbms_output.put_line(' 검색 대수 ['||cnt||']대');	
end;
/