-- 점수를 입력받아 0~100 사이일 때 점수 계산, 0~100사이가 아니라면
-- '입력 실패'를 출력한다.
-- 0~100 사이일 떄 0~40 사이 : '과락'          
set verify off
set serveroutput on

accept score prompt '점수 입력 : '
declare
 	score number := &score;
begin	
	if score between 0 and 100 then
		if score <= 40 then 
			dbms_output.put_line('과락 OTL');
		elsif score <=60 then 
			dbms_output.put_line('다른 과목 참조');
		else 
			dbms_output.put_line('합격'); 
		end if;
	else
	dbms_output.put_line('점수는 0~100사이만 입력해 주세요.');
	end if;	
end;
/