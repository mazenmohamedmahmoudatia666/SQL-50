WITH FirstOrders AS (
    SELECT DISTINCT ON (customer_id) 
           customer_id, 
           order_date, 
           customer_pref_delivery_date
    FROM Delivery
    ORDER BY customer_id, order_date
)
SELECT 
    ROUND(
        COUNT(CASE WHEN order_date = customer_pref_delivery_date THEN 1 END) * 100.0 / COUNT(customer_id), 
        2
    ) AS immediate_percentage
FROM FirstOrders;
