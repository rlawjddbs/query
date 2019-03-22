-- replace :값을 치환하는 문자열 함수
-- replace(대상문자열, '변경하고 싶은문자', '변경할 문자')

select		replace('오늘은 목요일 입니다.','오늘은','내일은')
from		dual;

select		replace('정택성, 이재현, 이재찬, 김희철','이재찬','인천시의 자랑 반장 이재찬')
from		dual;

select * from user_objects;

drop table zipcode;
drop table cp_zipcode;

drop table emp;
purge recyclebin;

select * from zipcode;
