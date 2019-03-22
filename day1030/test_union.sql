select * from CP_EMP3;

insert into cp_emp3(empno, ename, deptno, job, sal)
values(1112,'이재찬', 10, '대리', 3500);

insert into cp_emp3(empno, ename, deptno, job, sal)
values(1113,'이재현', 20, '차장', 7500);

insert into cp_emp3(empno, ename, deptno, job, sal)
values(1114,'정택성', 20, '알바', 1500);
commit;
-- cp_emp3 에 emp테이블에서 30번 부서 사원정보를 모두 추가
insert into cp_emp3(empno, ename, deptno, job, sal)
		(select empno, ename, deptno, job, sal
		from  emp
		where deptno=30);

-- emp : 미국본사, cp_emp3 : 한국지사
-- 미국본사와 한국지사의 연봉이 2000이하인 사원급여를 올려주고 싶어
-- 2000이하인 사원의 사원번호, 사원명, 연봉, 직무를 조회
-- union : 중복데이터가 조회되지 않는다.
-- union all : 중복데이터가 조회된다.
select empno, ename, sal, job
from  emp
where sal <= 2000
union
select empno, ename, sal, job
from  cp_emp3
where sal <= 2000;

select empno, ename, sal, job
from  emp
where sal <= 2000
union all
select empno, ename, sal, job
from  cp_emp3
where sal <= 2000;


-- 병합시킬 테이블의 조회되는 컬럼수가 맞지않을 경우 Error 발생
select		empno, ename, sal, job
from		emp
where		sal <= 2000
union	all
select		empno, ename, sal
from		cp_emp3
where		sal <=2000;

-- 컬럼의 데이터형이 일치하지 않는 경우도 Error
select		empno, ename, sal, job
from		emp
where		sal <= 2000
union	all
select		sal, job, ename, empno
from		cp_emp3
where		sal <=2000;

-- delete from cp_emp3 where empno >= 7521 and empno <= 7934;
-- delete from cp_emp3 where empno between 7499 and 7900;

-- intersect:
-- 미국 본사의 사원정보와 한국지사의 사원정보중 일치하는 정보만 조회
select		empno, ename, sal, job
from		emp
where		sal <= 2000
intersect
select		empno, ename, sal, job
from		cp_emp3
where		sal <=2000;

-- minus : 상위 select에서 조회된 결과를 하위 select에서 조회된 결과에서 뺀 나머지를 조회
select		empno, ename, sal, job
from		emp
minus
select		empno, ename, sal, job
from		cp_emp3
where		sal <=2000;


