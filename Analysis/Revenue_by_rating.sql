SELECT 				
    f.rating, 				
    SUM(p.amount) AS total_revenue				
FROM 				
    payment p				
JOIN 				
    rental r ON p.rental_id = r.rental_id				
JOIN 				
    inventory i ON r.inventory_id = i.inventory_id				
JOIN 				
    film f ON i.film_id = f.film_id				
GROUP BY 				
    f.rating				
ORDER BY 				
    total_revenue DESC;				
