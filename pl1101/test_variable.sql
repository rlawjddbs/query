set serveroutput on
declare
	-- 1. 변수 선언 : 변수명 데이터형(크기);
	name varchar2(60);
	-- 테이블의 컬럼을 참조하여 변수 선언
	e_name	emp.ename%type;
	-- 테이블의 모든 컬럼을 참조하여 변수 선언 (record type)
	row_type cp_emp%rowtype;
begin
	-- 2. 값 할당 : 변수명 := 값
	name := '홍길동';
	dbms_output.put_line('이름 : '||name);
	name := '이재찬';
	-- 3. 사용 : 출력, 연산참여, 재할당
	dbms_output.put_line('이름 : '||name);
	
	e_name := '이재현';
	dbms_output.put_line('참조변수 사용 : '|| e_name);
	
	--record type 변수사용 : 변수명.컬럼명
	row_type.empno := 1111;
	row_type.ename := '정택성';
	row_type.hiredate := sysdate;
	row_type.sal := 2800;
	
	dbms_output.put_line('사원번호 : '||row_type.empno||', 사원명 : '||row_type.ename||', 입사일 : '||to_char(row DECODE( _type.hiredate, 'yyyy-mm-dd dy')||', 연봉 : '||row_type.sal);
end;
/
