SELECT 
    c.initiated_by_user AS user_id, 
    ua.first_name, 
    ua.last_name, 
    c.customer_id, 
    cu.customer_name, 
    COUNT(*) AS contact_count
FROM contact c
JOIN user_account ua ON c.initiated_by_user = ua.id
JOIN customer cu ON c.customer_id = cu.id
WHERE c.initiated_by_user = 4  -- Ensure only Alex Ferguson
AND c.customer_id = 7          -- Ensure only Natural Cosmetics
GROUP BY c.initiated_by_user, ua.first_name, ua.last_name, c.customer_id, cu.customer_name
HAVING COUNT(*) > 1;
