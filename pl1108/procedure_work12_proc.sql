create or replace procedure work12_proc(const in varchar2, result out varchar2)
is
	cursor cur_cons is 
		select uc.constraint_name, ucc.column_name, utc.data_type
		from user_constraints uc, user_cons_columns ucc, user_tab_columns utc
		where ((uc.constraint_name = ucc.constraint_name and ucc.column_name = utc.column_name) and 
		(uc.table_name = utc.table_name)) and uc.table_name=const;

	type rec_cons is record(
		a user_constraints.constraint_name%type,
		b user_cons_columns.column_name%type,
		c user_tab_columns.data_type%type
	);
	cons_data rec_cons;
	
	type tab_cons is table of rec_cons index by binary_integer;
	arr_cons tab_cons;	
	
	i number := 0;
begin
	if cur_cons%isopen then
		close cur_cons;
	end if;
	
	open cur_cons;
	
	loop
		i := i + 1;
		fetch cur_cons into cons_data;
		exit when cur_cons%notfound;
		arr_cons(i) := cons_data;
	end loop;
	
	for i in 1 .. arr_cons.count loop
		 result := '제약사항명 : '||arr_cons.a||', 컬럼명 : '||arr_cons.b||', 데이터형 : '||arr_cons.c;
	end loop;

end;
/
