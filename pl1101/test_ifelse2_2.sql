-- 고객등급, 상품명, 가격을 입력 받아 처리하는 PL/SQL 작성
-- 출력은 고객등급이 '특별' 또는 '일반'인 경우에만 연산을 수행
-- 특별고객은 상품할인을 상품가에 50%, 일반고객은 상품할인을
-- 상품가의 30%로 계산하여 출력

set verify off
set serveroutput on

accept grade prompt '고객등급 : '
accept item_name prompt '상품명 : '
accept price prompt '가격 : '

declare
	grade char(6) := '&grade';
	item_name varchar(60) := '&item_name';
	price number := &price;
	sale number;
begin
	if grade in('특별', '일반') then
		if grade = '특별' then
		    sale := price-price*0.5;
		else 
		    sale := price-price*0.3;		
		end if;
		dbms_output.put_line(grade||'고객님 구매하신 상품 '||item_name||'이고 정상가 '||price||'원이며 할인가 '||(sale)||'원 입니다.');
	end if;
end;
/
