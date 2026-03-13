select
    trip_date,
    pickup_hour,
    pickup_location_id,
    dropoff_location_id,
    passenger_count,
    trip_distance,
    fare_amount,
    tip_amount,
    tolls_amount,
    total_amount,
    trip_duration_minutes,
    revenue_per_mile
from {{ ref('int_trip_metrics') }}