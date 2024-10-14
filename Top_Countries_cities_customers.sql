#Top 10 countries for Rockbuster in terms of customer numbers 

SELECT   D.country, COUNT(A.customer_id) AS number_of_customers 						
FROM customer A  						
INNER JOIN address B ON A.address_id = B.address_id  						
INNER JOIN city C ON B.city_id = C.city_id  						
INNER JOIN country D ON C.country_id = D.country_id 						
GROUP BY country 						
ORDER BY count(A.customer_id) DESC 						
LIMIT 10 						

#Top 10 cities that fall within the top 10 countries							
							
WITH top_countries AS ( 							
SELECT D.country_id, D.country 							
FROM customer A 							
INNER JOIN address B ON A.address_id = B.address_id 							
INNER JOIN city C ON B.city_id = C.city_id 							
INNER JOIN country D ON C.country_id = D.country_id 							
GROUP BY D.country_id, D.country 							
ORDER BY COUNT(A.customer_id) DESC 							
LIMIT 10 							
)							
SELECT C.city, D.country, COUNT(A.customer_id) AS number_of_customers 							
FROM customer A 							
INNER JOIN address B ON A.address_id = B.address_id 							
INNER JOIN city C ON B.city_id = C.city_id 							
INNER JOIN country D ON C.country_id = D.country_id							
WHERE C.country_id IN (SELECT country_id FROM top_countries) 							
GROUP BY C.city, D.country 							
ORDER BY COUNT(A.customer_id) DESC 							
LIMIT 10;							
							
#Top 5 customers from the top 10 cities who’ve paid the highest total amounts to Rockbuster							
							
WITH top_countries AS ( 							
SELECT D.country_id, D.country 							
FROM customer A 							
INNER JOIN address B ON A.address_id = B.address_id 							
INNER JOIN city C ON B.city_id = C.city_id 							
INNER JOIN country D ON C.country_id = D.country_id 							
GROUP BY D.country_id, D.country 							
ORDER BY COUNT(A.customer_id) DESC 							
LIMIT 10 ), 							
top_cities AS ( 							
SELECT C.city_id, C.city, D.country 							
FROM customer A 							
INNER JOIN address B ON A.address_id = B.address_id 							
INNER JOIN city C ON B.city_id = C.city_id 							
INNER JOIN country D ON C.country_id = D.country_id 							
WHERE C.country_id IN (SELECT country_id FROM top_countries) 							
GROUP BY C.city_id, C.city, D.country 							
ORDER BY COUNT(A.customer_id) DESC 							
LIMIT 10 ) 							
SELECT  							
A.customer_id,  A.first_name,  A.last_name,  D.country, C.city,   							
SUM(P.amount) AS total_amount_paid 							
FROM payment P 							
INNER JOIN rental R ON P.rental_id = R.rental_id 							
INNER JOIN customer A ON R.customer_id = A.customer_id 							
INNER JOIN address B ON A.address_id = B.address_id 							
INNER JOIN city C ON B.city_id = C.city_id 							
INNER JOIN country D ON C.country_id = D.country_id 							
WHERE C.city_id IN (SELECT city_id FROM top_cities) 							
GROUP BY A.customer_id, A.first_name, A.last_name, D.country, C.city 							
ORDER BY total_amount_paid DESC 							
LIMIT 5;							
