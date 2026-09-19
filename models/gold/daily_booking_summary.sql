{{
  config(
    alias = 'DAILY_BOOKING_SUMMARY',
    materialized='table'
    )
}}

select
    booking_date,
    airport_id,
    count(booking_id) as booking_count,
    count(distinct passenger_id) as unique_passengers,
    sum(amount) as total_amount,
    round(avg(amount), 2) as avg_amount
from {{ ref('fct_bookings') }}
group by booking_date, airport_id
order by booking_date, total_amount desc