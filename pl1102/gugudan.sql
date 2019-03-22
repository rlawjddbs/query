set serveroutput on
declare

begin
	-- for 문 내의 for 문이 먼저 반복된 후 바깥의 for문이 반복된다.
	for i in 2 .. 9 loop
		for z in 1 .. 9 loop
			dbms_output.put_line(i||' * '||z||' = '||(i*z));
		end loop;
	end loop;

end;
/