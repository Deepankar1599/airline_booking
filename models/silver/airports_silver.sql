{{ config(
    alias='airports'
) }}

select 
*
from 
    {{ source ('source', 'airports') }}