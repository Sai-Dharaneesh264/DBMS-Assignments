USE sakila;

-- --------------- QUESTION 1 ------------------
SELECT film.* FROM film
INNER JOIN film_category 
	ON film.film_id = film_category.film_id
INNER JOIN category
	ON film_category.category_id = category.category_id
	AND category.name = 'documentary'
AND film.special_features LIKE '%,deleted scenes,%';

-- --------------- QUESTION 2 ------------------
SELECT DISTINCT film.* 
FROM film 
INNER JOIN film_category 
	ON film.film_id = film_category.film_id
INNER JOIN category 
	ON film_category.category_id = category.category_id
	AND category.name = 'sci-fi'
INNER JOIN inventory
	ON film.film_id = inventory.film_id
INNER JOIN staff
	ON inventory.store_id = staff.store_id
	AND staff.first_name = 'jon'
	AND staff.last_name = 'stephens';

-- --------------- QUESTION 3 ------------------
SELECT film.*, category.name AS film_category,
		COUNT(*) AS numFilmGotRented,
        SUM(payment.amount) AS SalesByFilm
FROM film
INNER JOIN film_category
	ON film.film_id = film_category.film_id
INNER JOIN category
	ON film_category.category_id = category.category_id
	AND category.name = 'animation'
INNER JOIN inventory
	ON film.film_id = inventory.film_id
INNER JOIN rental
	ON inventory.inventory_id = rental.inventory_id
INNER JOIN payment
	ON rental.rental_id = payment.rental_id
GROUP BY film.film_id
ORDER BY COUNT(*);
