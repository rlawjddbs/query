-- 제약사항을 확인 : select 열람할 컬럼 from user_constraints
-- 제약사항은 중복 방지, null 방지, 특정 값 방지 등에 사용된다.
select *
from user_constraints;

-- 번호, 이름, 전화번호, 주민번호, 이메일 저장하는 테이블 생성,
-- 주민번호는 null을 허용하지 않으면서 유일해야한다.

--create table column_primary(
--	num 		number,
--	name     varchar2(30),
--	tel			varchar2(13),
--	ssn		char(14) primary key,
--	email		varchar2(50)
--);

-- insert into column_primary (num, name, ssn) values(1,'test','880101-1234567');
-- insert into dept(deptno, dname, loc) values(10,'t','t');
-- drop table column_primary;
-- purge recyclebin;

-- drop : 테이블을 지울 때
-- purge recyclebin : 휴지통에 버려진 테이블을 완전히 지울 때

create table column_primary(
	num 		number,
	name     varchar2(30),
	tel			varchar2(13),
	ssn		char(14) constraint pk_column_primary primary key,
	email		varchar2(50)
);
------------------------------------------------------------------------------------------------------------------
-- 컬럼하나로 PK가 구성되는 경우
------------------------------------------------------------------------------------------------------------------
-- 레코드 추가 성공의 예
-- 최초 레코드 삽입시 성공하게 되어있음
insert into column_primary(num, name, tel, ssn, email) values(1,'이재찬','010-1234-5678','880101_1234567','lee@test.com');
commit;

-- 주민번호가 다른 경우도 성공하게 되어있음
insert into column_primary(num, name, tel, ssn, email) values(2,'이재현','010-2222-6432','890101_1234567','lee@test.com');
commit;

-- 추가 실패
-- 주민번호에 같은 주민번호가 입력되는 경우 실패하게 되어있음
insert into column_primary(num, name, tel, ssn, email) values(2,'이재현','010-7281-1279','890101_1234567','jung@test.com');
commit;
-- null이 입력되는 경우도 실패하게 되어있음
-- 숫자, 날짜는 컬럼이 생략되면 null이 입력되고
-- 문자열(고정길이, 가변길이)은 컬럼이 생략되는 경우와 "(empty)로 데이터가 추가되는 경우에 null이 입력된다."

-- 경우1. 컬럼이 생략되어 insert 되는 경우
insert into column_primary(num, name, tel, email) values(2,'이재현','010-7281-1279', 'jung@test.com');
commit;
-- 경우2. 컬럼은 정의되어 있으나 작은 따옴표 ( ' ) 가 붙여져 입력되는 경우 또한 null 값이 저장되므로 실패하게 됨
insert into column_primary(num, name, tel, ssn, email) values(2,'이재현','010-7281-1279', '', 'jung@test.com');
commit;

-- primary key를 적용시킬 대상으로 고려할 만한 컬럼들을 후보키 라고 한다.(?)

-- table level constraint
-- 이름, 아이디, 비밀번호 저장하는 테이블 생성
-- 아이디는 null을 허용하지 않으면서 값은 유일해야 한다.

create table table_primary(
	name	varchar2(30),
	id		varchar2(20),
	passwd	varchar2(30),
	constraint	pk_table_primary	primary key(id)
);

-- 추가성공
insert into table_primary(name, id, passwd) values('김희철', 'kim', '1234');
commit;
-- 추가실패
insert into table_primary(name, passwd) values('김희철', '1234');
commit;


-- 여러개의 컬럼이 PK로 구분되는 경우,
-- table 단위 제약사항으로만 설정가능

-- 아이템명, 아이템 번호, 설명
-- 아이템 번흐는 레코드가 추가될 때
-- 순차적으로 증가하며 'ITEM_0001'의 형식을 가진다.
-- 아이템 번호와, 아이템명은 같을 수 없다.
create	table	table_multi_primary(
	item_num	char(9),
	item			varchar2(60),
	item_info		varchar2(4000),
	constraint 	pk_table_multi_primary primary key(item_num, item)
);

select * from TABLE_MULTI_PRIMARY;
select * from user_constraints;


-- 'ITEM_0001' 조회
select concat('ITEM_', lpad(nvl(max(item_num),0)+1,4,0))
from	table_multi_primary;
-- concat('붙일문자', 대상컬럼)
-- lpad(대상컬럼명, 표시할 최대 자리수, 자리수가 부족할시 붙일 문자/숫자)
-- nvl(대상컬럼명, null일 경우 바꿔 대입할 값) : 조회된 레코드가 null일 때만 쉼표 뒤에 작성된 값으로 값을 변경
-- max(최대값을 확인할 컬럼명)
-- 여러개의 컬럼이 하나의 PK로 구성되는 경우
-- 추가성공 : 최초 데이터 입력
insert into	table_multi_primary(item_num, item, item_info)
values(
		 (select	concat('ITEM_', lpad(nvl(max(item_num),0)+1,4,0)) from table_multi_primary),'물파리',
		 '바로 앞 라이더에게 유도성 물폭탄을 날려 바로 앞 순위의 라이더를 잠시 띄울 수 있다.');
commit;


-- delete  table_multi_primary where item_num='ITEM_0003';

insert into	table_multi_primary(item_num, item, item_info)
values(
		 (select	concat('ITEM_', lpad(max(substr(item_num, instr(item_num, '_')+1))+1,4,0))
from table_multi_primary),'물폭탄', '전방의 라이더들에게 큰 물폭탄을 날려 라이더들을 잠시 띄울 수 있다.');
commit;
select * from table_multi_primary;

-- 두 컬럼중 하나의 컬럼값 만 다른 경우 : '성공
insert into	table_multi_primary(item_num, item, item_info)
values('ITEM_0002','물파리', '전방의 라이더들에게 큰 물폭탄을 날려 라이더들을 잠시 띄울 수 있다.');
commit;
select * from table_multi_primary;

-- 두 컬럼이 모두 같은값을 가질 경우 : Error 발생
insert into	table_multi_primary(item_num, item, item_info)
values('ITEM_0002','물파리', '당하면 짜증남.');

 -- 둘 중 하나라도 null이 추가될 때 : Error 발생
insert into	table_multi_primary(item_num, item, item_info)
values('','물파리', '당하면 짜증남.');
insert into	table_multi_primary(item_num, item_info)
values('ITEM_0003','앞선 특정 라이더를 조준하여 미사일 발사 .');

--delete from dept
--where deptno = 30;

--rollback;
--select * from dept;

----------------------------------------------------------------------------------------------------------------
-- 가장 마지막 사원 번호보다 1증가한 값으로
-- 'EMMP_00007899'의 형식을 가진 값을 조회
-- 내가 푼 것
select     rownum as listno, empno1
from		(
select		'EMMP_'||lpad(empno+1, 8, '0') as empno1, hiredate
from		emp
order by		empno desc
)
where		rownum=1;
-- 강사 풀이
select		concat('EMP_', lpad(max(empno)+1, 8, 0)) as listno
from		emp;

select * from emp;
----------------------------------------------------------------------------------------------------------------

select * from table_primary;
select * from column_primary;
select *
from user_constraints;

