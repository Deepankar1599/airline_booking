{{
  config(
    alias = 'FCT_BOOKINGS',
    )
}}
with bookings as (
    select * from {{ ref('bookings_silver') }}
),

airports as (
    select * from {{ ref('airports_silver') }}
),

passengers as (
    select * from {{ ref('passengers_silver') }}
)

select
    b.booking_id,
    b.passenger_id,
    b.flight_id,
    b.airport_id,
    b.amount,
    b.booking_date,
    b.processed_at,
    a.airport_id is not null as has_valid_airport,
    p.passenger_id is not null as has_valid_passenger
from bookings b
left join airports a on b.airport_id = a.airport_id
left join passengers p on b.passenger_id = p.passenger_id