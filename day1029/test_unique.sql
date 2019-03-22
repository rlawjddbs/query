-- unique : 값이 없을 수도 있고 있다면 유일해야 할 때(중복되지 않아야 할 때)
-- 이름, 이메일(중복X), 주소를 저장하는 테이블 생성

create table column_unique(
	name		varchar2(30),
	email		varchar2(50) constraint uk_email unique,
	address	varchar2(100)
);

select * from column_unique;
select * from user_constraints;

-- 추가성공, 최초입력
insert into column_unique(name, email, addr)
values('이재찬','lee@test.com','경기도 수원시 영통구');
commit;
-- 이메일이 없는 경우에도 unique는 null을 허용하므로 값이 들어감
insert into column_unique(name, addr)
values('이재찬','경기도 수원시 영통구');
insert into column_unique(name, email, addr)
values('이재찬1', '', '경기도 수원시 영통구');
select * from column_unique;

-- 실패
-- 같은 이메일이 입력되었을 때
insert into column_unique(name, email, address)
values('박영민','lee@test.com', '부산시');

-- 테이블 단위
-- 번호, 이름, 전화번호, 카드번호를 저장하는 테이블생성
-- 전화번호와 카드번호는 없을 수도 있고, 있다면 유일할 것(중복되지 않도록 할 것).
create table table_unique(
 	num			number(5),
 	name			varchar2(30),
 	tel				varchar2(13),
 	card_num	char(4),
 	constraint uk_tel 	unique(tel),
 	constraint uk_card_num unique(card_num)
);

select * from user_constraints;
select * from user_indexes;

-- 추가성공
-- 최초입력
insert into table_unique(num, name, tel, card_num) values(1, '김정운', '010-8769-6112', '1234');
select * from table_unique;
-- 전화번호와 카드번호가 다른 경우
insert into table_unique(num, name, tel, card_num) values(2, '이재현운', '', '');
-- null이 입력되는 경우
insert into table_unique(num, name) values(3, '김정운');
select * from table_unique;
select * from table_unique;

-- 에러
-- 전화번호든 카드번호든 둘 중 하나라도 같다면 에러
insert into table_unique(num, name, tel, card_num)values(4, '정택성', '010-1111-2223', '1234');
insert into table_unique(num, name, tel, card_num)values(4, '정택성', '010-8769-6112', '1234');


select * from user_constraints;
