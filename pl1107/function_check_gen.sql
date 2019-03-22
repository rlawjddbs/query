--2.  주민번호를 입력받아 성별을 반환하는 함수 작성

create or replace function check_gen(ssn char) return varchar2
is
	gen varchar2(45) := '주민번호 뒷자리가 유효하지 않음';
begin
	if  length(trim(ssn)) = 14 and instr(ssn, '-') = 7 then
		if substr(ssn, 8, 1) in (1, 3, 5, 7) then gen := '남성';
		elsif substr(ssn, 8, 1) in (2, 4, 6, 8) then gen := '여성';
		end if;	
	end if;
	return gen;
end;
/
