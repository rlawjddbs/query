create or replace procedure lunch_order_select( 
		i_order_name in varchar2, i_phone in varchar2,
		cur_order_list out sys_refcursor)
is
	
begin
	open 		cur_order_list for
	select		l.lunch_name, to_char(o.order_date,'yyyy-mm-dd day hh24:mi:ss') order_date, o.quan
	from		ordering o, lunch l
	where		o.lunch_code = l.lunch_code and 
				o.order_name = i_order_name and o.phone = i_phone
	order by	o.order_date desc;
	
end;
/
