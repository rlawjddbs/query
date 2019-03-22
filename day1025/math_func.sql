-- 수학함수
select		sin(25), cos(25), tan(25)
from		dual;

-- 절대값 : abs(값)
select		abs(25), abs(-25)
from		dual;

-- 반올림 : round(값, 자릿수)
select		round(7777.775, 2), round(777.777, -1)
from		dual;
-- 실수는 그 다음 뒷자리를, 정수부는 지정된 자릿수를 바로 반올림 한다.)

-- 절삭 : trunc(값, 자릿수)
select		trunc(777.777, 2), trunc(777.777, -1)
from		dual;

-- 올림 : ceil (값)
select		ceil(10.1), ceil(10.9)
from		dual;

-- 내림 : floor(값)
select		floor(10.9), floor(10.1)
from		dual;

-- 사원 테이블에서 사원번호, 사원명, 입사일, 연봉, 세금을 조회 단, 세금은 연봉 3.3%로 계산하고 십단위 절삭하여 출력
select		empno, ename, hiredate, sal, trunc(sal * 3.3 / 100, -1) as tax
from		emp;
