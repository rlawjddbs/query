create table union_test as
(select empno, ename, job, sal, hiredate, deptno from emp);

alter table union_test add retired char(1);

update union_test
set retired='Y'
where to_char(hiredate,'yyyymm') between '198102' and '198110' ;

update union_test
set retired='N'
where not (to_char(hiredate,'yyyymm') between '198102' and '198110') ;

select * from union_test;

commit;

select empno, ename, job, sal, hiredate, deptno, retired
		from union_test
		where retired='N'
		union all
		select empno, ename, job, sal, hiredate, deptno, retired
		from union_test
		where retired='Y';


