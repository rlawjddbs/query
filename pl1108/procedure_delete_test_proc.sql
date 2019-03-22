-- 사원번호를 입력받아 test_proc테이블에서 삭제하는 procedure
create or replace procedure delete_test_proc(
	i_empno number, result_msg out varchar2, cnt out varchar2)
is

begin
	delete from test_proc
	where empno = i_empno;
	cnt := sql%rowcount;
	
	commit;
	
	if cnt = 1 then
		result_msg := i_empno||'번 사원 퇴사. 행복하세요~~!';
	else
		result_msg := i_empno||'번 사원은 존재하지 않습니다.';	
	end if;       
	
	exception
	when others then
		result_msg := '문제발생 '||sqlerrm;
end;
/
