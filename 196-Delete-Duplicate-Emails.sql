 WITH CTE AS (
    SELECT id, ROW_NUMBER() OVER (PARTITION BY email ORDER BY id) AS row_num
    FROM Person
)
DELETE FROM Person
WHERE id IN (
    SELECT id
    FROM CTE
    WHERE row_num > 1
);
