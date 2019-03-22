-- 시노님 생성
select * from user_synonyms;

create synonym tmp for table_multi_primary;
-- 시노님을 사용하여 DML 가능

select * from tmp;
select * from table_multi_primary;
insert into tmp(item_num, item, item_info) values('ITEM_0003', '바나나', '뒤에오는 라이더라 밟으면 미끄러짐');

-- 시노님 삭제
drop synonym tmp;

select * from user_synonyms;
