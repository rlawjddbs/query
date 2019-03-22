--숙제 
--1. 입사년도를 입력받아 근속년수가 10년 이상이면 '장기근속'
--  그렇지 않으면 '단기근속'이라는 메세지를 반환하는 함수 작성.
--
--2.  주민번호를 입력받아 성별을 반환하는 함수 작성
--
--3. 주민번호를 입력받아 출생지역을 반환하는 함수 작성
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

set serveroutput on
set verify off

accept u_hiredate prompt '입사년도: '
accept u_ssn prompt '주민번호 : '
declare
--	hiredate = '&u_hiredate';	
begin
	dbms_output.put_line(years_of_service('&u_hiredate'));
	dbms_output.put_line(check_gen('&u_ssn'));
	dbms_output.put_line(check_loc('&u_ssn'));	
end;
/