-- Write your PostgreSQL query statement below

SELECT 
    p.product_id,
    CASE
        WHEN SUM(u.units) is null
        THEN 0
        ELSE
            ROUND(SUM(u.units * p.price) / SUM(u.units)::numeric, 2)
    END
    AS average_price
FROM 
    Prices p
LEFT JOIN 
    UnitsSold u
ON 
    u.product_id = p.product_id 
    AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY 
    p.product_id;
