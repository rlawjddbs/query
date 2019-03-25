-- 가장 마지막에 쓴 글부터 시작번호와 끝 번호 사이의 게시물 구하기

select r, num, subject, writer, e_year, e_month, e_day, w_date
from (select rownum r, num, subject, writer, e_year, e_month, e_day, w_date
from (select num, subject, writer, e_year, e_month, e_day, w_date
from diary
order by w_date desc))
where r between 1 and 10;

select r_num, num, subject, writer, e_year, e_month, e_day, w_date
from (select num, subject, writer, e_year, e_month, e_day, w_date,
		row_number() over( order by w_date desc) as r_num
		from diary)
where r_num between 1 and 10;
