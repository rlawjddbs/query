-- day1024_4일차 숙제

-- 1. 사원 테이블에서 '10' 부서가 아니면서 연봉이 1000이상 3000이하의
-- 모든 사원들의  사원번호,사원명, 입사일,부서번호, 연봉을 조회하세요.
select			empno, ename, hiredate, deptno, sal
from			emp
where			deptno != 10 and sal between 1000 and 3000;

-- 2. 사원 테이블에서 보너스를 수령하는 사원들의  사원번호,사원명,
--    연봉,보너스, 총수령액, 월급을 조회 하세요.
--   - 월급은 연봉을 12개월로 나눠 계산할 것.
select		empno, ename, sal, comm, sal+nvl(comm, 0) as total, (sal+nvl(comm, 0))/12 as monp
from		emp
where		comm is not null or comm!=0;

-- 3.  사원 테이블에서 부서번호가 10,30인  사원들의 사원명, 사원번호
--    입사일, 연봉을 조회 하세요.
--    -단, 출력은  xxxx번 xxxx사원님 xxxx년에 입사하였고 연봉은 xxx$입니다.
--    의 형식으로 하고, 컬럼명은 output 으로 설정할것.
select		empno||'번 '||ename||'사원님 '||hiredate||'년에 입사하였고 연봉은'||sal||'$입니다.' as output
from		emp
where		deptno in (10, 30);

-- 4. 사원 테이블에서 연봉이 3000 미만인 사원들의 사원번호, 사원명,
--   입사일, 연봉,직무, 부서번호를 조회 하세요.
--   단, 연봉의 오름차순으로 정렬하되 연봉이 같다면 사원명의 내림차순으로
--   정렬할것.
select		empno, ename, hiredate, sal, job, deptno
from 		emp
where		sal<3000
order by sal asc, ename desc;

--5. test_like 테이블에 아래와 같은 데이터를 추가할것.
--    7, 기임저엉은,서울시 동작구 상도동,'정기고'
--    8, 정대만,서울시 동대문구 동대문1동,'썸타고'
--    9, 송태섭,서울시 동대문구 동대문2동,'정기고'
insert into test_like values(7, '기임저엉은', '서울시 동작구 상도동', '정기고');
insert into test_like(num, name, loc, highschool) values (8, '정대만', '서울시 동대문구 동대문1동', '썸타고');
insert into test_like(num, name, loc, highschool) values (9, '송태섭', '서울시 동대문구 동대문2동', '정기고');

-- 6. test_like 테이블에서 '서울시'에 거주하는 학생의  번호,학생명,
--   주소, 학교정보를 아래와  같은 형식으로 출력하고
--   컬럼명은 대소문자 구분하여 Output으로  할것.
--   출력형식 :  번호 : x, 이름 : xx, 주소 : xx, 학교 : xx

select		'번호: '||num||', 이름: '||name||', 주소: '||loc||', 학교: '||highschool as "Output"
from 		test_like
where		loc like '%서울시%';

-- 7. 사원테이블에서 사원명이 4글자이거나 연봉이 3000이상인 사원의
--   사원번호, 사원명, 연봉, 입사일, 부서번호, 직무를 조회할것.
--   단, 출력 데이터는 연봉의 오름차순으로 정렬하고, 연봉이 같다면
--   사원명의 오름 차순으로 정렬할것.

select		empno, ename, sal, hiredate, deptno, job
from		emp
where    ename like '____' or sal>=3000
order by sal asc, ename asc;

-- 8.  test_like 테이블에서 고등학교명을 출력하고 학교명의 오름
--    차순으로 정렬하여 출력할 것.
--    단, 고등학교 명이 같다면 하나만 출력하세요.(2가지로 할 것.)

select			highschool
from  		test_like
group by		highschool
order by		highschool asc;

select			distinct highschool
from			test_like
order by		highschool asc;

-- 9. 사원 테이블에서 사원번호, 사원명, 입사일, 연봉, 내년연봉을
--   조회 하세요.
--   내년 연봉은 현재 연봉보다 7% 향상된 금액으로 계산하여 출력할것.
select empno, ename, hiredate, sal, sal + (sal * 7 / 100) as nextsal
from	emp;

-- 10. 사원 테이블에서 사원명이 5글자이면서 세번째 글자에 'A'가 들어
--    간 사원의 사원명, 사원번호, 입사일, 연봉을 조회하세요.
--    단, 연봉의 오름차순으로 출력할것.
select		ename, empno, hiredate, sal
from		emp
where		ename like '_____' and ename like '__A__'
order by sal asc;

-- 11. 사원 테이블에서 사원명이 'A'로 시작하면서 연봉이 1600이상인
--     사원의 사원명,연봉,직무, 매니저번호, 입사일을 조회 할것.
select		ename, sal, job, mgr, hiredate
from      emp
where		ename like 'A%' and sal>= 1600;

select * from TEST_LIKE;
select * from emp;
