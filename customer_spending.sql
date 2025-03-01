WITH CustomerSpending AS (
    SELECT 
        c.id,
        c.customer_name, 
        SUM(i.total_price) AS amount_spent
    FROM customer c
    JOIN invoice i ON c.id = i.customer_id
    GROUP BY c.id, c.customer_name
),
Threshold AS (
    SELECT AVG(total_price) * 0.25 AS threshold FROM invoice
)
SELECT 
    cs.customer_name, 
    FORMAT(cs.amount_spent, 6) AS amount_spent
FROM CustomerSpending cs
JOIN Threshold t ON cs.amount_spent <= t.threshold
ORDER BY cs.amount_spent DESC;
