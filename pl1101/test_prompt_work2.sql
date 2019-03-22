-- * 상품명, 고객등급(특별, 일반), 가격을 입력받아 고객등급이 '특별' 이라면
-- 상품가격의 30% 할인된 가격으로 출력하세요.
-- xx등급 고객님 xxx상품의
-- 정가는 xx원 입니다.
-- "특별인 경우에는 아래의 메세지 출력
-- 상품가격 xx원 할인가 xx원

set serveroutput on
set verify off

accept product prompt '상품명 입력 : '
accept grade prompt '등급 입력 : '
accept price prompt '가격 입력(원) : '
                                                         
declare
	prod	varchar2(60) := '&product';
	grad	char(6) := '&grade';
	pric	number := &price;
begin

	dbms_output.put_line(grad||'등급 고객님 '||prod||'상품의');
	dbms_output.put_line('정가는 '||to_char(pric, '99,999,999')||'원 입니다.');
	if grad = '특별' then
	dbms_output.put_line(prod||' 상품가격 '||to_char(pric, '99,999,999')||'원 할인가 '||to_char((pric - (pric * 0.3)),'99,999,999')||'원');
	end if;
end;
/