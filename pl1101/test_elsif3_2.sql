set verify off
set serveroutput on

accept score prompt '점수를 입력하세요 : '
declare
	u_score number := &score;
begin
	if u_score >=0 and u_score <= 100 then
		if u_score <= 40 then dbms_output.put_line('과락');
		elsif u_score >=41 and u_score <=60 then dbms_output.put_line('다른과목 참조');
		elsif u_score >= 61 and u_score <= 100 then dbms_output.put_line('합격');	
		end if; 
	else 
		dbms_output.put_line('점수는 0~100사이만 입력해 주세요.');
	end if;
end;
/        