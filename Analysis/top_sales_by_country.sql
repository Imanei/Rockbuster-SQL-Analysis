SELECT				
    co.country AS country_name,				
    SUM(p.amount) AS total_sales				
FROM				
    payment p				
JOIN				
    rental r ON p.rental_id = r.rental_id				
JOIN				
    customer c ON r.customer_id = c.customer_id				
JOIN				
    address a ON c.address_id = a.address_id				
JOIN				
    city ci ON a.city_id = ci.city_id				
JOIN				
    country co ON ci.country_id = co.country_id				
GROUP BY				
    co.country				
ORDER BY				
    total_sales DESC				
LIMIT 10;				
