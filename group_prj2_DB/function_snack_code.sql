/* 스낵 코드를 "SOR_01281901" 로 반환하는 함수 */
create or replace function snack_code
return char
is
     
begin
   return concat('SOR_', concat(to_char(sysdate,'mmddyy'), lpad(seq_snack.nextval, 2, MEMBER_ID)));
end;
/
