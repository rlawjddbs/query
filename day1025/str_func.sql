-- 문자열 함수 사용.
-- 길이 : length(문자열)
select 'oracle길이' || length('oracle') || '자', length('테스트')
from dual;

-- 사원테이블에서 사원명, 사원명의 글자수를 조회
select		ename, length(ename)
from		emp;

-- 사원 테이블에서 사원명이 4자인 사원의 사원명을 조회
select		ename
from		emp
where		length(ename) = 4;

-- 사원테이블에서 사원명이 4자이상 사원의 사원명을 조회
select		ename
from		emp
where		length(ename) > 4;

-- 대문자 : upper
select		upper('Test'),upper('테스트AbcdE')
from		dual;

-- 소문자 : lower
select		lower('Test')
from		dual;

-- 사원 테이블에서 사원명이 'scott'인 사원의 사원번호, 사원명, 입사일, 연봉을 조회하세요.
select		empno, ename, hiredate, sal
from		emp
where		lower(ename) = 'scott';

select		empno, ename, hiredate, sal
from		emp
where		ename = upper('scott');

-- 사원 테이블에서 사원명을 모두 소문자로
select		lower(ename) ename
from 		emp;

-- 인덱스 얻기 : instr(문자열, 찾을 문자열)
select			instr('AbcdeF','A'), instr('AbcdeF','F'), instr('AbcdeF','c'), instr('AbcdeF','D'), instr('AbcdeF','K')
from			dual;
-- 마지막 instr 함수의 인자'D' 처럼 대,소문자가 안맞거나 없는 문자열을 입력하면 결과값이 첫번째 index 번호의 앞 번호가 나온다. (여기서는 0, 타 언어에서는 -1)

select * from CLASS4_INFO;
insert into CLASS4_INFO(num, name, email)values(6,'테스트','test@kr');
insert into CLASS4_INFO(num, name, email)values(7,'테스트1','test.kr');
commit;

-- 학생 테이블에서 번호, 이름, 이메일 조회
select 	num, name, email
from		class4_info;

select * from class4_info order by num asc;
commit;

-- 학생테이블에서 번호, 이름, 이메일, 이메일의 유효성 조회
select num,name,email, instr(email,'@'), instr(email,'.')
from class4_info;

-- 문자열 자르기 : substr(문자열, 시작인덱스, 자를 글자수) -----> 자를 글자수는 생략 가능하며, 생략시 시작인덱스부터 뒷 부분은 모두 잘려나간다.
select		substr('Abcdefg',4,3), substr('Abcdefg',2,5), substr('Abcdefg', 2), substr('Abcdefg', 3), substr('Abcdefg', 5)
from		dual;

-- class4_info 테이블에서 번호, 이름, 이메일 컬럼의 '메일 주소'만, '도메인 주소만' 조회 하세요.
-- test@test.com
select 	num, name, email, substr(email, 1, instr(email, '@')-1) as emailid, substr(email, instr(email, '@')+1) as domain
from		class4_info;


-- 공백제거 : 앞뒤 공백제거 trim, 앞 공백제거 : ltrim, 뒷 공백제거 : rtrim
select 	'['||trim('   A BC   ')||']', '['||ltrim('   A BC   ')||']', '['||rtrim('   A BC   ')||']',
			trim('a' from 'aaaaaaaOracleaaaaaa'),
			trim('-' from '----------Oracle----------')
from		dual;

-- 첫 글자를 대문자로 : initcap('문자열')
select		initcap('oracle java jsp jQuery SCOTT')
from		dual;

select 	initcap(ename)
from	    emp;

-- 문자열 붙이기 : concat('문자열','붙일문자열')
select		concat('ABC','DEF'), concat(concat('ABC','DEF'),'GHI'),
			'ABC'||'DEF'||'GHI'
from		dual;

-- 문자열 채우기
-- 문자열을 채울 시 영문은 1byte, 한글은 2byte의 memory를 차지함
-- 왼쪽으로 채우기 : lpad('문자열', 총 자릿수, '채울문자열')
select		lpad('ABCDE', 7, '$'), lpad('ABCDEFG', 10, 0)
from		dual;
-- 오른쪽으로 채우기 : rpad('문자열', 총 자릿수, '채울문자열')
select		rpad('ABCDEF', 10, '가'), rpad('ABC', 10, '#'), rpad('ABC', 10, '나')
from		dual;



select * from class4_info;
