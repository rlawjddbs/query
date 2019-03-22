-- 아이디, 이름, 비밀번호를 입력받아 TABLE_PRIMARY
-- 테이블에 삽입하는 PL/SQL 작성
set verify off
set serveroutput on 

accept name prompt '이름 : '
accept id prompt '아이디 : '
accept passwd prompt '비밀번호 : '

declare
	-- 변수 name에 담을 수 있는 값의 길이가 초과하면 이미 해당 변수에 담길 수 없는 값이란 것을 
	-- Error 로 출력하므로 name 변수에 바로 담지말고 데이터형만 정의한다.  
	name varchar2(30);
	id varchar2(30) := '&id';
	passwd varchar2(30) := '&passwd';
begin
	-- 문자열을 입력받아 입력받은 문자열의 길이가 저장할 수 있는
	-- 크기가 아니라면 "예외"로는 처리할 수 없고 코드로 처리해야 한다.
	if length('&name') > 10 then
		dbms_output.put_line('입력가능한 글자수를 초과하였습니다.(한글 최대 10자)');
	else
		name := '&name';
		
		insert into table_primary(name, id, passwd) values(name, id, passwd);
	    dbms_output.put_line(id||' 님의 정보를 추가하였습니다.');    
	    commit;
	    
	end if;
	
    exception
    when dup_val_on_index then 
    	dbms_output.put_line('입력하신 아이디 "'||id||'"는 이미 사용중입니다.');
    	-- 예외처리 객체가 제공하는 메세지 : sqlerrm
    	dbms_output.put_line(sqlerrm);
    	-- 예외처리 객체가 제공하는 에러코드 : sqlcode
    	dbms_output.put_line(sqlcode);
    -- 문자열 버퍼크기 오류는 예외의 상황으로 간주되지 않기 때문에 아래 코드는 실행되지 않는다.
    -- 문자열 버퍼크기 오류는 prompt 로 전달받을 값을 if문으로 잡아야 한다.
	--  when others then
    --  dbms_output.put_line('------------'||sqlcode);
end;
/