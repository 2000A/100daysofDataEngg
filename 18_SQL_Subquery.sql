-- Subquery chapter

-- Result type has three types 
/* 1. Scalar Subquery : single row single coloumn output means result is single value
   2. Row Subquery    :  one column multiple rows output
   3. Table Subquery  : Multiple row and column output
wll these code will completed after the lecture .
  */

 -- Location | Clauses 
 
 
 -- 2.Subquery in FROM CLAUSE
 /* Task: Find the products that have a price 
 		  higher than the average price of all products */

SELECT
*
FROM(
SELECT 
	ProductId,
	Price,
	AVG(ROUND(Price)) OVER() AvgPrice
FROM Sales.Products)t
WHERE 
	Price > AvgPrice



SELECT
OrderId,
ProductId,
Sales
FROM(
SELECT 
OrderId,
ProductId,
Sales,
AVG(Sales) OVER() AvgPrice
FROM Sales.Orders
)t 
WHERE Sales > AvgPrice


-- Rank Customers based on their total amount of sales

SELECT
*,
RANK() OVER(ORDER BY TotalSales DESC) CustomerRank
FROM(
	SELECT 
		 CustomerId,
		 SUM(Sales) TotalSales
	FROM Sales.Orders
	GROUP BY CustomerId

)t

-- 1. SubQuery in SELECT CLAUSE
-- Imp Rules: Only Scalar Subqueries are allowed to be used means single value result only


-- Show the product IDs, product names, prices, and the total number of orders

SELECT 
	ProductId,
	Product,
	Price,
	(SELECT COUNT(*) FROM Sales.Orders) TotalOrders
FROM Sales.Products


-- 3. Subquery in JOIN CLAUSE

/* Used to prepare the data (filtering or aggregation) 
before joining it with other tables. */


-- Show all customer details and find the total orders of each customer

SELECT 
c.*,
o.TotalOrders
FROM Sales.Customers c
LEFT JOIN (	SELECT 
			CustomerId,
			COUNT(*) TotalOrders
			FROM Sales.Orders
			GROUP BY CustomerId) o
ON c.CustomerId = o.CustomerId



-- 4. Subquery in WHERE CLAUSE
/* Used for complex filtering logic and makes query more flexible
and dynamic. 

In WHERE CLAUSE SUBQUERY can be written with comparison 
operators and with logical operators

Since Subquery will be used to filter the Main Query table
therfore :
Imp Rule Comparison operator: Only Sclara Subqueires are allowed to be used
*/

--Find the products that have a price higher 
--than the average price of all products.

SELECT 
	ProductId,
	Product,
	Price
FROM Sales.Products
WHERE Price > (SELECT 
				AVG(Price) AvgPrice 
				FROM Sales.Products)


-- Subquery in IN operator
-- IN operator checks whether a value matches any value form a list.
-- Imp difference here from comparison oprator
-- Subquery can have multiple rows unlike scaler subquery in comparison operator above



-- Show the details of orders made by customers in Germany


SELECT 
* 
FROM Sales.Orders
WHERE CustomerId IN 
				(SELECT 
				CustomerId
				FROM Sales.Customers
				WHERE country = 'Germany')


-- Show the details of orders for customers who are not
-- from Germany


SELECT 
* 
FROM Sales.Orders
WHERE CustomerId IN 
				(SELECT 
				CustomerId
				FROM Sales.Customers
				WHERE country != 'Germany')

--Here we are say customer id should not be equal to one of those value ie, 1&4
SELECT 
* 
FROM Sales.Orders
WHERE CustomerId NOT IN 
				(SELECT 
				CustomerId
				FROM Sales.Customers
				WHERE country = 'Germany')


-- Subquery in ANY | ALL operators
-- ANY Operator: Checks if a value matches ANY value within a list.
-- Used to check if a value is true for ATLEAST one of the values in a list.


--Find female employees whose salaries are greater
--than the salaries of any male employees

SELECT 
	EmployeeId,
	FirstName,
	Salary
FROM Sales.Employees
WHERE gender = 'F'
AND Salary > ANY(
				SELECT 
					Salary
				FROM Sales.Employees
				WHERE gender = 'M') 



-- ALL operator
-- Checks if a value matches ALL values within a list.


SELECT 
	EmployeeId,
	FirstName,
	Salary
FROM Sales.Employees
WHERE gender = 'F'
AND Salary > ALL(
				SELECT 
					Salary
				FROM Sales.Employees
				WHERE gender = 'M') 


-- Non-Correlated | Correlated Subqueries

/* All above example were of Non-Correlated subquery 
where A Subquery that can run independently from the Main 
Query 

Correlated Subquery: 
A Subquery that relays on values from the Main Query


*/
-- show all customers details ad find the total orders of each customer

SELECT
*,
(SELECT COUNT(*) FROM Sales.Orders o WHERE o.CustomerID = c.CustomerID) TotalSales
FROM Sales.Customers c


















































