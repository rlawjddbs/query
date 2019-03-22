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
accept u_model prompt '검색하실 차 모델을 입력해주세요 : '

declare
	cursor cur_cmo is
		select car_year, price, hiredate, car_option
		from car_model
		where model = '&u_model'
		order by price asc;
	
	type rec_cmo is record(
		rcar_year car_model.car_year%type,
		rprice car_model.price%type,
		rhiredate car_model.hiredate%type,
		rcar_option car_model.car_option%type
	);
	cmo_data rec_cmo;
	
	type tab_cmo is table of rec_cmo index by binary_integer;
	arr_cmo tab_cmo;
	
	i number := 1;
begin
	if cur_cmo%isopen then close cur_cmo; end if;
	open cur_cmo;
	
	loop
		fetch cur_cmo into cmo_data;
		exit when cur_cmo%notfound;
		arr_cmo(i) := cmo_data;
		i := i + 1;	
	end loop;   
	
	if arr_cmo.count != 0 then
		dbms_output.put_line('------------------------------');
		dbms_output.put_line('&u_model'||'모델 검색 결과 입니다.');
		dbms_output.put_line('---------------------------------------------------------');
 		dbms_output.put_line('년식       가격      입력일     옵션');
		dbms_output.put_line('---------------------------------------------------------');
		for indx in 1 .. arr_cmo.count loop
			dbms_output.put_line(arr_cmo(indx).rcar_year||'     '||to_char((arr_cmo(indx).rprice),'99,999')||'     '||to_char((arr_cmo(indx).rhiredate),'yy-mm-dd')||'   '||
			nvl((substr((arr_cmo(indx).rcar_option), 1, instr((arr_cmo(indx).rcar_option), ','))),'옵션없음'));
		end loop;
		dbms_output.put_line('---------------------------------------------------------');
	else 
	dbms_output.put_line('---------------------------------------------------------');
	dbms_output.put_line('죄송합니다. '||'&u_model'||'은 없는 모델입니다.'); 
	dbms_output.put_line('---------------------------------------------------------');
	end if;
	close cur_cmo;
end;
/
