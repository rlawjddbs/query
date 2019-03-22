-- cp_emp2 테이블에 사원번호, 사원명, 연봉을 추가하고
-- 추가된 행의 수를 외부로 반환하는 Procedure 만들기

create or replace procedure proc_insert_cpemp2(
	empno in cp_emp2.empno%type,
	ename cp_emp2.ename%type,
	sal cp_emp2.sal%type,
	cnt out number,
	msg out varchar2)
is

begin
     
     insert into cp_emp2(empno, ename, hiredate, sal) values(empno, ename, sysdate, sal);
     
     cnt := sql%rowcount;
     msg := '추가성공';
     
     commit;
     
     exception
     when others then
     	cnt := 0;
     	msg := '추가실패';
     
end;
/

-- 1. bind 변수 선언 : var 변수명 number
-- 2. 프로시저 실행 : exec proc_insert_cpemp2(사원번호, 사원명, 연봉, :변수명);
-- 3. bind 변수 값 출력 : print 변수명