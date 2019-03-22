
-- DDL
create table namecard(
	name varchar2(30) not null,
	addr varchar2(100) not null,
	img varchar2(255) default 'no_image.png',
	input_date date default sysdate
);

-- 가 데이터 추가

insert into namecard (name, addr, img)
values('김정윤','서울시 강남구 역삼동 황족','no_image.png');

insert into namecard (name, addr, img)
values('노진경','서울시 강서구 김포공항 공황족','no_image.png');

insert into namecard (name, addr, img)
values('이재현','경기도 안양시 평촌동 3조족','no_image.png');

commit;

select * from namecard;
