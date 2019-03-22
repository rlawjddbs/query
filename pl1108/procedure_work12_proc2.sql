create or replace procedure work12_proc2(const in varchar2, result1 out varchar2, result2 out varchar2, result3 out varchar2)
is
	i number := 0;
begin
	select uc.constraint_name, ucc.column_name, utc.data_type
	into result1, result2, result3
	from user_constraints uc, user_cons_columns ucc, user_tab_columns utc
	where ((uc.constraint_name = ucc.constraint_name and ucc.column_name = utc.column_name) and 
	(uc.table_name = utc.table_name)) and uc.table_name=const;
	
	exception
	when others then
    dbms_output.put_line('error message -> ' ||SQLERRM);
end;
/
