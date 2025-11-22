WITH stats AS (
    SELECT 
        COUNT(DISTINCT e.email_id) AS total_users,
        SUM(CASE 
                WHEN t.signup_action = 'Confirmed' THEN 1 
                ELSE 0 
            END) AS confirmed_users
    FROM emails e
    LEFT JOIN texts t 
           ON e.email_id = t.email_id
)
SELECT 
    ROUND(confirmed_users::numeric / total_users::numeric, 2) 
        AS confirm_rate
FROM stats;
