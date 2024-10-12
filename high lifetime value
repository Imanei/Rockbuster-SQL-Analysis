#Where are customers with a high lifetime value based			
				
WITH customer_ltv AS (				
    SELECT				
        c.customer_id,				
        SUM(p.amount) AS lifetime_value				
    FROM				
        customer c				
    JOIN				
        payment p ON c.customer_id = p.customer_id				
    GROUP BY				
        c.customer_id				
),				
avg_ltv AS (				
    SELECT				
        AVG(lifetime_value) AS avg_lifetime_value				
    FROM				
        customer_ltv				
)				
SELECT				
    co.country AS country_name,				
    c.customer_id,				
    cl.lifetime_value				
FROM				
    customer_ltv cl				
JOIN				
    customer c ON cl.customer_id = c.customer_id				
JOIN				
    address a ON c.address_id = a.address_id				
JOIN				
    city ci ON a.city_id = ci.city_id				
JOIN				
    country co ON ci.country_id = co.country_id,				
    avg_ltv				
WHERE				
    cl.lifetime_value > avg_ltv.avg_lifetime_value				
ORDER BY				
    cl.lifetime_value DESC				
LIMIT 10;				
