-- 1. Select all the actors with the first name ‘Scarlett’.
SELECT * FROM sakila.actor WHERE first_name = 'Scarlett';

-- 2. How many films (movies) are available for rent and how many films have been rented?
SELECT count(distinct(film_id)) FROM sakila.film;

SELECT COUNT(DISTINCT(film_id)) FROM sakila.inventory 
WHERE inventory_id IN (select inventory_id from sakila.rental);

-- 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT MIN(length) AS min_duration, MAX(length) AS max_duration FROM sakila.film;

-- 4. What's the average movie duration expressed in format (hours, minutes)?
SELECT CONCAT(FLOOR(AVG(length)/60),':',ROUND((AVG(length)-FLOOR(AVG(length)/60)*60),0)) 
AS average_length FROM sakila.film;

-- 5. How many distinct (different) actors' last names are there?
SELECT count(distinct(last_name)) FROM sakila.actor;

-- 6. Since how many days has the company been operating (check DATEDIFF() function)?
SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) FROM sakila.rental;

-- 7. Show rental info with additional columns month and weekday. Get 20 results.
SELECT *, date_format(rental_date, '%M') AS 'rental_month', WEEKDAY(rental_date) AS 'weekday'
FROM sakila.rental LIMIT 20;

-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *, date_format(rental_date, '%M') AS 'rental_month', WEEKDAY(rental_date) AS 'weekday',
CASE
WHEN WEEKDAY(rental_date) <= 4 then 'workday'
ELSE 'weekend'
END AS 'Day_type'
FROM sakila.rental;

-- 9. Get release years.
SELECT distinct(release_year) FROM sakila.film;

-- 10. Get all films with ARMAGEDDON in the title.
SELECT * FROM sakila.film
WHERE title LIKE '%ARMAGEDDON%';

-- 11. Get all films which title ends with APOLLO.
SELECT * FROM sakila.film
WHERE title LIKE '%APOLLO';

-- 12. Get 10 the longest films.
SELECT * FROM sakila.film ORDER BY length DESC LIMIT 10;

-- 13. How many films include Behind the Scenes content?
SELECT count(film_id) FROM sakila.film 
WHERE special_features LIKE '%Behind the scenes%';