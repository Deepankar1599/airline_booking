{{ config(
    alias='bookings'
) }}
select 
*
from 
    {{ source('source', 'bookings') }}