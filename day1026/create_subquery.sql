-- 테이블 복사 :
-- 사원테이블에서 사원번호, 사원명, 입사일, 연봉을 조회 하여
-- 조회한 결과로 CP_EMP라는 테이블을 생성할 것.

create table cp_emp as ( select empno, ename, hiredate, sal from emp );

-- cp_emp 테이블의 sal 컬럼의 값은 null을 허용하지 않게 설정
alter table cp_emp modify sal number(7, 2) not null;
select * from user_constraints;

-- not null 조건은 단독으로 설정되어 있다면 서브쿼리를 이용하여 복사하였을 시 복사된다.

-- cp_emp 테이블에 사원번호가 7500 ~ 7599 사이에 속한
-- 사원의 사원번호, 사원명, 입사일, 연봉을 조회하여
-- cp_emp2 테이블을 생성하고 입력하세요.

create table cp_emp2 as (select			*
								from			cp_emp
								where			empno between 7500 and 7599 );


-- 구조만 복사 (레코드를 조회하지 않고 서브쿼리를 수행)
-- 사원 테이블에서 사원번호, 사원명, 부서번호, 직무, 연봉을 레코드가 조회되지 않도록 조회

-- 1번보다 사원번호가 적은 사람이 없다고는 보장할 수 없기 때문에 아래 코드는 임시방편적 코드
select			empno, ename, deptno, job, sal
from			emp
where			empno<1;

-- where 절에서 1=0 과 같이 반드시 false가 나오는 조건을 붙여 조회하면 레코드 없이 테이블의 구조만 조회할 수 있다.
-- 이러한 쿼리를 보고 다이나믹 쿼리(동적 쿼리)라 부른다.
create table cp_emp3 as (select			empno, ename, deptno, job, sal
								from			emp
								where			1=0);

select * from cp_emp;
select * from cp_emp2;
select * from cp_emp3;
