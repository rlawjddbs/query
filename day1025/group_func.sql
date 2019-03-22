-- 집계함수 - 컬럼의 값을 하나로 만들어 반환하는 함수들
-- count : null이 아닌 컬럼의 개수를 셀 때
-- 사원 테이블의 레코드 수 (사원 수), 보너스를 수령하는 사원 수

-- 사원수
select		count(empno)
from		emp;
-- 사원수와 보너스를 수령하는 사원 수1
select		count(empno), count(comm)
from		emp;
-- 사원수와 보너스를 수령하는 사원 수2
select		count(empno) "사원수", count(comm)"보너스 받는 사원수"
from		emp;
-- 사원수와 보너스를 수령하는 사원 수 및 보너스를 수령하지 못하는 사원 수
select		count(empno), count(comm),
			count(empno) - count(comm)
from		emp;
-- 사원수와 보너스를 수령하는 사원 수 및 보너스를 수령하지 못하는 사원 수 와 매니저가 있는 사원 수
 select	count(empno), count(comm),
			count(empno) - count(comm), count(mgr)
from		emp;

-- 사원들의 연봉의 합, 보너스 합, 인건비 총합
select 	sum(sal), sum(comm), sum(sal)+sum(comm)
from	    emp;

-- 연봉 평균
select		avg(sal)
from		emp;
-- 연봉 평균 소수점 없애기
select		trunc(avg(sal),0)
from		emp;
-- 연봉 평균 보너스 평균
select		trunc(avg(sal), 0), avg(comm)
from		emp;

-- 최고 연봉액
select		max(sal)
from		emp;
-- 최저 연봉액
select		min(sal)
from		emp;

-- 최고 연봉액, 최저연봉액, 최고연봉액과 최저연봉액 차
select		max(sal), min(sal), max(sal) - min(sal)
from		emp;

-- ** where 절 에서는 집계함수를 사용할 수 없다. (아직까지 사용못할 뿐, 더 배우면 가능함)
-- 사원 테이블에서 평균연봉보다 많이 수령하는 사원의 사원번호,
-- 사원명, 연봉, 입사일 조회 (아직까지 배운 기술로는 못 함)
-- 시도1
select		empno, ename, sal, hiredate
from		emp
where		sal > avg(sal);

-- 집계함수는 group by와 같이 사용하면 그룹별 집계를 조회할 수 있다.
-- 부서번호, 부서별 인원 수, 부서별 연봉 합, 부서별 연봉 평균(소수점 이하 두 자리), 최고 연봉액, 최저 연봉액 조회
select				deptno, count(empno), sum(sal), trunc(avg(sal), 2), max(sal), min(sal)
from		        emp
group by			deptno
order by			deptno asc;

-- 사원 테이블에서 매니저별 관리 인원수, 최고연봉과 최저연봉
-- 최고 연봉과 최저연봉 차이
-- 단 매니저가 있는 사원들만 조회할 것
select			mgr, count(empno), max(sal), min(sal), max(sal) - min(sal)
from			emp
where			mgr is not null
group by		mgr
order by		mgr asc;

-- 날짜 함수
-- 오늘로부터 5일 후 날짜 조회
-- 날짜에 +를 사용하면 일 을 더한다.
select		sysdate+5
from		dual;

-- 7개월 후 날짜
select		add_Months(sysdate, 7)
from		dual;

-- 현재 날짜와 현재 날짜의 비교
select		months_between('2018-11-25', sysdate)
from		dual;


select * from EMP;
