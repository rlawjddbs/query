select * from diary;

                                   
select num, subject, writer, e_year, e_month, e_day, w_date
from (
select num, subject, writer, e_year, e_month, e_day, w_date
from diary
where writer='오리사'
order by w_date desc
)
where rownum <= 10;


select num, subject, writer, e_year, e_month, e_day, w_date
from (
		select num, subject, writer, e_year, e_month, e_day, w_date
		from diary
		where subject like '%잘%'
		order by w_date desc
)
where rownum <= 10;

select num, subject, writer, e_year, e_month, e_day, w_date
from (
		select num, subject, writer, e_year, e_month, e_day, w_date 
		from diary 
		where subject like '%금%' 
		order by w_date desc
)
where rownum <= 10;

select num, subject, writer, e_year, e_month, e_day, w_date from diary where contents like '%성%' order by w_date desc;
select num, subject, writer, e_year, e_month, e_day, w_date from diary where contents like '%q%' order by w_date desc;
