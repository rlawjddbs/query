create table home_work(
	num number(5),
	name varchar2(30),
	gen char(2),
	adress varchar2(360),
	score number(3),
	today date
);

insert into home_work values(1, '김준호', 'M', '서울시 강남구 역삼동', 64, sysdate);
insert into home_work (num, name, gen, adress, score, today) values(2, '김준현', 'M', '서울시 구로구 개봉동', 87, sysdate);
insert into home_work values(3, '오나미', 'F', '서울시 영등포구 여의도동', 97, sysdate);
insert into home_work (num, name, gen, adress, score, today) values(4, '황제성', 'M', '서울시 동작구 상도동', 100, sysdate);
insert into home_work values(5, '유재석', 'M', '경기도 수원시 영통구', 100, sysdate);



update		home_work
set				name='테스트', gen='M'
where         num=3 and score=97;


savepoint	update_u;
update		home_work
set				gen='F'
where			name='유재석';

rollback to update_u;

delete from home_work
where			num=1 and name = '김준현';

truncate table home_work;
drop table home_work;
show recyclebin;
purge recyclebin;

select * from HOME_WORK;
