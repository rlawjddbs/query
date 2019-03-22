-- 조회되는 레코드의 소계조회
-- 숙제
-- 1. 사원 테이블에서 사원번호,사원명, 연봉, 보너스를 조회
--   단, 사원 번호를 내림차순 정렬 했을 때 3~5사이의 레코드만 출력 하고
--  연봉은 7자리로 맞춰 출력하고 ,를 넣어 출력한다.
--  해당 자리에 값이 없으면 0을 출력한다. 
select		rownum as rank, empno, ename, sal, bonus
from		(
			select		empno, ename, sal, bonus
			from		emp
			order by	empno desc;
            )

select		sal_rank, empno, ename, to_char(sal,'0,000,000'), bonus
from		(
			select			rownum as sal_rank, empno, ename, sal, bonus
			from			(
							 select			empno, ename, sal, nvl(comm, 0) as bonus
				 			 from			emp
							 order by		empno desc
			)
)
where		sal_rank between 3 and 5;

select		sal_rank, empno, ename, to_char(sal,'0,000,000'), bonus
from		(
			select			rownum as sal_rank, empno, ename, sal, bonus
			from			(
							 select			empno, ename, sal, nvl(comm, 0) as bonus
				 			 from			emp
							 order by		empno desc
			)
)
where		sal_rank=3 or sal_rank=4 or sal_rank=5;

select * from emp;
-- 2. class4_info 테이블에서 번호, 이름 , 나이, 태어난 해를 조회 하세요.
--   태어난 해는 현재년도-나이+1 로 구합니다.
select		num, name, age, to_char(sysdate, 'yyyy')-age as born_year
from		class4_info
order by	num asc;

select * from class4_info;

-- 3. class4_info 테이블의 번호, 이름 나이, 이메일, 이메일의 유효성 여부를
--   조회.
--   단, 이메일의 유효성은 '@' 이 없으면 '무효', '@'이 존재하면 '유효'를출력
select num, name, age, email, decode (email_check, 0, '무효', null, '무효', '유효') check_
from(
		select	num, name, age, email, instr(email, '@') as email_check
		from	class4_info
	   );

select num, name, age, email,
		case email_check 	when 0 then '무효'
								when null then '무효'
								else '유효'
		end as check_
from(
		select	num, name, age, email, nvl(instr(email, '@'),0) as email_check
		from	class4_info
	   );
-- 4. car_model 테이블에서 옵션에 'ABS'나 '에어백'이 있는 차량의
--    모델명,년식,가격,옵션, 이미지, 제조사를 조회 하세요.
--    단, 가격의 오름차순으로 정렬하여 출력할 것
select model, car_year, price, car_option, car_img,
		case model	when 'K5'			then '기아'
						when	'아반테'   then '현대'
						when '소렌토'	then '기아'
						when 'A8'		then '아우디'
						when '체어맨'	then '쌍용'
						when 'SM7'		then '르노삼성'
						when 'SM3'		then '르노삼성'
						when	'액센트'	then '현대'
						when 'A4'		then '아우디'
						when '그랜저'	then '현대'
						when 'QM5'		then '르노삼성'
						else '대포차'
		end as made_in
from	car_model
where	car_option like '%에어백%' or car_option like '%ABS%'
order by price asc;

select * from car_model;
-- 5. car_model 테이블에서 모델명이 '아반테', '소렌토', 'A8'인 차량의
--    모델명,모델별 가격 총합과 소계, 총계를 조회 하세요.
select             model, sum(price)
from				car_model
where				model in ('아반테', '소렌토', 'A8')
group by			rollup(model, price);

select             model, sum(price)
from				car_model
where				model in ('아반테', '소렌토', 'A8')
group by			rollup(model);

select * from car_model
where model='아반테'
-- 6. car_model 테이블에서 차량 가액이 1500~3000 사이인 차량의
--   모델명, 년식, 가격, 옵션, 입력일, 가격별 순위를 조회하세요.
--   단, 가격별 순위는 중복되지 않는 번호가 출력되어야합니다.
select			model, car_year, price, car_option, hiredate, row_number() over(order by price asc)
from			car_model
where			price >= 1500 and price <= 3000;

select			model, car_year, price, car_option, hiredate, row_number() over(order by price asc)
from			car_model
where			price between 1500 and 3000;

-- 7. 사원 테이블에서 입사년도가 1981년 이상이면서 매니저가 있는  사원의
--   사원번호,사원명,연봉,매니저번호, 연봉 순위를 조회 하세요.
--   단, 연봉순위는 동일한 연봉일 때 동일한 순위를 보여줍니다.
select			empno, ename, sal, mgr, rank() over(order by sal asc) as sal_rank /*hiredate*/
from			emp
where			to_char(hiredate, 'yyyy') >= 1981;


select * from CAR_MAKER;
select * from CAR_MODEL;
