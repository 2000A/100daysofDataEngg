/* SQL Aggregate Functions*/

-- count the no. of orders
--find the total sales of all orders
-- find the avg of sales of all orders
-- find the highest sale of all orders
-- find the lowest sales  of all orders

SELECT 
customer_id,
COUNT(*) AS total_nr_orders,
SUM(sales) AS total_sales,
AVG(sales) AS avg_sales,
MAX(sales) AS highest_sales,
MIN(sales) AS lowest_sales
FROM orders
GROUP BY (customer_id)

SELECT 
first_name,
COUNT(*) AS total_nr_persons,
SUM(score) AS total_scores,
AVG(score) AS avg_scores,
MAX(score) AS higesht_score,
MIN(score) AS lowest_score
FROM customers
GROUP BY first_name


/* combining aggregate and group by we can get highest amount
of details based on column we group by.*/






