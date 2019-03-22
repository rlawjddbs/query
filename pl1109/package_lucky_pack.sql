create or replace package lucky_pack
as
	-- 행운의 수 1~45 중 하나를 얻는 패키지 함수
	function lucky_num return number;
	
	-- 귀인얻기 패키지 프로시저
	procedure lucky_name(name out varchar2);    
	
	--------------- 1108_숙제 constraints_search 프로시저
	procedure constraints_search(tname varchar2, tab_info out sys_refcursor);
	
	-- 생년월일, 성별, 지역을 입력받아 주민번호를 생성하여
	-- out parameter에 설정하는 procedure
	--	procedure create_ssn(birth in varchar2, gender in varchar2, loc in varchar2, ssn out varchar2);

	-- 생년월일, 성별, 이름을 입력받아 주민번호를 생성하여
	-- out parameter에 설정하고 class4_info 테이블에
	-- 추가하는 procedure 작성
	procedure create_ssn(birth in varchar2, gender in varchar2, name in varchar2, ssn out char);
	
	
	--숙제
	--1.  lucky_pack 패키지에 태어난해를 입력받으면 띠를 반환하는 
	--   함수를 추가하세요.
	--   띠 - 태어난해를 12로 나눈 나머지가 
	--   11이면 양띠, 10- 말, 9-뱀,8-용,7-토끼,6-호랑이,5-소,4-쥐,3-돼지,
	--   2-개,1-닭,0-원숭이
	function zodiac_sign(birth varchar2) return varchar2;
	
	--2. lucky_pack 패키지에 부서번호를 받아 emp 테이블에서 부서별
	--   사원의 평균 근속년수를 out_parameter에 설정하는 procedure를
	--   추가하세요.
	procedure avg_work(u_deptno in number, result out varchar2);
end;
/
