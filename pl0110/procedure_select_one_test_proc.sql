/*
사원번호를 입력받아 사원명, 연봉, 직무, 입사일을 조회하는 procedure
*/
create or replace procedure select_one_test_proc (
	i_empno in number, emp_cur out sys_refcursor, err_msg out varchar2)
is

begin
	err_msg := '성공';
	open emp_cur for
		select ename, sal, job, to_char(hiredate, 'yy-mm-dd day') as hiredate
		from test_proc
		where empno = i_empno;
		
	exception 
		when others then
		err_msg := '문제발생 : ' || sqlerrm;
end;
/
