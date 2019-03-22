-- 컬럼을 붙여 문자열로 출력 : //
-- EMP테이블에서 사원번호, 사원명, 직무를 조회
-- 출력형식은 : 사원명(사원번호)님 xxx직무입니다.
-- alias를 "로 묶어서 부여하면 대소문자가 가려진 컬럼이 나온다.
select         ename || '('|| empno ||')님 ' || job ||' 직무 입니다.' as output
from			emp;

-- alias는 바로 아래 where 절에서 사용할 수 없다. - error
select		empno, ename, sal s
from		emp
where		s < 3000;

-- 산술 연산자 : +, -, *, /
-- 사원 테이블에서 사원번호, 사원명, 연봉, 세금을 조회
-- 단, 세금은 연봉에 3.3% 계산하여 출력, 사원번호는 현재 번호에 10을 더한 값으로 출력.
select		empno, empno+10 as new_empno, ename, sal, sal * 0.033 as tax
from		emp;


-- 컬럼끼리 연산 (empno컬럼 - mgr컬럼)
select		empno - mgr
from		emp;
-- null은 연산되면 결과가 null이 나온다.
-- 사원 테이블에서 사원번호, 연봉, 보너스, 총 수령액을 조회
-- 단, 총 수령액은 연봉과 보너스를 합산한 금액으로 조회
-- nvl 함수를 사용하면 null 과 숫자열을 연산할 수 있다.
select		empno, sal, comm, sal+nvl(comm, 0) as total
from		emp;

-- 나눈 나머지 : mod(컬럼명, 나눌 값) 함수 사용
-- dual 테이블 : 모든 계정에서 사용할 수 있는 가상 테이블
--					입력되는 값으로 컬럼을 생성하여 조회처리

select '김정윤' name, mod(11, 3), mod(1989, 12)
from dual;
-- mod(11, 3)는 11/3 과 같으며 11을 3으로 나누면 나머지는 2가 된다.
-- mod(1989, 12)는 1989/12 와 같으며 1989를 12로 나누면 나머지는 9가 된다.
-- (태어난 해 / 12 ) = 0~11 의 값이 나옴
-- 11:양, 10:말, 9:뱀, 8:용, 7:토끼, 6:호랑이, 5:소, 4:쥐, 3:돼지, 2:개, 1:닭, 0:원숭이

-- 조회하는 컬럼에 관계연산자를 사용하면 Error
select		sal > 300
from		emp;

-- 관계연산자(비교연산자) : where절, having절에서 사용된다.
-- 종류 : >, <, >=, <=, =, !=, (<>)

-- 사원테이블에서 연봉이 3000보다 작거나 같은 사원의 사원번호, 사원명, 매니저번호, 연봉, 입사일, 부서번호 조회
select		empno, ename, mgr, sal, hiredate, deptno
from 		emp
where    sal <= 3000;

-- 사원테이블에서 연봉이 3000 이상인 사원의 사원번호, 사원명, 매니저번호, 연봉, 입사일, 부서번호 조회
select		empno, ename, mgr, sal, hiredate, deptno
from		emp
where		sal >= 3000;

-- 사원 테이블에서 부서번호가 '30'번인 사원들의 사원번호, 사원명, 직무, 입사일, 부서번호 조회
select empno, ename, job, hiredate,deptno
from	emp
where	deptno=30;

-- 사원 테이블에서 부서번호가 '20'번이 아닌 사원들의 사원번호, 부서번호, 사원명, 직무를 조회
select		empno, deptno, ename, job
from		emp
where		deptno <> 20;
-- <> : 논리부정연산자 != 와 동일한 뜻

-- 사원테이블에서 보너스가 없는 사원의 사원번호, 사원명, 연봉, 보너스 를 조회
-- null은 관계연산자로 비교할 수 없음
-- is null, is not null 로 조회
select		empno, ename, sal, comm
from		emp
where		comm is null or comm = 0;
-- 반대의 경우 comm is not null;

-- 논리연산자 : and (모든 비교 조건이 맞는 레코드를 조회), or (비교조건에 해당하는 모든 레코드를 조회), not

-- 사원테이블에서 사원번호가 7369 이면서 직무가 'clerk'인 사원의 사원번호, 사원명, 직무, 입사일, 연봉을 조회
select			empno, ename, job, hiredate, sal
from 			emp
where			empno=7369 and job='clerk';
-- 오라클은 값에 대해서는 대,소문자를 구분하므로 '정확한값' 을 입력할 것.
select			empno, ename, job, hiredate, sal
from 			emp
where			empno=7369 and job='CLERK';

-- 사원테이블에서 연봉이 1500 이상 3000 이하인 사원들의 사원번호, 사원명, 직무, 입사일, 연봉 조회

select			empno, ename, job, hiredate, sal
from			emp
where			sal>=1500 and sal<=3000;

-- 범위를 검색조건으로 사용할 때에는 between 을 사용할 수 있다.
-- 문법) 컬럼명 between 작은값 and 큰값

select			empno, ename, job, hiredate, sal
from			emp
where			sal between 1500 and 3000;

-- 사원 테이블에서 7902, 7839, 7566 매니저의 관리를 받는 사원의 사원번호, 사원명, 매니저번호, 연봉, 입사일을 조회
select empno, ename, mgr, sal, hiredate
from	emp
where	mgr=7902 or mgr=7839	or mgr=7566;
-- or 는 in 으로 바꿔 사용할 수 있다.
-- 문법) 컬럼명 in (값1, 값2, 값3 ...)
-- in은 "포함하는 ..." 이라는 뜻
select empno, ename, mgr, sal, hiredate
from	emp
where	mgr in (7902, 7839, 7566);
--  not int은 "포함하지 않는..." 이라는 뜻
select empno, ename, mgr, sal, hiredate
from	emp
where	mgr not in (7902, 7839, 7566);
select * from EMP;

