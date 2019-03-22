-- 주민번호의 유효성 검증
-- 각 자리에 2,3,4,5,6,7,8,9,2,3,4,5 를 곱한 값을 더해서
-- 11로 나눈 나머지를 구하고 11에서 뺀값을 10으로 나눈
-- 나머지를 구해 그 값이 주민번호의 마지막 숫자와 같다면 유효 | 무효
create or replace function valid_ssn(ssn char)
return varchar2
is
	result_msg varchar2(6) := '무효';
	temp_val number := 0;				-- 연산결과를 저장할 변수
	flag_num char(1);						-- 주민번호의 끝자리
	idx number := 2;
	
	temp_ssn char(12);
begin
	if check_ssn(ssn) = 'success' then
		-- 880101-1234567
		temp_ssn := substr(ssn, 1, 6)||substr(ssn, 8, 6);
		flag_num := substr(ssn, 14, 1);
        -- temp_ssn 880101123456
		for i in 1 .. length(temp_ssn) loop
			temp_val := temp_val + substr(temp_ssn, i, 1) * idx;
			idx := idx + 1;
		if idx = 10 then idx := 2; end if;
		
		end loop;
		
		temp_val := mod(11-mod(temp_val, 11), 10);
		if temp_val = flag_num then
			result_msg := '유효';
		end if;
	end if;
	return result_msg;
end;
/
