-- update subquery : 다른 테이블의 값을 참조하여 현재 테이블의 값을 변경할 때
-- 단수행(권장)
-- cp_emp3 테이블에서 사원번호가 '1111'인 사원의 연봉을
-- emp테이블의 사원번호가 '7788'인 사원의 연봉으로 변경

update cp_emp3
set	sal=(select			sal
		  from			emp
		  where			empno=7788)
where empno=1111;

select * from cp_EMP3;
select * from emp;

-- 단수행 subquery에 복수행이 발생하면 error 발생
-- 컬럼을 여러개 조회하면 error 가 발생한다.
update cp_emp3
set	sal=(select			sal
		  from			emp)
where empno=1111;

update cp_emp3
set	sal=(select			sal,dept
		  from			emp
		  where=7788)
where empno=1111;

-- 복수행 subquery는 in을 사용하여 where 절에 사용 (권장하지 않음)
insert into cp_emp3(empno, ename, deptno, job, sal)
values(2222, '테스트', 30, 'SALESMAN', 2000);
commit;
-- cp_emp3 테이블에서 emp 테이블의 부서번호가 30번인 모든 사원들의 연봉을 '1000'으로 변경
update 	 cp_emp3
set			 sal=1000
where      empno in (select	empno from	cp_emp3 where	deptno=30);


---------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- delete subquery
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 다른 테이블의 값을 참조하여 현재 테이블 레코드 삭제.
-- 단수행
update		cp_emp3
set				ename='블랑카'
where			empno=7698;
commit;
-- cp_emp 테이블에서 사원정보를 삭제.
-- 삭제 조건 : emp 테이블의 사원명이 'blake'인 사원의 사원번호
-- 같은 사원을 cp_emp3 테이블에서 삭제
delete from cp_emp3
where empno=(select empno from emp where ename='BLAKE');

-- 복수행:
-- cp_emp3 테이블에서 emp 테이블의 부서번호가 30번인 모든 사원들과 사원번호와 같은 사원을 삭제
delete from	cp_emp3
where empno in (select	empno from emp where deptno=30);

select * from cp_emp3;

-- select subquery
-- 단수행 :
-- scalar subquery(스칼라 서브쿼리) : select로 조회하는 컬럼에 subquery를 사용하는 것.
--  emp 테이블에서 사원번호, 사원명, 부서번호, 부서명 조회
-- 부서명은 dept 테이블에 존재

-- 같은 이름의 컬럼이 존재하면 어떤 테이블에 존재하는 컬럼인지 구분하여 사용해야 한다. (테이블명.컬럼명)
-- 구분기호로 마침표 "." 를 사용한다.
select empno, ename, deptno, (select dname from dept where dept.deptno=emp.deptno)
from emp;
-- 코드풀이
-- emp 테이블에서 사원번호, 사원명, 부서번호, (부서명)을 조회한다.
-- 이때 부서명은 dept 테이블에 있는 dname 컬럼에서 deptno 번호가 emp 테이블의 deptno 번호와 일치하는 값만 가져온다.
-- emp 테이블과 dept 테이블의 deptno 컬럼명이 일치하므로 각각 테이블명.deptno 를 입력하여 어떤 테이블에 존재하는 컬럼인지 구분하여
-- 코드를 작성해야 한다.

-- cp_emp3 테이블에 emp 테이블의 사원 목록 중 부서번호가 10번, 30번인 사원들의 사원번호, 사원명, 부서번호, 직무, 연봉 삽입
insert into cp_emp3(
select empno, ename, deptno, job, sal from emp where deptno in(10, 30)
);
commit;



-- 사원테이블의 사원번호가 '7698'인 사원의 부서번호와 같은 부서번호를 가진 사원목록을 cp_emp3 테이블에서 조회,
-- 조회 컬럼은 사원번호, 사원명, 부서번호, 직무 조회.
select		    empno, ename, deptno, job
from			cp_emp3
where			deptno=(select deptno from emp where empno=7698);

-- where 절의 대상이 복수가 되면 error 발생
select		    empno, ename, deptno, job
from			cp_emp3
where			deptno=(select deptno from emp where empno in (7698, 7566));

-- 컬럼값의 다중행 subquery in, any, all, exists
-- 사원테이블의 사원번호가 '7698','7782'인 사원의 부서번호와 같은 부서번호를 가진 사원목록을 cp_emp3 테이블에서 조회,
-- 조회 컬럼은 사원번호, 사원명, 부서번호, 직무 조회.
select			empno, ename, deptno, job
from			cp_emp3
where			deptno in (select deptno from emp where empno=7698 or empno=7782);

select			empno, ename, deptno, job
from			cp_emp3
where			deptno in (select deptno from emp where empno in (7698, 7782));

-- 외부값 입력받기(프롬프트로 사용자가 직접 검색 조건을 씀) :
-- 쿼리문에 &변수명(사용자지정) : prompt(입력창이 동작됨, 입력창 형태는 툴마다 다름, 입력창에 입력한 값이 쿼리에 대입 됨)
-- &변수명이 쿼리문에 그대로 대입되므로 문자열을 입력한 경우 따옴표 ' 로 묶어주어야 에러가 발생하지 않는다.
-- 문자열을 검색할 경우 따옴표를 붙여줘야 함.
select * from emp where deptno=&deptno;
select * from emp where ename='&ename';

-- exists : 서브쿼리에 값이 존재한다면 그 즉시  현재 쿼리에서 빠져나가 바깥쿼리를 수행한다.
-- 사원테이블에서 사용자가 입력한 값이 테이블 내 부서번호와 일치한다면 emp 테이블의 모든 사원번호, 사원명, 입사일, 부서번호를 조회
select empno, ename, hiredate, deptno
from	emp
where exists (select deptno from emp where deptno=&deptno);
-- exists 는 조건이 만족되면 바깥쪽의 쿼리를 실행한다. (입력값과 일치하는 항목만 조회 하는 개념이 아님)

-- 사용자가 입력한 값과 일치하는 항목의 사원번호, 사원명, 입사일, 부서번호 를 조회하려면
select empno, ename, hiredate, deptno
from	emp
where deptno=&deptno;

-- all : and와 같음 - <: 서브쿼리에 조회된 값 중 가장 작은 값으로 비교 수행
--						>:	서브쿼리에서 조회된 값 중 가장 큰 값으로 비교 수행

-- 입력된 부서에서 가장 연봉이 적은 사원보다, 연봉이 더 적은 사원을 조회한다.
select empno, ename, sal, deptno
from	emp
where	sal < all (select sal from EMP where deptno=10);

select empno, ename, sal, deptno
from	emp
where	sal < all (select sal from EMP where deptno=&d_no);

--any : or
select empno, ename, sal, deptno
from emp
where sal < any (select sal from EMP where deptno=10);

select sal from EMP where deptno=10;

------------------------------------------------------------------------------------------------------------------------------------------
-- rownum : 조회된 결과에 순차적인 번호를 붙이는 가상 컬럼
------------------------------------------------------------------------------------------------------------------------------------------
-- 번호, 사원번호, 사원명, 입사일 조회
-- 단, 번호는 조회결과에 1부터 순차적으로 부여되어야 한다.
select		rownum, empno, ename, hiredate
from		emp;

select		rownum, empno, ename, hiredate
from		emp
where		deptno in (10, 20);

-- order by 와 같이 사용되면 rownum 의 번호가 먼저 부여된 후 order by 를 통해 정렬되므로
-- 번호가 섞이게 된다.
select		rownum empno, ename
from		emp
order by	ename asc;


-- rownum은 where 절에서 사용하면 1번부터는 조회가 되나
-- 1번이 아닌 번호는 조회되지 않는다.
-- 사원테이블에서 사원번호, 사원명, 입사일, 연봉을 조회한다.
-- 단, 출력은 조회 순서의 1번 ~ 5번 까지만 출력한다.
select 	rownum, empno, ename, hiredate, sal
from		emp
where		rownum between 1 and 5;

-- rownum은 where 절에서 사용하면 1번부터는 조회가 되지만 1번이 아닌 번호를 비교하면 조회되지 않는다.
select 	rownum, empno, ename, hiredate, sal
from		emp
where		rownum between 2 and 5;

-- 복수행 서브쿼리
-- 조회결과(inline view)를 가지고 재 조회
/*
	... from (select	컬럼명...
	from	(select ... ))
*/
-- 조회결과를 가지고 재 조회하는 방식이기 때문에 최초의 조회에서 가져오지 않은 값은 조회할 수 없다.
select empno, ename, sal, hiredate, comm
from	(select empno, ename, sal, hiredate from emp);
-- 앨리어스 alias 로 가져온 컬럼명은 재 조회시 앨리어스 명으로 조회해야 한다.
select empno, ename, sal, hiredate
from	(select empno, ename, sal, hiredate as hi from emp); /* error*/

select empno, ename, sal, hi
from	(select empno, ename, sal, hiredate as hi from emp); /* search sucess */

select rownum empno, ename, sal, hi
from	(select rownum empno, ename, sal, hiredate as hi from emp order by sal);

select rownum, empno, ename, sal, hi
from	(select rownum empno, ename, sal, hiredate as hi from emp order by sal);

-- 사원 테이블에서 가장 마지막에 입사한 사원부터 5명 조회
-- 조회할 컬럼은 사원번호, 사원명, 입사일
-- 내가 푼 거
select	rownum, empno, ename, hiredate
from (select		empno, ename, hiredate
		from		emp
		order by hiredate desc)
where rownum between 1 and 5
order by hiredate desc;
-- 풀이 한 거
select rownum, empno, ename, hiredate
from (select	empno, ename, hiredate
		from	emp
		order by hiredate desc)
where rownum between 1 and 5;

-- 사원테이블에서 가장 마지막에 입사한 사원의 이후 입사원부터 5명 조회
-- 조회할 컬럼은 사원번호, 사원명, 입사일
-- 내가 푼 거
select rownum ranking, empno, ename, hiredate
from(
		select rownum as rank, empno, ename, hiredate
		from	(select empno, ename, hiredate
				from	emp
				order by hiredate desc)
		where rownum between 1 and 6
)
where rank between 2 and 6;
-- 서브쿼리 총 3개 사용
-- 앨리어스(alias) 활용


-- 풀이 한 거
select rownum, r, empno, ename, hiredate
from(
		select rownum r, empno, ename, hiredate
		from	(select empno, ename, hiredate
				from	emp
				order by hiredate desc)
)
where r between 2 and 6;
-- 월 -일 -년 순으로 hiredate 표시 바꾸기
select rownum, r, empno, ename, to_char(hiredate, 'mm-dd-yyyy') as hiredate
from(
		select rownum r, empno, ename, hiredate
		from	(select empno, ename, hiredate
				from	emp
				order by hiredate desc)
)
where r between 2 and 6;

select * from user_constraints; /* 제약사항은 사용자마다 다를 수 있음.*/

select * from dept;
select * from emp;
select * from cp_emp3;
