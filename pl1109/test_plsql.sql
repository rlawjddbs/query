
set serveroutput on
declare
	-- 테이블 생성후 테이블 자체에 값을 할당할 순 없다.
	-- 때문에 새로운 변수를 생성한 뒤 해당 변수에 테이블을 담아야 값을 할당할 수 있다.
	type tab_a is table of number(1) index by binary_integer;
	arr_a tab_a;
begin
	arr_a(1) := 1;
	arr_a(2) := 2;
	arr_a(3) := 3;
	arr_a(4) := 4;
	arr_a(5) := 5;

--	tab_a(1) := 1;
--	tab_a(2) := 2;
--	tab_a(3) := 3;
--	tab_a(4) := 4;
--	tab_a(5) := 5;
	dbms_output.put_line(arr_a(1)||arr_a(2)||arr_a(3)||arr_a(4)||arr_a(5));
--	dbms_output.put_line(tab_a(1)||tab_a(2)||tab_a(3)||tab_a(4)||tab_a(5));
end;
/
