-- group by having
-- having : 그룹으로 묶일 조건
-- 사원수가 4명 이상인 부서의 부서번호, 사원수, 연봉합, 최고연봉을 조회
select 		deptno, count(deptno), sum(sal), max(sal)
from          emp
group by		deptno
having		count(deptno) >= 4
