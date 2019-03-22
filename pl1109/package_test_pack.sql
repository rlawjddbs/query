-- 패키지 헤더 : 패키지에 들어갈 함수, 프로시저의 목록 정의(업무 구현x)
create or replace package test_pack
as
	function get_name(name varchar2) return varchar2;
	procedure get_age(birth_year in number, age out number);
end;
/
