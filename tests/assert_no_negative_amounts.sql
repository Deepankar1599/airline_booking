select * from {{ ref('fct_bookings') }}
where amount <= 0