-- null 변환
-- 레코드를 추가할 때 컬럼을 명시하지 않으면 null이 됨
-- varchar2(char) : 컬럼을 명시하지 않거나, '' 인 경우, null이 됨
-- number, date : 컬럼을 명시하지 않은 경우

-- 사원 테이블에서 사원명, 연봉, 보너스 조회
-- 단, 보너스가 없는 사원들은 100으로 출력
select		ename, sal, nvl(comm, '100')
from		emp;

-- 우편번호 테이블에서 입력한 동의 우편번호, 시도, 구군, 동, 번지 조회
-- 단, 번지가 없다면 '번지없음'을 출력

select 	zipcode, sido, gugun, dong, nvl(bunji, '번지없음')
from		zipcode
where		dong like '역삼1동%';

-- class4_info 테이블에서 번호, 이름, 입력일 조회
-- 단, 입력일이 없다면 현재 날짜를 출력

select		num, name, nvl(input_date, sysdate)
from		class4_info;



select * from emp;

