{{
  config(
    alias = 'Airport_Per_Country',
    materialized='view'
    )
}}
WITH AirportsPerCountry AS (
    SELECT 
        country,
        COUNT(airport_id) AS TotalAirports
    FROM {{ ref('airports_silver') }}
    Group by country

)
SELECT 
   * from 
   AirportsPerCountry
   order by TotalAirports desc