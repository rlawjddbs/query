/* 도시락 코드를 "L_000001" 로 반환하는 함수 */
create or replace function lunch_code
return char
is
     
begin
   return concat('L_', lpad(seq_lunch.nextval, 6, 0));
end;
/
