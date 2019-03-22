create table trigger1(
	name varchar2(30),
	age number(3),
	addr varchar2(100)
);

create table trigger2(
	name varchar2(30),
	age number(3)
);


--- trigger 보기
drop trigger test_trigger;
select * from user_triggers;

select * from test_trigger;

select * from trigger1;
select * from trigger2;

insert into trigger1(name, age, addr) values('이재찬', 27, '인천시 남동구');
insert into trigger1(name, age) values('이재현', 27);

commit;

update 			trigger1
set					name='정택성', age=26
where				name='이재현';

delete from trigger1 where name='이재현';

select * from trigger2;
select * from trigger1;

select * from user_triggers;

drop trigger event_compare;


insert into class4_info(num, age) values(99, 46);
commit;



select * from trigger2;


select * from cp_emp3;
select * from cp_emp;
select * from emp;

insert into cp_emp(empno, ename, hiredate, sal) values(7777, 'pandaman', sysdate, 3000);

delete from cp_emp where empno=7777;
delete from cp_emp3 where empno=7777;    

------- 십이지신 테스트 -----------

