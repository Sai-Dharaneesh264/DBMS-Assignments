USE sakila;

-- --------------- QUESTION 1 ------------------
SELECT * 
FROM film, film_category, category
WHERE film.film_id = film_category.film_id
AND film_category.category_id = category.category_id
AND film.rating = 'pg-13'
AND category.name = 'comedy';

-- --------------- QUESTION 2 ------------------
SELECT * FROM film, film_category, category
WHERE film.film_id = film_category.film_id
AND film_category.category_id = category.category_id
AND category.name = 'horror'
ORDER BY rental_rate DESC LIMIT 3;

-- --------------- QUESTION 3 ------------------
SELECT customer.*, country.country, category.name
FROM customer, address, city, country, rental, inventory, film_category, category
WHERE customer.address_id = address.address_id
AND address.city_id = city.city_id
AND city.country_id = country.country_id
AND customer.customer_id = rental.customer_id
AND rental.inventory_id = inventory.inventory_id
AND inventory.film_id = film_category.film_id
AND film_category.category_id = category.category_id
AND country = 'india'
AND category.name = 'comedy'
GROUP BY customer.customer_id
ORDER BY customer.customer_id; 

-- --------------- QUESTION 4 ------------------
SELECT customer.*, country.country, actor.first_name, actor.last_name
FROM customer, address, city, country, rental, inventory, film_actor, actor
WHERE customer.address_id = address.address_id
AND address.city_id = city.city_id
AND city.country_id = country.country_id
AND customer.customer_id = rental.customer_id
AND rental.inventory_id = inventory.inventory_id
AND inventory.film_id = film_actor.film_id
AND film_actor.actor_id = actor.actor_id
AND country = 'canada'
AND actor.first_name = 'nick'
AND actor.last_name= 'wahlberg'
ORDER BY customer.customer_id, rental.customer_id, inventory.inventory_id; 

-- --------------- QUESTION 5 ------------------
SELECT film.* FROM film, film_actor, actor
WHERE film.film_id = film_actor.film_id
AND film_actor.actor_id = actor.actor_id
AND actor.first_name = 'sean'
AND actor.last_name = 'williams';