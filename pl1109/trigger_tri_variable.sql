-- trigger1 테이블에서 레코드가 추가되면
-- trigger2 테이블에 이름과 class4_info 테이블의
-- 번호가 99번인 학생의 나이로 추가              
create or replace trigger tri_variable
after insert on trigger1
for each row

declare
	age number;
begin
	
	select		age
	into		age
	from 		class4_info
	where		num=99;
	
	insert into trigger2(name, age) values(:new.name, age);
end;
/
