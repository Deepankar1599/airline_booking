{% test assert_freshness_check(bookings_silver, booking_date, max_hours_allowed) %}

-- This test fails if the newest date in the column is older than the allowed hours limit.
-- Returns 1 row (Failure) if data is stale. Returns 0 rows (Pass) if data is fresh.

WITH max_date AS (
    SELECT 
        MAX({{ column_name }}) AS latest_record_time
    FROM {{ model }}
),

validation AS (
    SELECT
        latest_record_time,
        -- Databricks / Spark SQL syntax to get the hour difference
        DATEDIFF(hour, latest_record_time, CURRENT_TIMESTAMP()) AS hours_since_last_update
    FROM max_date
)

SELECT * 
FROM validation 
WHERE hours_since_last_update > {{ max_hours_allowed }}

{% endtest %}
