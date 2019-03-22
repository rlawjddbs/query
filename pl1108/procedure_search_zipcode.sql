-- 동이름을 입력받아 우편번호 테이블에 주소 검색하는 Procedure
-- 단, 우편번호의 오름차순으로 정렬했을 때 가장 먼저 조회되는
-- 우편번호, 시도, 구군, 동, 번지를 묶어서 out parameter에 할당하고,
-- 조회된 우편번호의 건수를 out parameter에 할당 할 것.

create or replace procedure search_zipcode
	(i_dong varchar2, address out varchar2, search_cnt out number)
is
	-- 1. 선언
	cursor cur_zipcode is
		select		zipcode, sido, gugun, dong, nvl(bunji, '번지없음') as bunji
		from		zipcode
		where		dong like i_dong||'%'
		order by  zipcode asc;
		
	type rec_zip is record(
		-- 변수명이 테이블명..컬럼명과 같다면 인식에 대한 bug가 
		-- 발생할 수 있다.
		zip char(7),
		-- 위에 선언된 변수가 테이블명과 같다면 테이블을
		-- 참조하지 못하게 될 수도 있다.
		sido zipcode.sido%type,
		gugun zipcode.gugun%type,
		dong zipcode.dong%type,
		bunji zipcode.bunji%type
	);
	-- 인출한 데이터를 저장할 record 변수
	zip_data rec_zip;
	-- 가장 처음 레코드를 저장할 record 변수
	first_data rec_zip;
	-- 같은 동의 건수를 저장할 변수 cnt 선언
	cnt number;
begin
	-- 2. 열기
	if cur_zipcode%isopen then
		close cur_zipcode;
	end if;
	
	open cur_zipcode;
	
	--3. 인출 
	cnt := 0;
	loop
		fetch cur_zipcode into zip_data;
		exit when cur_zipcode%notfound;
		cnt := cnt+ 1;
		
		if cnt = 1 then
			first_data := zip_data;
		end if;
	end loop;
	
	-- 조회된 우편번호의 건수를 search_cnt 변수에 할당한다.
	search_cnt := cur_zipcode%rowcount;
	if search_cnt != 0 then
		address := first_data.zip||'  '||first_data.sido||'  '||
					  first_data.gugun||'  '||first_data.dong||'  '||
					  first_data.bunji;
	else
		address := i_dong||'은 존재하지 않습니다.';
	end if;
	--4. 커서 닫기
		close cur_zipcode;
			
	exception
	when invalid_cursor then
		address := '커서가 잘못된 연산을 수행.';
	when others then
		address := sqlerrm;
	
end;
/
