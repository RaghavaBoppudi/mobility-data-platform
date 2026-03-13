select
    dl.borough,
    count(*) as trip_count,
    round(sum(f.total_amount), 2) as total_revenue,
    round(avg(f.total_amount), 2) as avg_revenue_per_trip
from fact_trips f
join dim_location dl
    on f.pickup_location_id = dl.location_id
group by dl.borough
order by total_revenue desc;
