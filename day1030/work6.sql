------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 숙제전 한번 해줘야 함
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
update		car_model
set				car_img='qm5_001.jpg'
where			car_img='qm5_001.jpg,qm5_002.jpg';
update		car_model
set				car_img='qm5_003.jpg'
where			car_img='qm5_003.jpg,qm5_004.jpg';
update		car_model
set				car_img='qm5_005.jpg'
where			car_img='qm5_005.jpg,qm5_006.jpg';
commit;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select * from car_country;
select * from car_maker;
select * from car_model;
-- http://www.gurubee.net/lecture/1021 참고하여 SQL 아우터 조인 공부해볼 것!

--숙제.
--1. 배기량이 1500~3000 사이인 차량의 제조국,제조사,모델명,년식,가격,
--    이미지,입력일,배기량, 옵션을 조회
--   단. 출력은 배기량의 내림차순 정렬했을때 3~6번째 레코드만 조회하고,
--     옵션은 처음 ',' 까지만 출력 할것. 가격과 연식은 3자리마다 ,를 넣어출력,
--     입력일은 월-일-년 의 형식으로 출력 할것.
select				rank, country, maker, model, car_year, price, car_img, hiredate, cc, car_option
from				(
					select				rownum as rank, country, maker, model, car_year, price, car_img, hiredate, cc, car_option
					from				(
										select				cc.country, cc.maker, cma.model, to_char(cmo.car_year,'9,999,999') as car_year, to_char(cmo.price,'9,999,999') as price, cmo.car_img, to_char(cmo.hiredate,'mm-dd-yyyy') as hiredate, cmo.cc, substr(cmo.car_option, 1, instr(cmo.car_option, ',')) as car_option
										from				car_country cc, car_maker cma, car_model cmo
										where				(cc.maker = cma.maker and cma.model = cmo.model) and cmo.cc >= 1500 and cmo.cc <= 3000
										order by			cmo.cc desc
					                    )
                    )
where				rank >= 3 and rank <= 6;

--2. 부서번호가 10과 30,40번인 모든 부서의 사원번호,사원명,입사일,
--   연봉,연봉순위,부서명,부서번호,위치, 우편번호,시도, 구군,동,번지 를 조회.
--  단,출력은 사원번호의 오름차순으로 정렬했을 때 2~5번째 레코드만 출력,
--  우편번호는 '-' 뒤부터 끝까지 출력, 번지가 없다면 '번지없음'으로 대체
--  하여 출력 ,입사일은 월-일-년 요일까지 출력
select			no, empno, ename, hiredate, sal, sal_rank, dname, deptno, loc, zipcode, sido, gugun, dong, nvl(bunji, '번지없음') as bunji
from			(
				select			rownum as no, empno, ename, hiredate, sal, sal_rank, dname, deptno, loc, zipcode, sido, gugun, dong, bunji
				from			(
								select			empno, ename, hiredate, sal, rownum as sal_rank, dname, deptno, loc, zipcode, sido, gugun, dong, bunji
								from			(
												select 		e.empno, e.ename, e.hiredate, e.sal, d.dname, d.deptno, d.loc, z.zipcode, z.sido, z.gugun, z.dong, z.bunji
												from	        emp e, dept d, zipcode z
												where			(e.deptno(+) = d.deptno and z.seq=e.empno) and e.deptno in (10, 30, 40)
												order by		sal desc
				                				)
								order by		empno asc
								)
				)
where			no >= 2 and no<=5;

--3. 차량의 제조사가 '현대','기아','삼성','BMW','AUDI'이고 옵션에 'ABS','TCS'가
-- 있는 차량의  제조국, 제조사,모델명, 연식,가격, 옵션, 이미지, 배기량 조회
--  --단, 연식의 내림차순 정렬하고, 연식이 같다면 가격의 내림차순으로 정렬
--   하여 출력, 이미지는 이미지명과 확장자를 구분하여 출력할것,
--   제조사명이 영어라면 Bmw, Audi 의 형식으로 출력 .
select			cc.country, initcap(cc.maker) as maker, cmo.model, cmo.car_year, cmo.price, cmo.car_option, substr(cmo.car_img, 1, instr(cmo.car_img, '.')-1) as img_name, substr(cmo.car_img, instr(cmo.car_img, '.')+1) as img_format ,cmo.cc
from			car_country cc, car_maker cma, car_model cmo
where			((cc.maker = cma.maker(+)) and (cma.model = cmo.model)) and cma.maker in ('현대', '기아', '삼성', 'BMW', 'AUDI') and (cmo.car_option like '%ABS%' or cmo.car_option like '%TCS%')
order by 		cmo.car_year desc, cmo.price desc;

--4. 모델명이 'K5','아반테', '소렌토','A8','SM3' 인 차량의 모델명, 제조국,
--  제조사,가격,연식을 아래와 같은 형식의 문장으로 출력.
--  단, 출력 가격의 오름차순을 정렬했을 때 2~7 사이의 레코드만 출력,
--   [모델명] 차량의 연식은 [ xxxx ]이고, 제조국은 [국산|수입]이며,
--   [XX]사가 제조사입니다. 가격은 [0,000,000]원 입니다.
select				'['||model||'] 차량의 연식은 ['||car_year||']이고, 제조국은 ['||country||']이며, ['||maker||']사가 제조사입니다. 가격은 ['||to_char(rpad(price, 7, '0'), '9,999,999')||']원 입니다.' as result
from				(
					select				rownum as low_price_rank, model, country, maker, price, car_year
					from				(
										select				cma.model, cc.country, cc.maker, cmo.price, cmo.car_year
										from				car_country cc, car_maker cma, car_model cmo
										where				(cc.maker = cma.maker(+) and cma.model = cmo.model(+)) and cma.model in ('K5','아반테','소렌토','A8','SM3')
										order by			cmo.price asc
                    					)
          			)
where				low_price_rank between 2 and 7;

--5. 제조사가 '현대'인 차량의 년식, 모델명, 연식별 총가격을 조회.
select			cmo.car_year, cmo.model, sum(cmo.price)
from			car_maker cma, car_model cmo
where			(cma.model = cmo.model) and cma.maker = '현대'
group by		rollup(cmo.car_year, cmo.model);

select model from car_model;
--6. 사원명이 'S'로 끝나거나 이름5자이면서 세번째 글자가 'A'인
--   사원의  사원번호, 사원명, 입사일,연봉,세금, 실수령액, 연봉인상액,
--   부서번호,부서명,위치,우편번호,시도, 구군,동,번지 를 조회
--   단,실수령액은 연봉+퇴직금+보너스-세금(연봉 3.3) 로 계산
--   연봉인상액은 부서번호에 따라 차등 인상
--   10- 년봉 7%, 20- 년봉 4%, 30- 년봉+보너스 10%, 그외 3%로
--   계산하여 3자리마다 ,를 넣어 출력.
--   모든 영어는 소문자로 출력.
select		e.empno, lower(e.ename), e.hiredate, e.sal, e.sal * 0.033 as tax,
			e.sal + e.sal/12 + nvl(comm, 0) - e.sal * 0.033 as real_money,
			decode(e.deptno, 10, e.sal * 0.07, 20, e.sal * 0.04, 30, e.sal+nvl(comm, 0) * 0.1, e.sal * 0.03) as inc,
			e.deptno, lower(d.dname), lower(d.loc), z.zipcode, z.sido, z.gugun, z.dong, z.bunji
from		emp e, dept d, zipcode z
where		(e.deptno(+) = d.deptno) and 
























-- 3. 차량의 제조사가 '현대', '기아', '삼성', 'BMW'이고 옵션에 'ABS', 'TCS'가 있는 차량의
--    제조국, 제조사, 모델명, 연식, 가격, 옵션, 이미지, 배기량 조회
--    단, 연식을 기준으로 내림차순으로 정렬하고, 연식이 같다면 가격을 기준으로 내림차순으로 정렬하여 출력한다.
--    이미지는 이미지명과 확장자를 구분하여 출력,
--    제조사명이 영어라면 Bmw, Audi의 형식으로 출력.
