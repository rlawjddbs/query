/* 주문 코드를 "OR_000000001" 로 반환하는 함수 */
create or replace function order_code
return char
is
     
begin
   return concat('OR_', lpad(seq_order.nextval, 9, 0));
end;
/
