--Transaction 취소
-- savepoint를 설정하여 특정 지점까지 작업 취소
-- Transaction이 여러개의 쿼리로 이루어진 경우 savepoint를 사용하면 된다.

savepoint insert_a;
insert into class4_info(num, name, email)
values(21, '테스트','test@test.com');

savepoint insert_b;
insert into class4_info(num, name, email)
values(22, '테스트1','test@test.com');

savepoint update_c;
update	class4_info
set	name='연습3'
where	num=22;

savepoint delete_d;
delete from class4_info
where num=22;

-- 특정 작업 수행후 commit 하면 롤백 불가능

-- rollback to delete_d;
-- rollback to update_c;
-- 위와 같이 말아올릴 수 있다. (== 포토샵 -> 특정 히스토리 내역까지 작업취소)