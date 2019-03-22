-- package body 정의 : 업무 구현
create or replace package body test_pack
is  
	------------------------- get_name function 시작 -----------------
	function get_name(name varchar2) return varchar2
	is
	begin
		return to_char(sysdate, 'day')||' 입니다. '||name||'님 안녕하세요';
	end get_name; /* end 옆에 함수명을 적어줘도 되고 안적어도 된다. */
	------------------------- get_name function 끝 --------------------
	
	------------------------- get_age procedure 시작 -----------------
	procedure get_age(birth_year in number, age out number)
	is
	begin
		age := to_char(sysdate, 'yyyy') - birth_year+1;		
	end get_age; /* end 옆에 프로시저명을 적어줘도 되고 안적어도 된다.*/
	------------------------- get_age procedure 끝 --------------------
end;
/
