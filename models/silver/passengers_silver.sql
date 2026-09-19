{{ config(
    alias='passengers'
) }}
select 
*
from 
    {{ source('source', 'passengers') }}