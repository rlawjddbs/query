select * from user_constraints;

select * from student;
select * from manager;


-- TEST, STUDENT, SUBJECT
insert into subject(sub_code, title, info)
values('O_000001','오라클','DataBase를 관리하는 프로그램');
insert into subject(sub_code, title, info)
values('J_000001','자바','완벽한 OOP언어');
commit;

select * from subject;

insert into subject(sub_code, title) values('A0', '');

insert into student(stu_num, name, age, address, email)
values('S_00000001','이재현',27,'서울시','lee@test.com');

select * from student;

-- 컬럼명 바꾸기
alter table test rename column col to test_num;

insert into test(test_num, sub_code, stu_num)
values(1, 'J_000001','S_00000001');

select * from test;
select * from student;
select * from subject;

-- 회원정보
-- 아이디(PK), 비밀번호(NN), 회원명(NN), 관심언어, 전화번호(UNIQUE),
--주소(NN), 입력일(DEFAULT)

-- 게시판
-- 글번호(PK), 제목(NN), 내용(NN), 작성자 id(FK), 작성일(DEFAULT), 조회수(DEFAULT 0)

-- 좌석
-- 고유번호(PK), 좌석번호(NN), 커플석(check N/Y 두개의 값만 입력가능, default N)

-- 예매
-- 예매고유번호(PK), 예매번호, 좌석(고유)번호(FK), 회원아이디(FK), 예매일자(default)

-- 테이블 설계서, ERD, exerd 포워드 엔진으로 테이블 생성

drop table seat;

select * from member;
select * from board;
select * from ticketing;
select * from SEAT;

insert into member(id, pw, name, lang, tel, addr) values('kjy20020', '121212', '김정윤', 'JAVA', '010-2676-0906', '서울시');
insert into seat(seat_uq_num, seat_num, couple) values(1, 1, 'Y');
insert into ticketing(tick_uq_num, tick_num, seat_uq_num, id, tick_date) values(1, 1, 1, 'kjy20020', '');
