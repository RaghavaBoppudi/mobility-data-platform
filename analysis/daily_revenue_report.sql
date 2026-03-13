select
    d.year_number,
    d.month_number,
    d.day_number,
    dl.borough,
    count(*) as trip_count,
    round(sum(f.total_amount), 2) as total_revenue,
    round(avg(f.total_amount), 2) as avg_revenue_per_trip
from fact_trips f
join dim_date d
    on f.trip_date = d.date_day
join dim_location dl
    on f.pickup_location_id = dl.location_id
group by
    d.year_number,
    d.month_number,
    d.day_number,
    dl.borough
order by
    d.year_number,
    d.month_number,
    d.day_number,
    total_revenue desc;