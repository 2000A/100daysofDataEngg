--SQL AGGREGATE Window Functions | COUNT, AVG,SUM,MAX,MIN|

--Find the total number of orders

SELECT
	COUNT(*) TotalOrders
FROM Sales.Orders


--Find the total number of orders 
--Find the total number of Orders for each customers
--additionally provide details such order id & order date

SELECT
	OrderId,
	OrderDate,
	CustomerId,
	COUNT(*) OVER() TotalOrders,
	COUNT(*) OVER(PARTITION BY Customerid) OrdersByCustomers
FROM Sales.Orders

--Find the total number of Customers
--Find the total number of scores for the customers
--Additionally provide All customers Details.

SELECT 	
	*,
	COUNT(*) OVER() TotalCustomersStar,
	COUNT(1) OVER() TotalCustomersOne,
	COUNT(Score) OVER() TotalScores,
	COUNT(Country) OVER() TotalCountries
FROM Sales.Customers


--Check whether the table 'orders' contains any duplicate rows
SELECT
	OrderID,
	COUNT(*) OVER (PARTITION BY OrderID) CheckPK
FROM Sales.OrdersArchive

--Generate a list of duplicate 
SELECT
*
FROM (
	SELECT
		OrderID,
		COUNT(*) OVER (PARTITION BY OrderID) CheckPK
	FROM Sales.OrdersArchive
) WHERE CheckPK > 1


-- Aggregate Window Function SUM() 

--Find the toal sales across all orders and the 
--total sales for each product.
--Additionally, provide details such as order ID and order date.


SELECT
	OrderID,
	OrderDate,
	Sales,
	ProductID,
	SUM(Sales) OVER () TotalSales,
	SUM(Sales) OVER (PARTITION BY ProductID) SalesByProduct
FROM Sales.Orders

--Find the percentage contribution of each produt's sales to the toal sales.
SELECT
	OrderID,
	OrderDate,
	Sales,
	SUM(Sales) OVER () TotalSales,
	ROUND (CAST(CAST(Sales AS FLOAT) AS NUMERIC)/SUM(Sales) OVER () * 100, 2) PercentageOfTotal
FROM Sales.Orders

/* Above example also a PART-TO-WHOLE analysis Where it 
shows the contribution of each data point to the overall dataset*/


/*-------------AVG() window function-------------*/
--Find the avegrage sales across all orders
--And find the average sales for each product
--Additionally provide details such order Id, order date

SELECT
	OrderId,
	OrderDate,
	Sales,
	ProductId,
	AVG(Sales) OVER () AvgSales,
	AVG(Sales) OVER (PARTITION BY ProductId) AvgProductSales
FROM Sales.Orders


--Handling NULLs 

--Find the average scores of customers
--Additionally provide details such CustomerID and LastName

--here we have NULL therefore used COALESCE
SELECT
	CustomerId,
	LastName,
	Score,
	COALESCE(Score,0) CustomerScore,
	AVG(Score) OVER () AvgScore,
	AVG(COALESCE(Score,0)) OVER () AvgScoreWithoutNull
FROM Sales.Customers

--Find all orders where sales are higher than the average sales across all orders
SELECT 
*
FROM(SELECT
		OrderId,
		OrderDate,
		Sales,
		AVG(Sales) OVER () AvgSales
	 FROM Sales.Orders
	 )t WHERE Sales > AvgSales


/* MIN/MAX window aggregation functions */


--Find the highest & lowest sales across all orders
--and the highest & lowest sales for each product.
--Additionally, provide details such as order ID and order date.

SELECT
	OrderID,
	OrderDate,
	Sales,
	ProductId,
	MIN(Sales) OVER () LowestSales,
	MAX(Sales) OVER () HighestSales,
	MIN(Sales) OVER (PARTITION BY ProductId) LowestSalesByProduct,
	MAX(Sales) OVER (PARTITION BY ProductId) HighestSalesByProduct
FROM Sales.Orders


--Show the empolyees with the highest salaries.

SELECT
*
FROM(
	SELECT
	*,
	MAX(Salary) OVER () HighestSalary
	FROM Sales.Employees
)t WHERE Salary = HighestSalary

--Find the deviation of each sales from the minimum and maximus sales amounts

SELECT
	OrderId,
	OrderDate,
	ProductId,
	Sales,
	MAX(Sales) OVER() HighestSales,
	MIN(Sales) OVER() LowestSales,
	Sales - MIN(Sales) OVER() DeviationFromMin,
	MAX(Sales) OVER() - Sales DeviationFromMax
FROM Sales.Orders

--Analytical USE CASES:
 
-- Calculate moving average of sales for each product over time.

--Note: Over time analysis means sorting dates in ascending order.

SELECT
	OrderId,
	ProductId,
	OrderDate,
	Sales,
	AVG(Sales) OVER (PARTITION BY ProductId) AvgByProduct,
	AVG(Sales) OVER (PARTITION BY ProductId ORDER BY OrderDate) MovingAvg
FROM Sales.Orders

-- Calculate moving average of sales for each product over time,
--including only the next order.


SELECT
	OrderId,
	ProductId,
	OrderDate,
	Sales,
	AVG(Sales) OVER (PARTITION BY ProductId) AvgByProduct,
	AVG(Sales) OVER (PARTITION BY ProductId ORDER BY OrderDate) MovingAvg,
	AVG(Sales) OVER (PARTITION BY ProductId ORDER BY OrderDate ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING) RollingAvg 
FROM Sales.Orders






























































