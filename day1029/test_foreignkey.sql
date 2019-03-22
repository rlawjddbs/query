-- 외래키(foreign key) : 다른 테이블(부모)의 값으로만 값을 추가해야 할 때 사용한다.
-- null, 중복값을 허용한다. (1 대 다관계를 허용)

-- 컬럼단위 제약사항 : foreign key 를 기술하지 않는다.
-- table_primary 테이블의 id값 참조하여 데이터를 추가하는
-- foreign key 설정
-- 자식 테이블의 컬럼명은 같을 필요는 없고, 데이터형과 크기만 맞춰주면 된다.
create table column_foreign(
	f_id varchar2(20) constraint fk_f_id foreign key
	references table_primary(id),
	tel varchar2(13),
	address varchar2(400)
);
create table column_foreign(
	f_id varchar2(20) constraint fk_f_id
	references table_primary(id),
	tel varchar2(13),
	address varchar2(400)
);

-- 추가 성공
-- 부모테이블에 존재하는 값으로 추가

insert into column_foreign(f_id, tel, address)
values('kim', '010-6784-9713','SM');

insert into table_primary(name, id, passwd) values('test', '010-1234-5678', '5678');
select * from table_primary;
commit;

insert into column_foreign(f_id, tel, address)
values('test', '010-6784-9713','서울시 강남구 한독빌딩');

-- 같은 아이디로 값을 추가할 수 있다. (중복허용)
-- null 허용
insert into column_foreign(f_id, tel, address)
values('', '010-6784-9713','서울시 강남구 한독빌딩');

-- 부모 테이블에 없는 값을 추가하면 error
insert into column_foreign(f_id, tel, address)
values('kim1', '010-6784-9713','JYP');

-- 부모테이블은 참조하는 자식 레코드가 존재한다면 삭제되지 않는다.
savepoint save1;
insert into TABLE_PRIMARY(name, id, passwd) values('강호동','kang','1234');
commit;

-- kang 참조하는 레코드가 존재하지 않으므로 삭제가 된다.
delete from table_primary where id='kang';
-- kim 이나 test는 참조하는 레코드가 존재하므로 삭제 불가
delete from table_primary where id='kim';

-- on delete cascade를
-- 참조하는 자식레코드를 모두 삭제하고
-- 부모레코드를 삭제한다.
delete from column_foreign where f_id='kim';
delete from table_primary where id='kim';
commit;
-- 테이블 단위 제약사항
create table table_foreign(
	id					varchar2(20),
	java_score   		number(3),
	oracle_score     number(3),
	constraint	fk_table_foreign_id foreign key(id) references table_primary(id)
);

-- 부모 테이블에 존재하는 값으로 추가
select * from table_primary;
insert into table_foreign(id, java_score, oracle_score) values('kim',97,78);
commit;
insert into table_foreign values('010-1234-5678', 50, 50);
-- null 도 허용함
insert into table_foreign values('', 100, 98);

-- 참조하는 자식 레코드가 존재한다면 부모테이블에서 바로 삭제 불가
delete from table_primary where id='kim';

select * from table_primary;
insert into table_primary(name, id, passwd) values('송중기','song','1234');
insert into table_primary(name, id, passwd) values('공유','gong','1234');
commit;


-- 부모레코드를 삭제하면 참조하는 모든 자식 레코드를
-- 삭제하고 부모레코드를 삭제하는 on delete cascade 사용
create table test_cascade(
	id				varchar2(20),
	address       varchar2(100),
	constraint	fk_test_id		foreign key(id)	references	table_primary(id)
	on delete cascade
);

insert into test_cascade(id, address) values('song', '강남구 역삼동');
insert into test_cascade(id, address) values('gong', '강남구 역삼동');
commit;
select * from test_cascade;

-- on delete cascade가 설정되면 부모 레코드가 삭제될 경우,
-- 자식 레코드도 함께 삭제된다.
delete from table_primary where id='song';
select * from table_primary;
select * from test_cascade;

delete from table_primary where id='gong';
select * from table_primary;
select * from test_cascade;
-- 자식 레코드가 on delete cacade가 설정되어 있지 않은 경우, 자식 레코드에 참조된 부모 레코드는 삭제할 수 없다.
-- 이 경우 일일이 자식 레코드를 먼저 삭제한 후, 부모 레코드를 삭제해야 올바르게 삭제된다.
delete from table_primary where id='kim';


select * from user_indexes;

x