select
    vendor_id,
    pickup_datetime,
    dropoff_datetime,
    cast(pickup_datetime as date) as trip_date,
    extract('hour' from pickup_datetime) as pickup_hour,
    pickup_location_id,
    dropoff_location_id,
    passenger_count,
    trip_distance,
    fare_amount,
    tip_amount,
    tolls_amount,
    total_amount,
    datediff('minute', pickup_datetime, dropoff_datetime) as trip_duration_minutes,
    case
        when trip_distance > 0 then total_amount / trip_distance
        else null
    end as revenue_per_mile
from {{ ref('stg_taxi_trips') }}
where pickup_datetime is not null
  and dropoff_datetime is not null
  and total_amount is not null