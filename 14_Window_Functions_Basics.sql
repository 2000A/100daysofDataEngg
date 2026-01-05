--Find the total Sales Across all orders
-- This query carries the highest aggregation ie. 380
SELECT
SUM(sales)
FROM Sales.orders


--Find the total sales for each product.
--Here we are drilling down for more order of details.
SELECT
	ProductID,
	SUM(Sales)
FROM Sales.orders
GROUP BY ProductID       /*We provide dimension */

/* Result Granularity :
The number of rows in the output is defined
by the dimension*/


/*Find the total sales for each product
Additionally provide details such order Id, order date*/

SELECT
	OrderID,
	OrderDate,
	ProductID,
	SUM(Sales) OVER(PARTITION BY ProductID)
FROM Sales.Orders

/*---------------------------------------------*/
/* PARTITIONA BY CLAUSE PRACTICE */

--Find the total sales across all orders additionally
--provide details such order id & order date

SELECT 
	OrderId,
	OrderDate,
	SUM(Sales) OVER () TotalSales
FROM Sales.Orders


/*Find the total sales for each product
Additionally provide details such order Id, order date
*/

SELECT 
	OrderId,
	OrderDate,
	ProductId,
	SUM(Sales) OVER (PARTITION BY ProductId) TotalSales
FROM Sales.Orders

/* Dynamic of WINDOW() function*/
/* Allows data aggregation at different granularities 
within the same query*/

/*
Find the total sales across all orders
Find the total sales for each product
Additionally provide details such order Id, order date
*/

SELECT
	OrderID,
	OrderDate,
	ProductId,
	Sales,
	SUM(Sales) OVER () TotalSales,
	SUM(Sales) OVER (PARTITION BY ProductId) TotalSalesByProcuts
FROM Sales.Orders


/*
Find the total sales across all orders
Find the total sales for each product
Find the total sales for each combination of product and order status
Additionally provide details such order Id, order date
*/


SELECT
	OrderID,
	OrderDate,
	ProductId,
	OrderStatus,
	Sales,
	SUM(Sales) OVER () TotalSales,
	SUM(Sales) OVER (PARTITION BY ProductId) SalesByProducts,
	SUM(Sales) OVER (PARTITION BY ProductId, OrderStatus) SalesByProductAndStatus
FROM Sales.Orders

/* ORDER BY CLAUSE AND RANK() FUNCTION */

/* Rank each order based on their sales from highest to lowest
Additionally provide details such order Id, Order date
*/
-- No partition required as per question.
SELECT
	OrderId,
	OrderDate,
	Sales,
	RANK() OVER(ORDER BY Sales DESC) RankSales
FROM Sales.Orders;


/*Practicing Frame part of window function*/
SELECT
	OrderId,
	OrderDate,
	OrderStatus,
	Sales,
	SUM(Sales) OVER(PARTITION BY orderstatus ORDER BY OrderDate
	ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING) TotalSales
FROM Sales.Orders

/* summarizing values of two previous orders.
AND shortcut method for PRECEDING */

SELECT
	OrderId,
	OrderDate,
	OrderStatus,
	Sales,
	SUM(Sales) OVER(PARTITION BY OrderStatus ORDER BY OrderDate
	ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) TotalSales
FROM Sales.Orders

/* Shortcut for 2 preceding where we can skip range*/
/* works for n preceding and unbounded preceding only*/

SELECT
	OrderId,
	OrderDate,
	OrderStatus,
	Sales,
	SUM(Sales) OVER(PARTITION BY OrderStatus ORDER BY OrderDate
	ROWS 2 PRECEDING) TotalSales
FROM Sales.Orders


SELECT
	OrderId,
	OrderDate,
	OrderStatus,
	Sales,
	SUM(Sales) OVER(PARTITION BY OrderStatus ORDER BY OrderDate
	ROWS UNBOUNDED PRECEDING) TotalSales
FROM Sales.Orders


/* default FRAME
 ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW */
 

SELECT
	OrderId,
	OrderDate,
	OrderStatus,
	Sales,
	SUM(Sales) OVER(PARTITION BY OrderStatus ORDER BY OrderDate) TotalSales
FROM Sales.Orders


/*FOUR RULES OF WINDOW FUNCTIONS */

--RULE #1 : Window function can only be used within 
-- SELECT AND ORDER BY CLAUSE.

SELECT
	OrderId,
	OrderDate,
	OrderStatus,
	Sales,
	SUM(Sales) OVER(PARTITION BY OrderStatus ORDER BY OrderDate) TotalSales
FROM Sales.Orders
ORDER BY SUM(Sales) OVER(PARTITION BY OrderStatus ORDER BY OrderDate) DESC

/* #3 RULE:
SQL ececute WINDOW Functions after WHERE Clause. */


SELECT
	OrderId,
	OrderDate,
	OrderStatus,
	Sales,
	SUM(Sales) OVER(PARTITION BY OrderStatus ORDER BY OrderDate) TotalSales
FROM Sales.Orders
WHERE ProductID IN (101,102)


/* Rank Customers based on their total sales*/
/* Since we know that We sql don't allow GROUP BY and WINDOW() 
function together and here we have to do to use to window 
functions right one is RANK() and second SUM() therefore 
But by using rule 4 We can solve the problem*/


--#4 RULE: Window() and Group By can be used together 
--When whatever is part of window() it should be part of 
--Group by as well

SELECT
	CustomerID,
	SUM(Sales) TotalSales,
	RANK() OVER(ORDER BY SUM(Sales) DESC) RankCustomers
FROM Sales.Orders
GROUP BY CustomerID


SELECT
	CustomerID,
	SUM(Sales) TotalSales,
	RANK() OVER(ORDER BY CustomerID DESC) RankCustomers
FROM Sales.Orders
GROUP BY CustomerID








































































