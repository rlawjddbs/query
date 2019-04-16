select * from car_model;
select * from car_country;
select * from car_maker;

select car_img, maker, model, car_year, price, car_option, hiredate
from (select car_img, maker, model, car_year, price, car_option, hiredate, row_number() over(order by hiredate desc) r_num
from	(select			cmo.car_img, cma.maker, cmo.model, cmo.car_year, cmo.price, cmo.car_option, cmo.hiredate
		from			car_maker cma, car_model cmo
		where			cmo.model = cma.model));

select car_img, maker, model, car_year, price, car_option, hiredate
from (select car_img, maker, model, car_year, price, car_option, hiredate, row_number() over(order by hiredate desc) r_num
from	(select			cmo.car_img, cma.maker, cmo.model, cmo.car_year, cmo.price, cmo.car_option, cmo.hiredate
		from			car_maker cma, car_model cmo
		where			cmo.model = cma.model))
where r_num between 1 and 10;

select country
from car_country
group by country;

select cc.country, cma.maker, nvl(cmo.model, ''), cmo.car_img, cmo.car_option, cmo.car_year
from car_country cc, car_maker cma, car_model cmo
where cc.maker = cma.maker and cma.model = cmo.model;

select cc.country, cma.maker, cmo.model, cmo.car_img, cmo.car_option, cmo.car_year
from car_country cc, car_maker cma, car_model cmo
where cc.maker = cma.maker and cma.model = cmo.model(+) and cc.country='국산';



select maker
from (
		select cc.country, cma.maker, cmo.model, cmo.car_img, cmo.car_option, cmo.car_year
		from car_country cc, car_maker cma, car_model cmo
		where cc.maker = cma.maker and cma.model = cmo.model(+) and cc.country='국산'
		)
group by maker;


select cc.country, cma.maker, cmo.model, cmo.car_img, cmo.car_option, cmo.car_year
from car_country cc, car_maker cma, car_model cmo
where cc.maker = cma.maker and cma.model = cmo.model
group by cc.country;

select model from car_model;
