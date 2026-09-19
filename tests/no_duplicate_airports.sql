SELECT 
airport_id, 
COUNT(*) 
FROM 
    {{ ref('airports_silver') }} 
    GROUP BY airport_id 
    HAVING count(*)>1