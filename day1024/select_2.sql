-- 문자열 연산자 like에서 사용할 테이블 test_like
-- num 컬럼 : 숫자
-- name 컬럼 : 가변형 10자( 3byte * 10 = 30)
-- loc 컬럼 : 가변형 100자( 3byte * 100 = 300)
-- highschool 컬럼 : 가변형 20자( 3byte * 20 = 60)
create table test_like(
	num	number,
	name	varchar2(30),
	loc		varchar2(300),
	highschool varchar2(60)
);

insert into test_like(num, name, loc, highschool) values (1, '김정윤', '서울시 강남구 역삼동', '오지고');
insert into test_like(num, name, loc, highschool) values (2, '김정운', '서울시 구로구 역삼동', '지리고');
insert into test_like(num, name, loc, highschool) values (3, '박영민', '경기도 수원시 영통구', '렛잇고');
insert into test_like(num, name, loc, highschool) values (4, '김희철', '서울시 서초구 서초동', '오지고');
insert into test_like(num, name, loc, highschool) values (5, '김저정은', '평양시 평양동', '씹고');
insert into test_like(num, name, loc, highschool) values (6, '하정운', '경기도 수원시 수원동', '맛보고');

commit;

-- like 연산자 %(퍼센트), _(언더바) 기호와 같이 사용
-- "%" - 모든 문자열
-- "_" - 한 문자

-- test_like 테이블에서 '서울시'에 사는 사람의 번호, 이름, 거주지, 출신 고등학교명 조회

select		num, name, loc, highschool
from		test_like
where		loc like '서울시%';
-- where loc='서울시' 와 같다.

select		num, name, loc, highschool
from		test_like
where		name='김정윤';

-- 이름이 '운'으로 끝나는 학생의 번호, 이름, 주소를 조회
select		num, name, loc
from		test_like
where 	name like '%운';

-- 이름에 '정'이 포함 되어있는 학생의 번호, 이름, 주소, 출신 고등학교를 조회
select		num, name, loc, highschool
from		test_like
where		name like '%정%';

-- 이름이 3글자이며 가운데 글자가 '정'인 학생의 번호, 이름 조회
select		num, name
from		test_like
where		name like '_정_';

-- 이름이 4글자인 학생의 번호, 이름, 출신 고등학교명을 조회
select		num, name, highschool
from 		test_like
where		name like '____';

select * from TEST_LIKE;

-- 지번 주소를 저장하는 테이블
-- zipcode 7byte, sido 6byte, gugun 25byte, dong 60byte
create table zipcode(
	zipcode	char(7),
	sido		char(6),
	gugun	varchar2(25),
	dong		varchar2(100),
	bunji		varchar2(25),
	seq		number(5)
);

-- 문제가 생겨 dong 컬럼 최대 byte 70에서 100으로 바꿈
alter table zipcode modify dong varchar2(100);

-- 테이블의 레코드를 모두 절삭함.
truncate table zipcode;

-- 테이블의 레코드가 몇개인지 알려줌.
select count(*) from zipcode;

-- 우리집의 지번 주소를 조회
-- 동이름)
select		zipcode, sido, gugun, dong, bunji, seq
from      zipcode
where		dong='상도동';

select		zipcode, sido, gugun, dong, bunji, seq
from      zipcode
where		dong like '%역삼동%';

-- 사원테이블에서 사원명에 'L'이 두개 들어있는 사원의 사원번호, 사원명 입사일 조회
select		empno, ename, hiredate
from		emp
where 	ename like '%L%L%';

-- 사원테이블에서 사원명에 'A'가 두개 들어있는 사원의 사원번호, 사원명 입사일 조회
select		empno, ename, hiredate
from		emp
where 	ename like '%A%A%';

-- 사원테이블에서 부서번호 조회
select      deptno
from		 emp;

-- 중복배제
-- 사원테이블에서 매니저 번호를 조회
-- 단, 중복되는 매니저번호는 출력하지 않는다.
select		mgr
from		emp;


-- distinct 집계함수를 사용하여 그룹별 집계를 보여줄 수 없다.
-- 다른 값이 나오는 컬럼과 같이 사용할 경우, 모든 컬럼의 값이 동일해야 중복 배제가 된다.
select distinct 	mgr/*, ename*/
from				emp;

-- group by : 그룹으로 묶여지지 않은 컬럼과 같이 사용되면 error
select		mgr/*, ename*/
from		emp
group by mgr/*, ename*/;

select * from EMP;
select * from ZIPCODE;
