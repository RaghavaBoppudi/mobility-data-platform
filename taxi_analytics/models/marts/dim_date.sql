with distinct_dates as (

    select distinct trip_date
    from {{ ref('int_trip_metrics') }}
    where trip_date is not null

)

select
    trip_date as date_day,
    extract('year' from trip_date) as year_number,
    extract('month' from trip_date) as month_number,
    extract('day' from trip_date) as day_number,
    extract('dow' from trip_date) as day_of_week_number,
    case extract('dow' from trip_date)
        when 0 then 'Sunday'
        when 1 then 'Monday'
        when 2 then 'Tuesday'
        when 3 then 'Wednesday'
        when 4 then 'Thursday'
        when 5 then 'Friday'
        when 6 then 'Saturday'
    end as day_of_week_name
from distinct_dates