-- 변환 함수
-- 문자열이 아닌 값(숫자, 날짜)을 문자열로 변환
-- 숫자 -> 지정한 자리에 ,(쉼표)나 .(마침표)을 출력

-- 패턴값에 0을 입력할 경우
select		to_char(20181025, '0,000,000,000')
from		dual;

-- 패턴값에 9를 입력할 경우
select		to_char(20181025, '9,999,999,999')
from		dual;

select		to_char(2018.1025, '999,999.999')
from		dual;

-- 사원테이블에서 사원번호, 사원명, 입사일, 연봉 조회
-- 단, 연봉은 데이터가 있는 것까지만 ,를 넣어 출력
select		empno, ename, hiredate, to_char(sal, '9,999,999') as sal
from		emp;

select		to_char(to_date('2018-10-25', 'yyyy-mm-dd'),'mm')
from		dual;

-- to_char 함수로 반환되는 결과는 문자열이므로 연산되지 않는다.
select		to_char(sal, '9,999')+100
from		emp;

-- 날짜 -> 문자열 변환
-- y 하나당 년에 대한 자릿수
select		to_char(sysdate, 'y')
from		dual;

select		to_char(sysdate, 'yy')
from		dual;

select		to_char(sysdate, 'yyy')
from		dual;

select		to_char(sysdate, 'yyyy')
from		dual;

-- m 은 y처럼 하나만 쓸 수 없음
select		to_char(sysdate, 'yyyy-mm')
from		dual;

-- 패턴은 여러번 중복 출력 가능함
select		to_char(sysdate, 'yyyy-mm-yyyy')
from		dual;

select		to_char(sysdate, 'yyyy-mm-dd')
from		dual;

select		to_char(sysdate, 'yyyy-mm-dd hh')
from		dual;

select		to_char(sysdate, 'yyyy-mm-dd hh24')
from		dual;

select		to_char(sysdate, 'yyyy-mm-dd am hh')
from		dual;
select		to_char(sysdate, 'yyyy-mm-dd am hh24')
from		dual;

select		to_char(sysdate, 'yyyy-mm-dd am hh(hh24):mi:ss')
from		dual;

select		to_char(sysdate, 'yyyy-mm-dd am hh(hh24):mi:ss day')
from		dual;

select		to_char(sysdate, 'yyyy-mm-dd am hh(hh24):mi:ss dy')
from		dual;

-- pattern에 특수문자가 아닌 문자열 사용할때는 " "로 묶는다.
select		to_char(sysdate, 'yyyy"년 "mm"월 "dd"일" am hh(hh24)"시 "mi"분 "ss"초" dy"요일"')
from		dual;

select		to_char(sysdate, 'yyyy"년 "mm"월 "dd"일" am hh(hh24)"시 "mi"분 "ss"초" day')
from		dual;

-- pattern을 너무 길게 사용하면 error 발생
select		to_char(sysdate, 'yyyy " 년 " mm " 월 " dd " 일 " hh24 " 시 " mi " 분 " ss " 초 " ')
from		dual;

-- 칼럼을 하나 더 만들어 || 로 붙여주면 길어져도 결과값이 조회 됨
select		to_char(sysdate, 'yyyy " 년 " mm " 월 " dd " 일 "') ||
			to_char(sysdate, ' hh24 " 시 " mi " 분 " ss " 초 " ')
from		dual;

-- 사원 테이블에서 사원번호, 사원명, 입사일을 조회
-- 단, 입사일은 '년-월-일 요일'의 형식으로 출력
select		empno, ename, to_char(hiredate, 'yyyy-mm-dd day')
from		emp;

select		empno, ename, to_char(hiredate, 'yyyy"년 "mm"월 "dd"일 " day')
from		emp;

select		empno, ename, to_char(hiredate, 'yyyy-mm-dd day hh24:mi:ss')
from		emp;

-- 날짜도 크다, 작다가 비교된다. (비교연산자 사용가능)
-- 사원 테이블에서 입사년도가 '1981'년인  사원들의 사원번호, 사원명, 입사일, 연봉을 조회
select 	empno, ename, hiredate, sal
from		emp
where		to_char(hiredate, 'yyyy') = '1981';

select		empno, ename, to_char(hiredate, 'mm"월 "dd"일 입사"') as "81년 입사 월일", sal
from		emp
where		to_char(hiredate, 'yyyy') = '1981'
order by hiredate asc;

-- 현재 날짜가 아닌 날짜를 추가할 때
-- 날짜 형식의 문자열을 추가하면 된다.
insert into class4_info(num, name, input_date) values(8, '양세찬', '2018-10-21');
insert into class4_info(num, name, input_date) values(9, '양세형', to_date('2018-10-21','yyyy-mm-dd'));

select 	to_char(input_date, 'yyyy-mm')
from		class4_info;

-- to_char()는 날짜나 숫자를 입력받아야 한다.(함수의 값(인자, 매개변수 값)은 데이터형을 구분한다.
-- select		to_char('2018-10-25','mm') error
select		to_char('2018-10-25', 'mm')
from		dual;

select 	to_char(to_date('2018-10-25', 'yyyy-mm-dd'), 'mm')
from		dual;

-- 숫자 변환 : to_number('숫자형식의 문자열')
-- ex1) '10' 은 숫자형식의 문자열이므로 10으로 변환된다.
-- ex2) '월요일'은 숫자형식의 문자열이 아니므로  Error가 발생한다.
select		'25'-'10', to_number('25')-to_number('10'),
			to_number('월요일')
from		dual;

-- --------------------------------------------------------------------------------------------------------------------
-- 조건함수	:  decode(값, 비교값, 출력값, 비교값, 출력값, .... 비교값이 없을 때 출력 값)
-- --------------------------------------------------------------------------------------------------------------------
-- 사원 테이블에서 사원번호, 사원명, 연봉, 부서명 조회
-- 단, 부서명은 아래의 표에 해당하는 부서명으로 출력
-- 10 - 개발부, 20 - 유지보수부, 30 - 품질보증 솔루션 그 외에는 탁구부
select 	empno, ename, sal, deptno, decode(deptno, 10, '개발부', 20, '유지보수부', 30, '품질보증부', '탁구부') as dname
from		emp;

select 		empno, ename, sal, deptno, decode(deptno, 10, '개발부', 20, '유지보수부', 30, '품질보증부', '탁구부') as dname
from			emp
order by     deptno asc;

select 		empno, ename, sal, deptno, decode(deptno, 10, '개발부', 20, '유지보수부', '탁구부') as dname
from			emp
order by	    deptno asc;

-- 사원번호, 사원명, 보너스, 부서번호, 연봉, 인센티브 조회
-- 단, 인센티브는 부서별로 아래의 표와같이 차등지급
-- 사원번호 10 - 연봉의 20%, 20 - 연봉의 50%, 30 - 연봉의 30% 그 외 연봉의 5%
select		empno, ename, comm, deptno, sal, decode(deptno, 10, sal * 20 / 100, 20, sal * 50 / 100, 30, sal * 30 / 100, sal * 5 / 100) as incentive
from		emp;

select		empno, ename, comm, deptno, sal, decode(deptno, 10, sal * 0.2, 20, sal * 0.5, 30, sal * 0.3, sal * 5) as incentive
from		emp;
-- PL/SQL 에서는 decode 대신 case를 사용한다. (PL/SQlL에서는 decode 가 없기 때문)

-- --------------------------------------------------------------------------------------------------------------
-- case
-- 사원 테이블에서 사원번호, 사원명, 연봉, 부서명 조회
-- 단, 부서명은 아래의 표에 해당하는 부서명으로 출력
-- 10 - 개발부, 20 - 유지보수부, 30 - 품질보증 솔루션 그 외에는 탁구부
-- ---------------------------------------------------------------------------------------------------------------

select 		empno, ename, sal, deptno,
				case deptno	when	10	then	'개발부'
								when	20	then	'유지보수부'
								when	30	then	'품질보증부'
								else	'탁구부'
				end as dname
from			emp;

select 		empno, ename, sal, deptno,
				case deptno	when	10	then	'개발부'
								when	20	then	'유지보수부'
								when	30	then	'품질보증부'
								else	'탁구부'
				end as dname
from			emp
order by     deptno asc;

-- 사원번호, 사원명, 보너스, 부서번호, 총 수령액 조회
-- 총 수령액은 연봉 + 보너스 + 인센티브로 구성된다.
-- 사원번호 10 - 연봉의 20%, 20 - 연봉의 50%, 30 - 연봉의 30% 그 외 연봉의 5%

select			empno, ename, sal, deptno,
				case deptno	when 10	then	sal + nvl(comm, 0) + sal * 0.2
								when 20 then	sal + nvl(comm, 0) + sal * 0.5
								when 30 then	sal + nvl(comm, 0) + sal * 0.3
								else sal * 5
				end as total
from 			emp;

select			empno, ename, sal, deptno,
				case deptno	when 10	then	sal + nvl(comm, 0) + sal * 0.2
								when 20 then	sal + nvl(comm, 0) + sal * 0.5
								when 30 then	sal + nvl(comm, 0) + sal * 0.3
								else sal * 5
				end as total
from 			emp
order by		deptno desc;

-- 사원 테이블에서 사원번호, 사원명, 직무를 조회
-- 단, 직무의 첫 글자가 'C' - '파리목숨', 'S' - 돈벌어다 주는 애, 'M' - 감시인, 'A' - '살펴보는 사람', 'P' - 두목님
select 		empno, ename, job, decode(substr(job,1,1), 'C', '소모품', 'S', '돈벌어다 주는 애', 'M', '감시인', 'A', '살펴보는 사람', 'P', '두목님') as NICK
from			emp;

select			empno, ename, job,
				case substr(job, 1, 1)	when	'C'	then	'소모품'
											when	'S'	then	'돈벌어다 주는 애'
											when	'M'	then	'감시인'
											when	'A'	then	'살펴보는 사람'
											when	'P'	then	'두목님'
				end as NICK
from			emp;

select			empno, ename, job,
				case substr(job, 1, 1)	when	'C'	then	'소모품'
											when	'S'	then	'돈벌어다 주는 애'
											when	'M'	then	'감시인'
											when	'A'	then	'살펴보는 사람'
											when	'P'	then	'두목님'
				end as NICK
from			emp
order by		NICK asc;


select * from emp;
