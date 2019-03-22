-- 테이블의 모든 레코드를 삭제하거나, 조건에 맞는 특정 레코드를 삭제할 때 사용하는 쿼리 delete

-- 모든 레코드를 삭제 할 때
-- delete from class4_info;

-- 특정 레코드만 삭제 할 때 ex) 학생의 번호가 11번인 학생의 레코드 삭제
/*
delete	from	class4_info
where	num=11;
*/

-- truncate는 테이블의 레코드를 절삭한다.
/*
truncate table class4_info;
*/

-- 필요없는 테이블 삭제.
-- 삭제된 테이블은 Oracle10g 부터 휴지통으로 이동한다.

drop table class4_info;

-- 휴지통 보기 : sqlplus문
-- show recyclebin;

-- 휴지통 비우기 : sqlplus문
-- purge recyclebin;

-- 휴지통 테이블 복구 : sqlplus문
-- flashback table 원본 테이블명 to before drop;