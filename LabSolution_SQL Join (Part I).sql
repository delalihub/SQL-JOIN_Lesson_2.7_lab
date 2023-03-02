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


