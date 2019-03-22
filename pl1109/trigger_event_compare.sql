-- triggering event 비교
create or replace trigger event_compare
after insert or update or delete on trigger1
for each row
--	num number;
-- 트리거 안에서는 변수를 만들 수 없다.
-- 트리거 안에서 변수를 만들고 싶다면 declare 를 사용할 것.
--declare
--	num number;
begin
	if inserting then
--		dbms_output.put_line('추가 작업 발생');
		-- trigger1 테이블에 추가된 이름, 나이+1 의 값을 trigger2 테이블에 추가
		insert into trigger2(name, age) values(:new.name, :new.age+1); 
--		commit;
		-- commit; trigger에서는 transaction 명령을 사용할 수 없다.
	end if; 
	
	if updating then
--		dbms_output.put_line('변경 작업 발생');
		--trigger1 테이블에서 변경작업이 발생하면
		--trigger1 테이블의 이전 이름과 나이를 trigger2 테이블에 추가
		insert into trigger2(name, age) values(:old.name, :old.age);
	end if;
	
	if deleting then
--		dbms_output.put_line('삭제 작업 발생');
		-- trigger1 테이블에서 삭제작업이 발생하면
		-- trigger2 테이블에서 같은 이름의 모든 레코드를 삭제
		delete from trigger2 where name=:old.name;
	end if;
end;
/
