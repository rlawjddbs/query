create or replace package body lucky_pack
as
	--------------- lucky_num 시작 ------------------
	function lucky_num return number
	is
	begin
		return trunc(dbms_random.value(1, 46));
	end lucky_num;
	--------------- lucky_num 끝 ------------------
	
	--------------- lucky_name 시작 ------------------
	procedure lucky_name(name out varchar2)
	is
		type name_tab is table of varchar2(30) index by binary_integer;
		name_arr name_tab;
		
		temp_num number;
	begin
		name_arr(1) := '공선의';
		name_arr(2) := '이봉현';
		name_arr(3) := '백인재';
		name_arr(4) := '김정윤';
		name_arr(5) := '박소영';
		name_arr(6) := '최혜원';
		name_arr(7) := '이재찬';
		
		temp_num := trunc(dbms_random.value(1, name_arr.count+1));
		name := name_arr(temp_num);
	end lucky_name;
	--------------- lucky_name 끝----------------- 
	
	--------------- 1108_숙제 constraints_search 프로시저 시작 --------------------------------------
	procedure constraints_search
	(tname varchar2, tab_info out sys_refcursor)
	is
	
	begin
	open tab_info for
	select   utc.constraint_name,   utc. column_name,
	    	(select distinct data_type 
    		from user_tab_columns
	    	where user_tab_columns.column_name=utc. column_name ) data_type
	from user_constraints uc, user_cons_columns utc
	where (uc.constraint_name=utc.constraint_name ) and utc.table_name ='EMP';

	end constraints_search;
	--------------- 1108_숙제 constraints_search 프로시저 끝 -----------------------------------------  
	
	
	
	----------------- 생년월일, 성별, 지역을 입력받아 주민번호를 생성하여 --------------------------
	-------------- out parameter에 설정하는 procedure ------------------------------------------------
	--  출생지역은  880101-1xx1111 에서 xx 두자리 이고 
	--  아래의 표와 같다. 
	--  서울시 : 00~08
	-- 	부산시 : 09~12
	--	인천시 : 13~15
	--	경기도 : 16~25
	--	강원도 : 26~34
	--  충청도 : 35~47
	--	전라도 : 48~66
	--	경상도 : 67~92
	--	제주도 : 93~95
--	procedure create_ssn
--	(birth in varchar2, gender in varchar2, loc in varchar2, ssn out varchar2)
--	is
--		
--	begin
--		if length(birth_year) = 4 and gen in ('남성', '여성') and 
--		loc in ('서울시','부산시','인천시','경기도','강원도','충청도','전라도','경상도','제주도') then 
--			
--		else ssn := '이상함';
--		end if;
--		
--	end create_ssn;   
	procedure create_ssn
	(birth in varchar2, gender in varchar2, name in varchar2, ssn out char)
	is
		-- 주민번호를 저장할 테이블
		type ssn_tab is table of number(1) index by binary_integer;
		-- 생성한 테이블을 변수에 저장
		ssn_arr ssn_tab;
		
		gender_num number := 2;		/*주민번호 기본값 2(여자)*/
		temp_num number := 0;
		flag_num number := 2;
		temp_ssn varchar2(5);
		
		ssn_value varchar2(14);
	begin
		-- 입력받은 생년월일을 ssn_tab에 추가
		for i in 1 .. length(birth) loop
			ssn_arr(i) := substr(birth, i, 1);
		end loop;
		
		-- 성별 채우기1900년대 생인지 2000년대 생인지 확인
		if gender = '남자' then
			gender_num := 1;
		end if;

		ssn_arr(7) := gender_num;
		
		-- 나머지 번째 방 값을 채운다.
		-- 880101123456x
		for i in 8 .. 12 loop
			ssn_arr(i) := trunc(dbms_random.value(0, 10), 0);
		end loop;
		
		for i in 1 .. ssn_arr.count loop
			--생성된 주민번호를 가지고 끝자리를 채우기 위한 연산
			temp_num := temp_num + ssn_arr(i) * flag_num;
			
			flag_num := flag_num + 1;
			if flag_num = 10 then
				flag_num := 2;
			end if;
		end loop;
		
		-- 채워진 값으로 끝자리 설정
		ssn_arr(13) := mod(11 - mod(temp_num, 11), 10);
		
		ssn_value:= birth||'-'||gender_num||ssn_arr(8)||ssn_arr(9)||ssn_arr(10)||ssn_arr(11)||ssn_arr(12)||ssn_arr(13);
		-- 생성된 주민번호를 class4_info에 추가
		insert into class4_info(name, ssn)
		values(name, ssn_value);
		
		ssn := ssn_value;
		
		commit;		
	end create_ssn;
    ------------------------------------ 주민번호 생성기 끝 -----------------------------------------------  

	------------------------------------ 1109_숙제.1 십이지신 함수 시작 -----------------------------------------------
	--1.  lucky_pack 패키지에 태어난해를 입력받으면 띠를 반환하는 
	--   함수를 추가하세요.
	--   띠 - 태어난해를 12로 나눈 나머지가 
	--   11이면 양띠, 10- 말, 9-뱀,8-용,7-토끼,6-호랑이,5-소,4-쥐,3-돼지,
	--   2-개,1-닭,0-원숭이  
    function zodiac_sign(birth varchar2) return varchar2
    is
    	re_val varchar2(4); 
    	sign_name varchar2(9);
    	
    begin
    	re_val := mod(birth, 12);
		if re_val = 11 then sign_name := '양'; end if;
		if re_val = 10 then sign_name := '말'; end if;
		if re_val = 9 then sign_name := '뱀'; end if;
		if re_val = 8 then sign_name := '용'; end if;
		if re_val = 7 then sign_name := '토끼'; end if;
		if re_val = 6 then sign_name := '호랑이'; end if;
		if re_val = 5 then sign_name := '소'; end if;
		if re_val = 4 then sign_name := '쥐'; end if;
		if re_val = 3 then sign_name := '돼지'; end if;
		if re_val = 2 then sign_name := '개'; end if;
		if re_val = 1 then sign_name := '닭'; end if;
		if re_val = 0 then sign_name := '원숭이'; end if;

		return sign_name;
    end zodiac_sign;
	------------------------------------ 1109_숙제.1 십이지신 함수 끝 --------------------------------------------------      
	
	
	------------------------------------------------------------------------------------------------------------------------------------------
	------------------------------------ 1109_숙제.2 평균 근속 년수 프로시저 시작 --------------------------------------------------
	------------------------------------------------------------------------------------------------------------------------------------------  	
	--2. lucky_pack 패키지에 부서번호를 받아 emp 테이블에서 부서별
	--   사원의 평균 근속년수를 out_parameter에 설정하는 procedure를
	--   추가하세요.
	procedure avg_work(u_deptno in number, result out varchar2)
	is
		temp_avgwork varchar2(8);
	begin
		select		trunc(avg(to_char(sysdate, 'yyyy') - to_char(hiredate,'yyyy')),0)
		into		temp_avgwork
		from      emp
		where		deptno = u_deptno 
		group by deptno;
		
		result := u_deptno||'번 부서의 평균 근속년수는 '||temp_avgwork||'년 입니다.';
		
		exception 
			when no_data_found then
			result := u_deptno||'번에 해당되는 부서는 없습니다!';
	end avg_work;
	------------------------------------ 1109_숙제.2 평균 근속 년수 프로시저 끝 --------------------------------------------------
	----------------------------------------------------------------------------------------------------------------------------------------

end lucky_pack;
/








