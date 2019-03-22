--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- inner join : 서로다른 테이블에 같은 값이 있는 경우에만 조회.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 사원번호, 사원명, 부서번호, 부서명, 위치, 연봉 조회
-- 사원번호, 사원명, 부서번호, 연봉 (emp table)
-- 부서번호, 부서명, 위치(dept table)
-- ANSI
select 			empno, ename, emp.deptno, dname, loc, sal
from				emp
inner join      	dept
on					emp.deptno = dept.deptno;


select 			empno, ename, e.deptno, dname, loc, sal
from				emp e
inner join      	dept  d
on					e.deptno = d.deptno;

select 			empno, ename, e.deptno, dname, loc, sal
from				emp e
inner join      	dept  d
on					d.deptno = e.deptno;

select 			e.empno, e.ename, d.deptno, d.dname, d.loc, e.sal
from				emp e
inner join      	dept  d
on					d.deptno = e.deptno;

-- Oracle inner join
-- 조인 조건을 잘못 설정하면 '카티션 프로덕트'가 발생한다.
select			e.empno, e.ename, d.deptno, d.dname, d.loc, e.sal
from			emp	e, dept d;
-- where 절을 이용하여 카티션 프로덕트 방지, 성공
select			e.empno, e.ename, d.deptno, d.dname, d.loc, e.sal
from			emp	e, dept d
where			e.deptno=d.deptno;
-- where 절에서 조회조건 설정 후 and 를 활용하여 검색조건 설정, 성공
select			e.empno, e.ename, d.deptno, d.dname, d.loc, e.sal
from			emp	e, dept d
where			e.deptno=d.deptno and e.deptno=20;

--  제조국 테이블에 PK 설정
alter table car_country add constraint pk_car_country primary key(maker);
-- 제조사 테이블에 FK 설정
alter table car_maker add constraint fk_maker foreign key(maker) references car_country(maker);
-- 제조사 테이블에 PK 설정
alter table car_maker add constraint pk_maker primary key(model);
-- 모델 테이블은 FK설정
alter table car_model add constraint fk_model foreign key(model) references car_maker(model);
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 테이블 3개 조회
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 모델명이 '아반테', '소나타', 'A8'인 차량의 제조국, 제조사, 모델명,
-- 연식, 가격, 이미지 조회
select * from car_country;
select * from car_maker;
select * from car_model;
-- ANSI
select				cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.car_img
from				car_country 	cc
inner join		car_maker	cma
on					cma.maker=cc.maker
inner join		car_model	cmo
on                 cmo.model = cma.model
where				cmo.model in('아반테','소나타','A8');

-- Oracle
select				cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.car_img
from				car_country 	cc, car_maker cma, car_model cmo
where				(cma.maker=cc.maker and cmo.model=cma.model) and cmo.model in ('아반테', '소나타', 'A8');

-- 사원번호, 사원명, 연봉, 입사일, 부서번호, 부서명, 위치, 우편번호, 시도, 구군, 동, 번지를 조회하세요
-- 사원테이블의 사원번호와 우편번호 테이블의 seq를 조인조건으로 사용
-- 내가 한거
-- ANSI
select 		e.empno, e.ename, e.sal, e.hiredate, e.deptno, d.dname, d.loc, z.zipcode, z.sido, z.gugun, z.dong, z.bunji, z.seq
from			emp e
inner join    dept d
on				e.deptno = d.deptno
inner join	zipcode z
on				e.deptno = z.seq;
-- Oracle
select 	e.empno, e.ename, e.sal, e.hiredate, e.deptno, d.dname, d.loc, z.zipcode, z.sido, z.gugun, z.dong, z.bunji, z.seq
from		emp e, dept d, zipcode z
where	    (e.deptno = d.deptno and e.deptno = z.seq);
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- outer join : 어느 한쪽 테이블에만 레코드가 존재하더라도 조회
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 모든 부서의 부서번호, 부서명, 사원번호, 사원명, 입사일 조회
-- ANSI ) left나 right를 사용할 때 레코드가 있는 쪽 테이블 지정
-- 레코드의 구조를 잘 모른다면 full outer join을 하여 양쪽 테이블 모두 조회하면 된다.
select						d.deptno, d.dname, e.empno, e.ename, e.hiredate
from						dept d
left outer join			emp e
on							e.deptno=d.deptno;

select						d.deptno, d.dname, e.empno, e.ename, e.hiredate
from						emp e
right outer join			dept d
on							e.deptno=d.deptno;
-- outer는 생략 가능
select						d.deptno, d.dname, e.empno, e.ename, e.hiredate
from						dept d
left join					emp e
on							e.deptno=d.deptno;

select						d.deptno, d.dname, e.empno, e.ename, e.hiredate
from						dept d
left outer join			emp e
on							e.deptno=d.deptno;
-- ANSI full outer join (ANSI 만 가능)
select						d.deptno, d.dname, e.empno, e.ename, e.hiredate
from						emp e
full outer join			dept d
on							e.deptno=d.deptno;

select						d.deptno, d.dname, e.empno, e.ename, e.hiredate
from						dept d
full outer join			emp e
on							e.deptno=d.deptno;


-- Oracle ) 조인 조건에 레코드가 없는 쪽에 (+)를 붙인다.
select						d.deptno, e.deptno, d.dname, e.empno, e.ename, e.hiredate
from						emp e, dept d
where						(e.deptno(+)=d.deptno);

select						d.deptno, d.dname, e.empno, e.ename, e.hiredate
from						dept d, emp e
where						d.deptno = e.deptno(+);

select						e.deptno, d.dname, e.empno, e.ename, e.hiredate
from						dept d, emp e
where						d.deptno = e.deptno(+);

select						d.deptno, d.dname, e.empno, e.ename, e.hiredate
from						emp e, dept d
where						d.deptno = e.deptno(+);

select						d.deptno, d.dname, e.empno, e.ename, e.hiredate
from						emp e, dept d
where						e.deptno(+) = d.deptno;

--
select						d.deptno, d.dname, e.empno, e.ename, e.hiredate
from						emp AS e, dept AS d
where						e.deptno(+) = d.deptno;

-- (+)는 양쪽에 붙일 수 없다.
select						d.deptno, e.deptno, d.dname, e.empno, e.ename, e.hiredate
from						emp e, dept d
where						(e.deptno(+)=d.deptno(+));

-- 제조사가 '현대', '기아'인 모든 차량의 제조국, 제조사, 모델명, 연식, 가격, 옵션을 조회한다.
select					cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.car_option
from					car_country cc, car_maker cma, car_model cmo
where					(cma.maker = cc.maker and cmo.model(+) = cma.model) and cma.maker in('현대', '기아');

select					cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.car_option
from					car_country cc, car_maker cma, car_model cmo
where					(cma.maker(+) = cc.maker and cmo.model(+) = cma.model) and cma.maker in('현대', '기아');


-- 모델명이 'K5', 'K7', '소나타', '아반테', 'Cclass', 'A6'인 모든 차량의
-- 제조국, 제조사, 모델명, 연식, 가격을 조회
-- 단, 가격의 내림차순으로 정렬하여 조회할 것, 가격이 같다면 연식의 내림차순으로 정렬할 것
-- 내가 푼 거
-- ANSI


-- Oracle
select				cc.country, cc.maker, cma.model, cmo.car_year, cmo.price
from				car_country cc, car_maker cma, car_model cmo
where				(cma.model=cmo.model and cc.maker = cma.maker(+)) and cma.model in ('K5', 'K7', '소나타', '아반테', 'Cclass', 'A6')
order by			cmo.price desc, cmo.car_year asc;

-- self join (서브쿼리를 활용)
-- 사원테이블에서 'scott'인 사원보다 연봉을 적게받는 사원의 사원번호, 사원명, 입사일, 연봉 조회
-- 내가 푼거
select			empno, ename, hiredate, sal
from			emp
where			sal < (select sal from emp where ename='SCOTT')
order by		sal asc;
-- 풀이 한거
select			e1.empno, e1.ename, e1.hiredate, e1.sal
from			emp e1, emp e2
where			(e1.sal < e2.sal) and e2.ename='SCOTT'
order by		sal asc;

select			e1.empno, e1.ename, e1.hiredate, e1.sal
from			emp e1, emp e2
where			(e1.sal < e2.sal) and e2.ename='SCOTT'
order by		sal asc;

-- 인라인 뷰에서 만들어진 앨리어스는 인라인 뷰 바깥에서는 사용할 수 없다.
select ename
from (
		select e.ename, e.sal, d.dname
		from  emp e, dept d
);



select * from car_country;
select * from car_maker;
select * from car_model;
select * from zipcode;

select * from user_constraints;