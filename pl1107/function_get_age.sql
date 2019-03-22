-- 입력된 주민번호에서 나이를 구하는 함수
-- 880101-1234567
-- 현재년도 - 태어난해 + 1

create or replace function get_age(ssn char)
return number
is
	age number := 0;
	b_year varchar2(4);
	flag char(1);
begin
	if check_ssn(ssn) = 'success' then
		-- 19를 더할지 20을 더할지 판단
		flag := substr(ssn, 8, 1);
		
		if flag in(1,2,5,6) then
			b_year := '19'||substr(ssn, 1, 2);
		elsif flag in (3, 4, 7, 8) then
			b_year := '20'||substr(ssn, 1, 2);		
		else
		    b_year := '18'||substr(ssn, 1, 2);
		end if;
		
		age := to_char(sysdate,'yyyy') - b_year + 1;
	end if;
	return age;
end;
/
