USE sakila;

-- 1. Number of copies of "Hunchback Impossible" in the inventory system.
SELECT COUNT(*) AS number_of_copies
FROM inventory
WHERE film_id = (
    SELECT film_id 
    FROM film 
    WHERE title = 'Hunchback Impossible');

-- 2. Film where length is longer than the average length of all the films 
SELECT title, length
FROM film
WHERE length > (
    SELECT AVG(length) 
    FROM film )
ORDER BY length DESC;


-- 3 Alone Trip actors
SELECT a.actor_id, a.first_name, a.last_name
FROM actor AS a
JOIN film_actor AS fa ON a.actor_id = fa.actor_id
WHERE fa.film_id = (
    SELECT film_id 
    FROM film 
    WHERE title = 'Alone Trip' );
    
-- 4. Family films
SELECT f.film_id, f.title
FROM film AS f
JOIN film_category AS fc ON f.film_id = fc.film_id
JOIN category AS c ON fc.category_id = c.category_id
WHERE c.name = 'Family'
ORDER BY f.title;

