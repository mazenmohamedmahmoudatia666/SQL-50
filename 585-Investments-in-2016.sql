-- Write your PostgreSQL query statement below
select
    round(sum(case when t.count_2015 > 1 and t.count_lat_lon <= 1 then t.tiv_2016 end)::numeric, 2) as tiv_2016
from (
    select
        tiv_2016
        , count(*) over (partition by tiv_2015) as count_2015
        , count(*) over (partition by lat, lon) as count_lat_lon
    from insurance i
) t