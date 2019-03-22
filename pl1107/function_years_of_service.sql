create or replace function years_of_service(hiredate number) return char
is  
	msg char(12) := '단기근속';
--	change_date char(4) := to_char(sysdate,'yyyy');
	
begin
	if to_char(sysdate,'yyyy') - hiredate >= 10 then msg := '장기근속'; end if;
    return msg;
end;
