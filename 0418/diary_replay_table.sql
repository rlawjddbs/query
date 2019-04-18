select * from diary;


create table diary_reply(
	num number,
	num_ref number,
	writer varchar2(30),
	content varchar2(600),
	input_date date,
	constraint pk_diary_reply primary key(num),
	constraint fk_num_ref foreign key(num_ref) references diary(num)
);

select * from diary
order by num desc;

---------------------- ¸®ÇÃ Àü¿ë num ½ÃÄö½º »ı¼º ------------------------
create sequence seq_reply
increment by 1
start with 1
maxvalue 999999999;

commit;

insert into diary_reply(num, num_ref, writer, content, input_date)
values(seq_reply.nextval, 62, '³ëÁø°æ', '»ç¶û°ú Á¤ÀÇÀÇ ÀÌ¸§À¸·Î ³Î ¿ë¼­ÇÏÁö ¾Ê°Ú´Ù!!', sysdate);
insert into diary_reply(num, num_ref, writer, content, input_date)
values(seq_reply.nextval, 62, '±èÈñÃ¶', '¾Ñ! ¿ë¼­ÇØ Áê¶¼¿è!!!', sysdate);
select * from diary_reply;
