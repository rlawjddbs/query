
-- 주민번호의 유효성 검증
select check_ssn('880101-123456'),
		check_ssn('88010-1234567'),
		check_ssn('88010110123456'),
		check_ssn('880101-1234567')
from dual;

select * from class4_info;
update class4_info
set		ssn='8801011-234567'
where num=5;

update class4_info
set		ssn='880101-123456'
where num=6;

commit;

-- class4_info 테이블에서 번호, 이름, 주민번호, 주민번호의 형식 체크하여
-- 모든 레코드를 조회
select		num,name,ssn, check_ssn(ssn)
from		class4_info;

-- 주민번호가 유효할 때 나이를 구하는 함수 사용
select get_age('880101-123456'),
		get_age('88010-1234567'),
		get_age('88010110123456'),
		get_age('880101-1234567'),
		get_age('880101-5234567'),
		get_age('000101-7234567'),
		get_age('990101-0234567')
from dual;

insert into class4_info(num, name, ssn) values(8, '제임스', '890307-5234567');
insert into class4_info(num, name, ssn) values(9, '혜리', '030107-4234567');
insert into class4_info(num, name, ssn) values(10, '오영군', '990107-9234567');
commit;
-- 번호, 이름, 주민번호, 나이 조회
-- 나이는 주민번호가 유효했을 때는 나이를 보여주고
-- 유효하지 않다면 0을 출력한다.

select num, name, ssn, get_age(ssn)||' 세' 나이
from class4_info;

-- 이메일 유효성 검증
select valid_email('a@b.c'),
		valid_email('@.'),
		valid_email('aaaaaaaaaaaab.c'),
		valid_email('aaaaaaaa@aaaaaaaabc'),
		valid_email('aaaaaa@aaaaaa.com')
from dual;

-- 번호, 이름, 이메일, 이메일의 유효성 조회
select	num, name, email, valid_email(email)
from	class4_info;


-- 1 ~ 9999999 까지 1씩 증가하는 시퀀스 작성
create sequence seq_item
increment by 1
start with 1
maxvalue 9999999
cache 10
nocycle;

select * from user_sequences;
select seq_item.nextval
from dual;
select seq_item.currval
from dual;

create table test_func(
	num char(10),
	name varchar2(30),
	input_date date default sysdate,
	constraint pk_test_func primary key(num)
);

-- 함수를 호출하여 지정된 형식의 번호를 얻기
-- 매개변수 없는 함수를 호출 할 때에는 ()를 붙이지 않아도 된다.
select item_num, item_num()
from dual;

-- 문자열 형식의 증가하는 번호를 사용하여 Table에 추가
insert into test_func(num, name) values(item_num(), '이재찬');
insert into test_func(num, name) values(item_num(), '이재현');
insert into test_func(num, name) values(item_num(), '정택성');
insert into test_func(num, name) values(item_num(), '김희철');

select * from test_func;


select valid_ssn('890906-1234567')
from dual;


select * from user_procedures;

select * from user_procedures
where object_type like 'P%';

var num number
exec proc_plus(11, 11, :num);
print num

select * from cp_emp2;
var insert_msg varchar2(30);
execute proc_insert_cpemp2(1111, '김정윤', 3000, :num, :insert_msg);

print num
print insert_msg
