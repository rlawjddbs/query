-- 1. 아래의 조건에 맞는 테이블을 생성하고 적절한 제약사항을 부여한 후
--    모든 제약조건에 성공하는 경우와 각각의 경우에 따라 실패하는 모든 쿼리문을 작성하세요.

--    부서번호, 사원명, 연봉, 이메일, 전화번호, 성별, 주소, 입사일, 사원번호를 저장하는 테이블을 생성
--
--    제약사항
--    - 부서번호는 숫자 두자리이며 dept 테이블의 deptno만 입력할 수 있다.
--    - 사원명은 가변길이형이고 한글로 10글자까지 입력가능하며, 반드시 입력해야 한다.
--    - 연봉은 숫자이고 억 단위의 입력이 가능하다. 입력가능 연봉은 2400~8000까지 입력가능
--    - 이메일, 전화번호는 없을 수도 있지만 있다면 유일하다.
--    - 성별은 남자 또는 여자만 입력 가능하다.
--    - 주소는 없을 수도 있다.
--    - 입사일은 날짜형식이며, 추가할 때 입사일이 null이라면 현재 날짜가 입력되어야 한다.
--    - 사원번호는 숫자 4자리이며 null을 허용하지 않고 중복데이터를 저장할 수 없다.

-- 모든 에러상황과 성공상황에 대해 쿼리문을 작성한 후
-- foregin key에 해당하는 제약사항을 비활성화 시킨 후 삭제를 해보세요.
create table asdf(
	deptno	number(2)			constraint	fk_asdf_deptno references dept(deptno),
	ename	varchar2(30)		constraint fk_asdf_ename not null,
	sal			number(5)			constraint fk_asdf_sal	check(sal between 2400 and 8000) null,
	email		varchar2(96)		constraint fk_asdf_email unique,
	tell		varchar2(13)		constraint fk_asdf_tell unique,
	gen		varchar2(6)			constraint fk_asdf_gen check(gen='남자' or gen='여자'),
	addr		varchar(102)		constraint fk_asdf_addr null,
	hiredate	date					default sysdate,
	empno	number(4)			constraint fk_asdf_empno PRIMARY KEY
);

-- 성공
insert into asdf values(10, 'kim', 8000, 'kim@test.com', '010-1234-5678', '남자', '서울특별시 강남구 역삼동', sysdate, 1);
-- 실패(사원명 null)
insert into asdf values(20, '', 7999, 'la@test.com', '010-1234-5677', '여자', '서울특별시 강남구 청담동', sysdate, 2);
insert into asdf(deptno, sal, email, tell, gen, addr, hiredate, empno) values(30, 7998, 'bang@test.com', '010-1234-5676', '남자', '서울특별시 강남구 대치동', sysdate, 3);
-- 실패(연봉 범위 미만, 초과)
insert into asdf values(30, 'lee', 2399, 'lee@test.com', '010-1234-5675', '여자', '대구시 달서구 상인동', sysdate, 4);
insert into asdf values(10, 'dokgo', 8001, 'dokgo@test.com', '010-1234-5674', '여자', '대구시 달서구 도원동', sysdate, 5);
-- 성공(이메일 null)
insert into asdf values(20, 'kim', 2400, '', '010-1234-5673', '여자', '대구시 달서구 상인동', sysdate, 6);
-- 실패(이메일 중복)
insert into asdf values(30, 'yang', 8000, 'kim@test.com', '010-1234-5672', '남자', '경남 거창군 거창읍', sysdate, 7);
-- 성공(전화번호 null)
insert into asdf values(20, 'kim', 2400, 'lee@test.com', '', '남자', '경남 거창군 거창읍', sysdate, 7);
-- 실패(전화번호 중복)
insert into asdf values(30, 'hong', 3500, 'hong@test.com', '010-1234-5671', '남자', '거제시', sysdate, 8);
-- 실패(성별 입력 error)
insert into asdf values(10, 'ban', 4000, 'ban@test.com', '010-1234-5670', '여', '오류동', sysdate, 9);
insert into asdf values(20, 'bong', 5000, 'bong@test.com', '010-1234-5669', '남', '방배동', sysdate, 10);
insert into asdf values(30, 'choi', 4600, 'choi@test.com', '010-1234-5668', '남남', '월성동', sysdate, 11);
insert into asdf values(10, 'no', 4070, 'no@test.com', '010-1234-5667', '여여', '대명동', sysdate, 12);
-- 성공(주소 null)
insert into asdf values(20, 'hwang', 8000, 'hwang@test.com', '010-1234-5666', '남자', '', sysdate, 13);
-- 성공(날짜 직접 입력)
insert into asdf values(30, 'wang', 4000, 'wang@test.com', '010-1234-5667', '여자', '월성동', '2018-10-26', 14);
-- 성공(날짜 null)
insert into asdf values(10, 'kang', 4000, 'kang@test.com', '010-1234-5665', '남자', '복현동', '', 15);
insert into asdf(deptno, ename, sal, email, tell, gen, addr, empno) values(20, 'gong', 4120, 'gong@test.com', '010-1234-5664', '여자', '침산동', 16);
-- 실패(사원번호 중복)
insert into asdf values(30, 'jang', 7777, 'jang@test.com', '010-1234-5663', '남자', '산격동', sysdate, 16);
-- 실패(사원번호 null)
insert into asdf values(10, 'cho', 6666, 'cho@test.com', '010-1234-5662', '남자', '송현동', sysdate, '');

-- foreign key 제약사항 비활성화
alter table asdf disable constraint fk_asdf_deptno;
-- foreign key 제약사항 비활성화 테스트
insert into asdf values(77, 'kim', 8000, 'kim1@test.com', '010-2222-6666', '남자', '서울특별시 강남구 역삼동', sysdate, 18);
-- foreign key 제약사항 삭제
alter table asdf drop constraint fk_asdf_deptno;

select * from dept;
select * from asdf;

drop table asdf;
show recyclebin;
