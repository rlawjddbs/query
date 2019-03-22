

set verify off
set serveroutput on
accept u_blood prompt '혈액형을 입력하세요 : '
accept u_score prompt '점수를 입력하세요 : '
accept u_name prompt '이름을 입력하세요 : '
accept u_traffic prompt '이용하는 교통수단을 입력하세요 : '
declare
	-- 1번 문제 변수
	blood varchar2(3) := '&u_blood';
	b_ment varchar2(100);
	-- 2번 문제 변수
	score number := &u_score;
	s_ment varchar2(16);
	-- 3번 문제 변수
	name varchar2(45) := '&u_name';
	n_ment char(6);
	l_name varchar2(6);
	f_name varchar2(39);
	-- 4번 문제 변수
	traffic	varchar2(30) := '&u_traffic';
	fee number;
	t_ment1 varchar2(100) := '출퇴근에 사용하는 교통수단은 '||traffic||'이고 기본 요금: '||fee||' 원입니다.';
	t_ment2 varchar2(100) := '왕복요금은 '||(fee*2)||'원이고, 한달 20일 기준 교통비는 '||(fee*40)||'원 입니다.';

begin
	-- 1. 혈액형을 입력받아 혈액형별 특징을 출력 하는 PL/SQL작성.
	--   -혈액형은 대소문자 모두 비교 가능 해야한다.
	--   -'A' : 내향적이다. 조심스럽고, 세심하다
	--   -'B' : 자기중심적이다. 규율이나 규칙, 속박을 극히 싫어한다.
	--   -'AB' : 합리적이다. 합리적인 반듯함을 선호하게된다.
	--   -'O' :  한결같은 노력과 추진력이 있다. 동료의식이 강하다
	if blood in ('A', 'B', 'AB', 'O') then
		if blood = 'A' then
		b_ment := '내향적이다. 조심스럽고, 세심하다.';
        elsif blood = 'B' then
        b_ment := '자기중심적이다. 규율이나 규칙, 속박을 극히 싫어한다.';
        elsif blood ='AB' then
        b_ment := '합리적이다. 합리적인 반듯함을 선호하게된다.';
        else b_ment := '한결같은 노력과 추진력이 있다. 동료의식이 강하다.';
        end if;
	dbms_output.put_line(blood||'형 특징 : '||b_ment);
	elsif blood in ('a', 'b', 'ab', 'o') then
	dbms_output.put_line('혈액형을 대문자로 입력해 주세요.');
	else dbms_output.put_line('** ERROR : 지구상에 존재하지 않는 혈액형 입니다..');
	end if;
	--	 2. 점수를 입력받아서
	--     100~90 사이면 'A'학점
	--     89~80 사이면 'B'
	--     79~70 사이면 'C'
	--     69~60 사이면 'D'
	--    그외 라면 '노력을 요함' 을 출력하는  PL/SQL을 작성하세요.
	if score between 0 and 100 then
		if score between 90 and 100 then s_ment := 'A학점';
			elsif score between 80 and 89 then s_ment := 'B학점';
			elsif score between 70 and 79 then s_ment := 'C학점';
			elsif score between 60 and 69 then s_ment := 'D학점';
			else s_ment := '노력을 요함';
		end if;
		dbms_output.put_line(s_ment);
	else dbms_output.put_line('** ERROR : 0 ~ 100 사이의 점수를 입력하세요');
	end if;
	-- 3. 이름을 입력받아 성과 이름을 출력하는  PL/SQL을 하세요.
	--    이름의 글자수가 3자 이하라면 '단성'으로 판단하고 4자 이상이라면
	--    '복성' 이라고 판단한다.
	--    단성- 성이 하나인 성 (예: 김,이,오,박),
	--    복성 - 성이 두개인성 (예 : 선우용녀, 재갈공명 등)
	--    출력은  성: 김  이름 : 희철
	if length(name) > 3 then
		n_ment := '복성';
		l_name := substr(name, 1, 2);
		f_name := substr(name, 3);
	elsif length(name) <= 3 and length(name) >= 2 then
		n_ment := '단성';
		l_name := substr(name, 1, 1);
		f_name := substr(name, 2);
	else dbms_output.put_line('** ERROR : 잘못된 이름 입력입니다.');
	end if;
	 dbms_output.put_line(name||'님은 '||n_ment||'이며');
	 dbms_output.put_line('성 :'||l_name||', 이름 : '||f_name||' 입니다.');

-- 4. 교통수단을 입력받아, '택시','버스','지하철' 인 경우에만
--   아래와 같은 요금으로 한달 교통비를 산정하세요.
--   택시 : 3800 -
--   버스 : 1200
--   지하철 :1250원
--   출력 : 출퇴근에 사용하는 교통수단은 'XX'이고 기본 요금: xx 원입니다.
--   왕복요금은 xx원이고, 한달 20일 기준 교통비는 xx원 입니다.
--   택시, 버스, 지하철이 아니라면  '대중교통이 아닙니다.' 를 출력하세요.
	if traffic= '택시' or traffic = '버스' or traffic = '지하철' then
		if traffic= '택시' then dbms_output.put_line('출퇴근에 사용하는 교통수단은 '||traffic||'이고 기본 요금: 3,800원입니다.');
		elsif traffic= '버스' then dbms_output.put_line('출퇴근에 사용하는 교통수단은 '||traffic||'이고 기본 요금: 1,200원입니다.');
		else dbms_output.put_line('출퇴근에 사용하는 교통수단은 '||traffic||'이고 기본 요금: 1,250원입니다.');
		end if;           
	else dbms_output.put_line('대중교통이 아닙니다.');
	end if;

end;
/
