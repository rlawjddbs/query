set verify off
set serveroutput on

accept grade prompt '고객 등급 입력 : '
accept product prompt '상품명 입력 : '
accept price prompt '가격 입력(원) : '

declare
	grad char(6) := '&grade';
	prod varchar(60) := '&product';
	pric number := &price;  
begin
    if grad = '특별' then
    dbms_output.put_line(prod||' 상품의 정가는 '||to_char(pric, '99,999,999')||'원 이며 할인 된 가격은 '||to_char((pric-(pric * 0.5)), '99,999,999')||'원 입니다.');  
    end if;
    if grad = '일반' then
    dbms_output.put_line(prod||' 상품의 정가는 '||to_char(pric, '99,999,999')||'원 이며 할인 된 가격은 '||to_char((pric-(pric * 0.3)), '99,999,999')||'원 입니다.'); 
    end if;   
end;
/