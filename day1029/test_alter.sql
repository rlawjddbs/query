-- alter

-- 계정 잠그기 : 관리자만 가능
alter user scott account lock;
-- 계정 : system, 비번 : managerum
-- 계정 열기
alter user scott account unlock;

-- 비밀번호 바꾸기
-- 문자열이라 해서 따옴표 '  ' 로 감싸면 안 됨
alter user scott identified by tiger;

-- 일부러 오타를 낸 테이블 생성
create table test_atler(
	num		number,
	neam		varchar2(30),
	addr		number
);

-- 오타 내서 생성한 테이블 명 변경
alter table test_atler rename to test_alter;

-- 컬럼명 변경 : neam -> name
alter table test_alter rename column neam to name;

-- 컬럼의 테이터형 변경 : 레코드가 없으므로 데이터형까지 변경 가능
-- addr의 number 데이터형을 varchar2(100)
alter table test_alter modify addr varchar2(100) not null;

insert into test_alter(num, name, addr) values(1, '테스트', '서울시 강남구');
commit;

-- 데이터가 입력된 컬럼은 데이터형을 바꿀 수 없다. 데이터형을 변경 할 때에는 레코드가 비어있어야 한다.
alter table test_alter modify addr number;
-- 레코드가 존재할 때에는 동일 데이터형에 크기만 변경가능
alter table test_alter modify addr varchar2(200);

-- 컬럼 추가 : 추가되는 컬럼은 가장 마지막에 추가된다.
-- 레코드가 존재하지 않으면 모든 제약사항을 부여할 수 있다.
alter table test_alter add id varchar2(16);
-- 컬럼 삭제
alter table test_alter drop column addr;

-- 제약 사항 추가
-- 레코드의 구성이 제약사항을 만족하고 있는지 판단
update test_alter set id='test' where num=1;
alter table test_alter add constraint pk_test_alter primary key(id);

select * from test_alter;
select * from user_constraints where table_name='TEST_ALTER';

-- 제약사항 비활성화
alter table test_alter disable constraint pk_test_alter;
select * from user_constraints where table_name='TEST_ALTER';
-- 제약사항이 동작하지 않는다. 중복값이 입력된다.
insert into test_alter(num, name, id) values(2,'이재찬','test');
select * from test_alter;
-- 제약사항 활성화 : 레코드의 구성에 따라 다르다.
delete from test_alter where num=2;
alter table test_alter enable constraint pk_test_alter;

-- 제약사항 삭제
alter table test_alter drop constraint pk_test_alter;
select * from test_alter;
