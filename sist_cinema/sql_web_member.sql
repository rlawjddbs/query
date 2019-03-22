create table web_member(
id	varchar2(20) constraint pk_web_member primary key		,
pass	varchar2(200)		not null,
name	varchar2(60)		not null,
ssn	varchar2	(200)		not null,
gender	varchar2(6)		not null,
birth	varchar2(10)		not null,
age	number(3)		not null,
marriage	char(6)		not null,
marriage_date	varchar2(10)		null,
zipcode	char(5)		not null,
addr1	varchar2(300)		not null,
addr2	varchar2(300)		not null,
greeting	varchar2(4000)		not null,
intput_date	date	default sysdate,
ip_address	varchar2(15)		not null
);

create table web_lang(
id	varchar2(20) constraint fk_web_lang_id references web_member(id),
lang	varchar2(7)		not null
);

select * from web_lang;
select * from web_member;
