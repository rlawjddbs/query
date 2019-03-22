create or replace package ssn_pack
as
	-- 주민등록번호를 생성하는 프로시저
	-- 생년월일, 성별, 지역을 입력받아 주민번호를 생성하여
	-- out parameter에 설정하는 procedure
	procedure create_ssn(birth char, gen char, loc varchar2, ssn out char);
	
end;
/
