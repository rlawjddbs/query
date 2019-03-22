select * from user_procedures;

-- 패키지에 포함된 함수 호출
-- 패키지명.함수명으로 작성해야 패키지 내부의 함수, 프로시저가 호출됨!
select test_pack.get_name('이재찬')
from dual;


-- 패키지에 포함된 프로시저 호출
-- 패키지명.함수명으로 작성해야 패키지 내부의 함수, 프로시저가 호출됨!
var age number;
exec test_pack.get_age(1988, :age);

print age;

-- 난수(Random number) : 컴퓨터가 임의의 수를 생성하여 반환하는 것.
-- dbms_random.value(시작, 한계수) - 숫자열의 난수를 얻는 함수
-- 1에서부터 시작하여 10 사이의 난수 얻기
select		trunc(dbms_random.value(1, 10)) /*1~10 사이의 값이 난수로 나타나며 한계수인 10은 나오지 않는다.*/
from		dual;

-- dbms_random.string('형식', 난수갯수) - 문자열의 난수를 얻는 함수
-- 형식 : u - 영문자 대문자, l - 영문자 소문자, a - 대,소문자 혼합, x - 대문자와 숫자혼합, p - 대문자, 소문자, 특수문자 혼합
select		dbms_random.string('u', 10), dbms_random.string('l', 10), dbms_random.string('a', 10), dbms_random.string('x', 10), dbms_random.string('p', 10)
from		dual;

-- 행운의 수, 귀인 찾기 패키지 실행
-- 행운의 수
select		lucky_pack.lucky_num()
from		dual;

-- 귀인찾기
var name varchar2(30);
execute lucky_pack.lucky_name(:name);

print name;


---

var cur refcursor;
execute lucky_pack.constraints_search('EMP', :cur);

--- 주민번호 생성기 테스트 1.
var ssn_num varchar2(28);
execute lucky_pack.create_ssn(1989, '여성', '제주도', :ssn_num);
print ssn_num;

var ssn_num varchar2(28);
execute lucky_pack.create_ssn(1989, '남성', '대구', :ssn_num);
print ssn_num;

-- 주민번호 생성기 테스트2 (강사님 코드)
var ssn char2(14);
execute lucky_pack.create_ssn('880101', '여자', '노진경', :ssn);
print ssn;

select * from class4_info;


select name, ssn, valid_ssn(ssn) from class4_info;


-- 1108 숙제12 테스트 1.
var res1;
var res2;
var res3;
execute work12_proc2('EMP', :res1, :res2, :res3);

print res1;
print res2;
print res3;

-- 숙제 테스트
---------------- 십이지신 함수 테스트 -------------
select lucky_pack.zodiac_sign('1989')
from dual;       

select		trunc(avg(to_char(sysdate, 'yyyy') - to_char(hiredate,'yyyy')),0)
from		emp
where		deptno = 10
group by deptno;

var msg varchar2;
execute lucky_pack.avg_work(101, :msg);
print msg;


drop trigger event_compare;
select * from user_triggers;


