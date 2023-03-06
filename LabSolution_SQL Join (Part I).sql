USE sakila;
##.1 How many films are there for each of the categories in the category table.
-- Use appropriate join to write this query.

SELECT  c.name, COUNT(f.film_id) AS  Total_films
FROM sakila.category c
INNER JOIN sakila.film_category f
USING (category_id)
GROUP BY c.name
ORDER BY Total_films DESC;

#2. Display the total amount rung up by each staff member in August of 2005.
SELECT * FROM sakila.staff;
SELECT * FROM sakila.payment;

SELECT s.staff_id, sum(p.amount) FROM sakila.staff s
JOIN sakila.payment p
USING (staff_id)
WHERE p.payment_date LIKE  '2005-08%'
GROUP BY s.staff_id;

##3 Which actor has appeared in the most films?
SELECT  * FROM sakila.actor;
SELECT * FROM sakila.film_actor;
SELECT a.actor_id, count(f.film_id) FROM sakila.actor a
JOIN sakila.film_actor  f
USING (actor_id)
GROUP BY a.actor_id
ORDER BY count(f.film_id) DESC;

#4.Most active customer (the customer that has rented the most number of films)
SELECT * FROM sakila.customer;
SELECT * FROM sakila.rental;

SELECT c.customer_id, count(*)  FROM sakila.customer c
JOIN sakila.rental r
ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY count(*) DESC
LIMIT 1;

#.5. Display the first and last names, as well as the address, of each staff member.
SELECT * FROM Sakila.staff;
SELECT * FROM sakila.address;
SELECT concat(first_name, ' ', last_name), address FROM sakila.staff s
JOIN sakila.address a
ON s.address_id = a.address_id;
#alternatively
SELECT first_name, last_name, address FROM sakila.staff s
JOIN sakila.address a
ON s.address_id = a.address_id;

#.6.List each film and the number of actors who are listed for that film.
SELECT * FROM sakila.film;
SELECT * FROM sakila.film_actor;

SELECT f.film_id, count(actor_id) FROM sakila.film f
JOIN sakila.film_actor fa
ON f.film_id = fa.film_id
GROUP BY f.film_id
ORDER BY count(actor_id) DESC;

-- Using the tables payment and customer and the JOIN command, list the total paid.. 
-- by each customer. List the customers alphabetically by last name.
SELECT * FROM sakila.payment;
SELECT * FROM sakila.customer;

SELECT concat(c.last_name, '      ', first_name) AS customer_name, sum(p.amount) 
 FROM sakila.payment p 
JOIN sakila.customer c
ON p.customer_id = c.customer_id
GROUP BY customer_name
ORDER BY customer_name ASC;

#8.same as question1(List number of films per category)



