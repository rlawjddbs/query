select rowid, empno from emp;
-- 인덱스 조회
select * from user_indexes;

create table cp_zipcode as (select * from zipcode);

-- 테이블의 레코드 개수 확인
select count(*) from cp_zipcode;
select count(*) from zipcode;

-- cp_zipcode테이블에 seq컬럼에 unique index 설정
create index idx_zipcode on cp_zipcode(seq);
drop index idx_zipcode;
create unique index idx_zipcode on cp_zipcode(seq);

select * from user_indexes;


-- 인덱스를 사용하지 않는 조회 (fullscan : 위에서부터 하나씩 내려가면서 전체 레코드를 검색)
select zipcode, sido, gugun, bunji, seq from zipcode where seq=49000;
select 	count(zipcode), zipcode
from		zipcode
group by	zipcode;
where 	zipcode='402-866';
-- 인덱스를 사용한 조회 (레코드가 적을 땐 더 느릴 수 있으나 레코드가 많을 땐 훨씬 빠름)
select /*+ ordered index (idx_zipcode)*/zipcode, sido, gugun, bunji, seq from cp_zipcode where seq=4000;
select /*+ ordered index (bit_zipcode)*/zipcode, sido, gugun, bunji, seq from zipcode where zipcode='402-866';
select 	count(zipcode), zipcode
from		zipcode
group by	zipcode;
where 	zipcode='402-866';


-- 우편번호는 중복되지만 독특한 형태를 가진다.
-- 안돼서 지움(???)
-- create bitmap index bit_zipcode on cp_zipcode(zipcode);
create index bit_zipcode on cp_zipcode(zipcode);
select * from user_indexes;

-- 인덱스는 실제 테이블이 변경되면 변경사항을 적용하지 않는다.
-- 테이블과 인덱스를 동일하게 맞추는 쿼리
alter index idx_zipcode rebuild;
select * from user_indexes;
