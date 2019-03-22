-- 다중 if (else~if)
-- 점수를 입력받아 점수가 0보다 작은 경우 '보다 작아 실패'
-- 100보다 큰 경우 '100보다 커서 실패' 그렇지 않으면 '성공' 출력
-- PL/SQL 작성
-- else if 가 아니라 elsif 로 작성해야 한다.
set verify off
set serveroutput on
	accept score prompt '점수를 입력하세요 : '
declare
	score number := &score;
begin
	dbms_output.put_line(score);
	if score < 0 then
		dbms_output.put_line(' 점은 0보다 작아서 실패');
	elsif score > 100 then
		dbms_output.put_line(' 점은 100보다 커서 실패');
	else
		dbms_output.put_line(' 점은 입력 성공 o(^^O)(O^^)o');
	end if;
end;
/