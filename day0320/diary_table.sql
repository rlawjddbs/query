create table diary(
	num number,
	writer varchar2(60) not null,
	subject varchar2(1000) not null,
	contents clob not null,
	e_year char(4) not null,
	e_month varchar2(2) not null,
	e_day varchar2(2) not null,
	w_date date default sysdate,
	pass varchar2(300) not null,
	ip varchar2(15) not null,
	constraint pk_diary primary key(num)
);

create sequence seq_diary
increment by 1
start with 1
maxvalue 999999999999999;

