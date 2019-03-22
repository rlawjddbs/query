-- 순위 구하기
-- 전체 순위 구하기
-- rank() over(order by 순위를 구할 컬럼명 정렬방식) - 중복 순위가 발생할 수 있다.
-- 사원 테이블에서  사원번호, 사원명, 연봉, 연봉순위 조회
select			empno, ename, sal, rank() over(order by sal desc)
from			emp;

-- 사원 테이블에서 사원번호, 사원명, 연봉, 연봉순위 조회
-- 단, 중복순위가 발생하지 않도록 처리하여 조회 할 것.
select			empno, ename, sal, row_number() over(order by sal desc)
from			emp;

select			empno, ename, sal, row_number() over(order by sal desc) as sal_rank
from			emp
order by		sal_rank asc, ename asc;

-- 조회된 레코드를 그룹 별 순위로 조회 : partition by
-- 사원테이블에서 사원번호, 사원명, 연봉, 부서별 연봉 순위 조회
select		empno, ename, sal, deptno, rank() over(partition by deptno order by sal desc)
from		emp;

-- 부서별 연봉 순위를 중복번호 없이 조회
select		empno, ename, sal, deptno,
			row_number() over(partition by deptno order by sal desc) sal_rank
from		emp;

select		empno, ename, sal, deptno,
			row_number() over(partition by deptno order by sal desc) sal_rank
from		emp
order by	deptno, sal_rank;

-----------------------------------------------------------------------------------------------------------
-- rollup, cube
-----------------------------------------------------------------------------------------------------------
-- rollup : 그룹별 소계를 얻을 때 사용한다.
-- 그룹으로 묶이는 컬럼이 하나인 경우에는 총계가 출력된다.

-- 사원 테이블에서 부서별, 연봉의 합을 조회하고 총계를 출력
-- rollup은 소계가 마지막에 출력된다.
select                 deptno, sum(sal)
from					emp
group by				rollup(deptno);
-- cube는 소계가 먼저 출력된다.
select                 deptno, sum(sal)
from					emp
group by				cube(deptno);

-- 여러 컬럼이 그룹으로 묶여지면 rollup은 그룹별 소계를 마지막에 출력한다.

-- 사원 테이블에서 부서별, 직무의 연봉합, 소계, 총계 조회
select				deptno, job, sum(sal)
from				emp
group by			rollup(deptno, job)
order by			deptno asc;

select * from emp;
-- 위 코드와 비교해 볼 것  1
select				deptno, job, sum(sal)
from				emp
group by			deptno, job
order by			deptno asc;
-- 위 코드와 비교해 볼 것 2

-- 사원 테이블에서 부서별, 직무의 연봉합, 직무별(그룹별) 소계, 총계, 조회되는 레코드의 소계 조회
select				deptno, job, sum(sal)
from				emp
group by			cube(deptno, job)
order by			deptno asc;




select * from user_constraints;
desc dept;
