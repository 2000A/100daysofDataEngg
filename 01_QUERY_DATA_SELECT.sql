-- Retrieve All Customer Data

SELECT *
FROM customers;

-- Retrieve All Order Data
SELECT * 
FROM orders;

-- SELECT Few Columns
-- Retrieve each customer's name, country, and score.

SELECT 
first_name,
country,
score
FROM customers;

-- WHERE (filter your Data)
-- Retrieve customers with a score not equal to 0

SELECT 
first_name,
country
FROM customers
WHERE score <> 0;

-- Retrieve customers from Germany

SELECT * 
FROM customers
WHERE country like '%Germany';

-- ORDER BY (Sort Your Data)
-- Retrieve all customers and sort the results 
-- by the highesht score first

SELECT *
FROM customers
ORDER BY score DESC;

-- Retrieve all customers and sort the results 
-- by the LOWEST score first

SELECT *
FROM customers
ORDER BY score ASC;

-- (Nested) ORDER BY
/* Retrieve all customers and sort the results
   by the country and then by the highest score */

SELECT * 
FROM customers
ORDER BY country ASC, score DESC;

--Column order in ORDER BY is crucial, as sorting is sequential

--GROUP BY (Aggregate Your Data)

--Find the total score for each country

SELECT 
	country,
	SUM(score)
FROM customers
GROUP BY country;
--RULE: All columns in SELECT must be
-- either aggregated or included in GROUP BY

SELECT 
	country,
	first_name,
	SUM(score) AS total_score
FROM customers
GROUP BY country, first_name;
--The Result of GROUP BY determined by unique values of 
-- the grouped columns


-- Find the total score and total number of customers
-- for each country.

SELECT 
	country,
	COUNT(first_name) AS total_customers,
	SUM(score) AS total_score
FROM customers
GROUP BY country;

-- HAVING ( Filter Aggregated Data)
/* Find the average score for each country considering
customers with a score not equal to 0 
and return only those countries with an average score
greater than 430 */


SELECT 
	country,
	AVG(score) AS avg_score
FROM customers
WHERE score != 0
GROUP BY country
HAVING AVG(score) > 430

--DISTINCT (Remove Duplicates)
-- Return Unique list of all contries

SELECT DISTINCT country
FROM customers;

-- TOP (Limit Your Data)
-- Retrieve only 3 customers

SELECT TOP 3 * /* TOP is not supported in postgresql*/
FROM customers

SELECT *
FROM customers
LIMIT 3;

-- Retrieve the Top 3 Customers with the Highest Scores

SELECT * 
FROM customers
ORDER BY score DESC
LIMIT 3;

-- Retrieve the lowest 2 Customers based on the Score

SELECT * 
FROM customers
ORDER BY score ASC
LIMIT 2;

-- Get the Two Most Recent Orders

SELECT * 
FROM orders
ORDER BY order_date DESC
LIMIT 2;

--Cool SQL Techniques
-- 1.Multi-Queries

SELECT * 
FROM customers;

SELECT * 
FROM orders;

-- 2. Static(Fixed) Values

SELECT 234 AS static_number;

SELECT 'Steve Jobs' AS static_string;

SELECT 
id,
first_name,
'New Customer' AS customer_type
FROM customers;










