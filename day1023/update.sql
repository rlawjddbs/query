-- 조건에 맞는 레코드를 찾아 컬럼의 값을 변경하는 일
-- class4_info 테이블에서 학생의 번호가 "2"인 학생을 찾아서 이름을 '김희철'로 변경

/*
update	class4_info
set	name='김희철'
where	num=2;
*/

-- 학생의 번호가 10번인 학생을 찾아서 이름 - 박영민, 나이 - 25, 이메일 - lee@daum.net, 입력일 - 현재날짜로 변경

update	class4_info
set	name='박영민', age=25, email='lee@daum.net',
	input_date = sysdate
where	num=10;

commit;

-- 학생의 번호가 10번이면서 이름이 '박영민'인 학생의 주민번호를 '880101-1234567'로 변경

update	class4_info
set	ssn='880101-1234511'
where	num=11 and name='박영민';
-- where	(num=11 and name='박영민') or 기준값3	의 형태로 조건절을 더 추가할 수도 있음.

commit;