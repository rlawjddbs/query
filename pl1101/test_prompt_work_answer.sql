set verify off
set serveroutput on

accept name prompt '이름입력 : '
accept age prompt '나이입력 : '

declare
	input_data ref_tab%rowtype;
begin
	-- 사용자가 입력한 값이 문자열 데이터일 경우 작은 따옴표 ' 로 감싸주고
	-- 숫자일 경우에는 앰퍼샌드만 앞에 붙여주면 된다.
	input_data.name := '&name';
	input_data.age := &age;
	
	dbms_output.put_line('이름 : '||input_data.name||'님 나이: '||input_data.age||'살');
	dbms_output.put_line('작년나이 '||(input_data.age-1)||'살, 내년나이 : '||(input_data.age+1)||'살');
end;
/