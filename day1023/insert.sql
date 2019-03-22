-- 테이블에 레코드 (row) 추가
-- 컬럼명을 생략하는 경우.
-- insert into Class4_info values (NUM, 이름, 주민번호, 나이, 시력, 이메일, 작성일);


insert into Class4_info values(1, '정택성', '880101-1234567', 31, 1.3, 'jung@sist.co.kr', sysdate);
commit;

insert into Class4_info values(2, '880101-1234567', '택성', 26, 1.3, 'jung@sist.co.kr', sysdate);
commit;


-- 컬럼을 명시하여 추가하기 ↓
-- 컬럼의 정의 순서는 테이블의 정의된 컬럼의 순서와 다르게 작성가능↓
insert into Class4_info(num, name, ssn, age, eye, email, input_date) values(3, '이재현', '880101-1234568', 26, 1.3, 'jung@sist.co.kr', sysdate);


-- 실수는 0.8로 표기되지 않고 .8로 나타남↓
insert into Class4_info(name, email, num, ssn, age, input_date, eye) values('오영근', 'oh@test.com', 4, '890101-1234567', 28, sysdate, 0.8);
commit;

/* 위 코드는 insert 문을 하나의 commit 으로 묶어처리 했다. */



-- 컬럼을 생략하면 null이 입력된다.
insert into class4_info(num, name, age) values(5, '김정운', 20);
commit;

-- 위 코드들은 제약사항이 없기 때문에 중복이 생길 수 있다.
-- insert는 한 레코드씩 집어넣을 수 있다.
select * from CLASS4_INFO;
