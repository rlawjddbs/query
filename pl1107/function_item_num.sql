-- 매개변수 없는 함수 : 시퀀스를 사용하여 10자리의
-- 1씩 증가하는 고정길이형 문자열을 반환하는 함수
-- 고정길이의 형식은 'ITEM_00001'

create or replace function item_num
return char
is
	temp_num char(10);
	seq_num number;
	--
begin
	
--	select		seq_item.nextval
--	into		seq_num
--	from		dual;
	seq_num := seq_item.nextval;
	
	temp_num := concat('ITEM_',(lpad(seq_num, 5, 0)));    
	return temp_num;
end;
/
