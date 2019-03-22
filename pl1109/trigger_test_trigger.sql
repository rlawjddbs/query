-- trigger1 테이블을 감시하는 trgiger
create or replace trigger test_trigger
after insert or delete or update on trigger1
for each row

begin
	dbms_output.put_line('감시중 ');
	dbms_output.put_line('이전값 : '|| :old.name||'  '||:old.age);
	dbms_output.put_line('새로운값 : '|| :new.name||'  '||:new.age);	
end;
/
