-- insert subquery

-- 단수행
-- cp_emp3에 아래와 같은 레코드를 추가
-- 사원번호: 1111, 사원명: 김희철, 부서번호: 10, 직무: 사원, 연봉: emp테이블의 사원번호가 7566인 사원의 연봉과 같은 연봉

-- 기존 방식
insert into cp_emp3(empno, ename, deptno, job, sal) values(1111, '김희철', 10, '사원', 2975);
-- subquery 활용 방식
insert into cp_emp3(empno, ename, deptno, job, sal) values(1111, '김희철', 10, '사원', (select sal from EMP where empno=7566));



-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 본 insert subquery 는 단일행 서브쿼리가 들어가야 하는 곳에서 복수행이 사용되면 error 가 발생한다.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
insert into cp_emp3(empno, ename, deptno, job, sal) values(1111, '김희철', 10, '사원', (select sal from EMP));
insert into cp_emp3(empno, ename, deptno, job, sal) values(1111, '김희철', 10, '사원', (select sal, deptno from EMP where empno=7566));
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------



-- 복수행(다중행) subquery
-- emp 테이블에서 부서번호가 30번인 부서의 사원번호, 사원명, 부서번호, 직무, 연봉을 조회하여 cp_emp3 테이블에 추가한다.
insert into cp_emp3(select empno, ename, deptno, job, sal from emp where deptno=30);

------------------------------------------------------------------------------------------------------------------------------------------------------
-- 사원테이블에서 1981-02에 입사한 사원의 직무, 연봉합, 입사년-월, 입력일을 test 테이블 추가한다.
create table test(
	job		varchar2(9),
	sal			number(7,2),
	hiredate	date
);
-- 컬럼추가
alter table test add input_date date;
-- 기존 컬럼 수정
alter table test modify hiredate varchar2(7);

--select 			job, sal, to_char(hiredate,'yyyy-mm') as hiredate
--from				emp
--where				to_char(hiredate,'yyyy-mm')='1981-02';

insert into test
	 (select job, sum(sal), to_char(hiredate, 'yyyy-mm') hiredate, sysdate
	 from emp
	 where to_char(hiredate, 'yyyy-mm')='1981-02'
	 group by job, hiredate);

select * from test;
select * from EMP;
select * from CP_EMP3;
