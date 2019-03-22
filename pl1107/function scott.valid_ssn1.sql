--	* function - 주민번호 유효성 검증
--	* 880101-1234567

--	1. 234567 892345 를 각 자리수마다 곱해준다. 검증코드 연산식.
--	2. 000000 000000 로 곱해준 결과의 값을 모두 더해준다.
--	3. 다 더해준 뒤의 값을 11로 나눈 뒤 나머지를 구한다.
--	4. 나온 결과를 11에서 뺀다.
--	5. 뺀 결과를 10으로 나눈 나머지를 구한다.
--	6. 주민번호의 끝자리와 같은지 비교하여
--	7. 같으면 유효, 같지 않으면 무효
-- 121212-1234567 을 대입 했을 때 유효가 나오면 맞고 무효가 나오면 잘못된 것.
create or replace function valid_ssn1(ssn char)
return char
is
	result_msg char(6) := '무효';
	init_num number := 2;
	op_num number;	
	total_num number := 0;
begin
	if length(ssn) = 14 and instr(ssn, '-') = 7 then
		for i in 1 .. 13 loop
			continue when i = 7;
--			exit when i = 14;						
			
			op_num := 0;
			op_num := op_num + substr(ssn, i, 1)	* init_num;
			init_num := init_num + 1;
			if init_num = 10 then init_num := 2; end if;
			total_num := total_num + op_num;			
		end loop;	
		if mod((11 - mod(total_num, 11)), 10) = substr(ssn, 14, 1) then result_msg := '유효'; end if;
	end if;
--   		result_msg := '유효';
		
	
   return result_msg;
end;
/
