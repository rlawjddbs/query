-- 이름 나이를 입력받아 ref_tab 테이블을 참조하여 생성한
-- 변수(record 변수)에 값을 입력한 후 아래와 같이 출력하는
-- PL/SQL을 생성하세요.
-- 출력 ) 이름 : xxx님 나이 : xx 살 
-- ( 작년나이 xx살, 내년나이 : xx살)

set serveroutput on
set verify off
accept your_name 	prompt '이름을 입력하세요 : '
accept your_age	prompt '나이를 입력하세요 : '

declare
 -- 테이블의 컬럼을 참조하여 변수 선언
	r_name_age ref_tab%rowtype;

begin
	r_name_age.name := '&your_name';
	r_name_age.age := &your_age;
	
	dbms_output.put_line('이름 : '||r_name_age.name||'님 나이 : '||r_name_age.age||' 살');
	dbms_output.put_line('작년나이 '||(r_name_age.age-1)||'살 , 내년나이 : '||(r_name_age.age+1)||'살');
end;
/