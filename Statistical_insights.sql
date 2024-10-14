#numeric_ariables:
SELECT 	
	AVG (rental_duration) AS average_rental_duration,
	MIN(rental_duration) AS min_rental_duration, 
	MAX(rental_duration) AS max_rental_duration, 
	AVG (rental_rate) AS average_rental_rate, 
	MIN(rental_rate) AS min_rental_rate, 
	MAX(rental_rate) AS max_rental_rate, 
	AVG(length) AS average_length, 
	MIN(length) AS min_length, 
	MAX(length) AS max_length, 
	AVG(replacement_cost) AS average_replacement_cost, 
	MIN(replacement_cost) AS min_replacement_cost, 
	MAX(replacement_cost) AS max_replacement_cost
FROM film;	

#non_numerical_variables:
SELECT MODE() WITHIN GROUP (ORDER BY rating) 	
	AS modal_rating, 
	MODE() WITHIN GROUP (ORDER BY name)
	AS modal_language
FROM film A INNER JOIN language B 	
	ON A.language_id = B.language_id
