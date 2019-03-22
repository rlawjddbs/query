-- 점수를 입력받아 판정 내리기.
-- 다중 if (else~if)
-- 점수를 입력받아 점수가 0보다 작은 경우 '보다 작아 실패'
-- 100보다 큰 경우 '100보다 커서 실패' 그렇지 않으면 '성공' 출력
-- PL/SQL 작성

set verify off
set serveroutput on
 
accept score prompt '점수 : '
declare
	u_score number := &score;
begin
	if u_score between 0 and 100 then dbms_output.put_line('성공, 당신의 점수는 '||u_score||'점 입니다.');
	elsif u_score < 0 then dbms_output.put_line('실패, 0점 미만입니다.');
	else dbms_output.put_line('실패, 100점 이상입니다.');
	end if;
end;
/
