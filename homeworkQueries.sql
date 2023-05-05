--1. List all customers who live in Texas (use JOINs)

SELECT district, first_name, last_name
FROM city AS c
JOIN address AS A
ON c.city_id = a.city_id
JOIN customer AS cu 
ON a.address_id = cu.address_id
WHERE district = 'Texas';


--2. Get all payments above $6.99 with the Customer's FullName

SELECT payment_id, CONCAT(first_name, ' ', last_name) AS full_name, amount
FROM customer AS c
JOIN payment AS p
ON c.customer_id = p.customer_id
WHERE amount > 6.99;


--3. Show all customers names who have made payments over $175(use subqueries)
SELECT concat(first_name, ' ', last_name) AS full_name
FROM customer
WHERE 175 < (
	SELECT sum(amount)
	FROM payment
);

SELECT concat(first_name, ' ', last_name) AS full_name
FROM customer
JOIN payment
ON customer.customer_id = payment.customer_id
GROUP BY first_name, last_name
HAVING sum(amount) > 175;

--4. List all customers that live in Nepal (use the city table)
SELECT customer_id, concat(first_name, ' ', last_name) AS full_name,city
FROM customer AS cu
JOIN address AS ad
ON cu.address_id = ad.address_id
JOIN city AS c
ON ad.city_id = c.city_id
WHERE country_id = 66;


--5. Which staff member had the most transactions?
SELECT concat(first_name, ' ', last_name) AS full_name, count(payment_id)
FROM staff AS s
JOIN payment AS p
ON s.staff_id = p.staff_id
GROUP BY first_name, last_name;


--6. How many movies of each rating are there?
SELECT rating, count(film_id)
FROM film
GROUP BY rating;

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT CONCAT(first_name, ' ', last_name) AS full_name, amount
FROM customer AS c
JOIN payment AS p
ON c.customer_id = p.customer_id
WHERE amount > 6.99
GROUP BY first_name, last_name, amount
HAVING count(amount) = 1;



--8. How many free rentals did our stores give away
SELECT *
FROM payment;

SELECT count(rental_id)
FROM payment
WHERE amount = 0;

