select
    pickup_hour,
    count(*) as trip_count,
    round(sum(total_amount), 2) as total_revenue
from fact_trips
group by pickup_hour
order by trip_count desc;
