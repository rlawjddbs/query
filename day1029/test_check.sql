-- check, not null, default
-- check : 컬럼의 값을 유효성 검증된 값으로 추가하며 이 조건에 만족되지 않을경우 입력값을 저장하지 않음.
-- not null : 값이 반드시 입력 받아야할 때 사용
-- default : 컬럼값이 생략되거나 컬럼이 생략되어 null이 입력 되었을 때 대신 들어갈 기본적인 값.

-- 이름, 나이, 주소, 입력일을 저장하는 테이블을 생성
-- 단, 이름은 필수 입력, 나이는 20~30대 까지 입력가능
-- 입력일은 생략되면 현재 날짜로 자동적으로 입력되도록 설정.
create table other_constraints(
	name			varchar2(30byte) constraint c_name not null,
	age			number(2) constraint c_age check(age >= 20 and age <= 39), /* check(age between 20 and 39)*/
	input_date 	date default sysdate
);


-- user_constraints 에서는 제약사항(PK, FK, UK, check, not null)만 확인가능
select * from user_constraints;

select * from user_tab_cols
where table_name='OTHER_CONSTRAINTS';

-- 추가 성공
-- 최초 데이터
insert into other_constraints(name, age, addr, input_date) values('이재찬', 27, '서울시', '2018-10-26');
select * from other_constraints;
-- 주소와 입력일을 생략
insert into other_constraints(name, age) values('박영민', 27);
select * from other_constraints;

-- Error
-- 이름이 생략되는 경우 (name 컬럼의 not null 조건에 위배)
insert into other_constraints(age, addr, input_date) values(27, '서울시', '2018-10-26');
insert into other_constraints(name, age, addr, input_date) values('', 27, '서울시', '2018-10-26');

-- 나이가 20~30대가 아닌 경우
insert into other_constraints(name, age, addr, input_date) values('이재찬', 19, '서울시', '2018-10-26');
insert into other_constraints(name, age, addr, input_date) values('이재찬', 40, '서울시', '2018-10-26');

-- not null은 '테이블 단위'의 제약상으로는 설정할 수 없다.
create table temp(
	name		varchar2(10),
	constraint c_name1 not null(name)
);
