select b.*
from {{ ref('fct_bookings') }} b
left join {{ source('de_project', 'airports') }} a on b.airport_id = a.airport_id
where a.airport_id is null