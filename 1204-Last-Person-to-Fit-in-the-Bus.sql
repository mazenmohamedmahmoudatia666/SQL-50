SELECT person_name FROM (
    SELECT person_name, SUM(weight) OVER (
        ORDER BY turn
    ) s FROM Queue 
    ORDER BY turn DESC
) 
WHERE s <= 1000
LIMIT 1