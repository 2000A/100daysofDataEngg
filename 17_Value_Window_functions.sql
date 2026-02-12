-- Lag() and Lead() 
/* Use case 1: Time Series Analysis */
-- Analyze the month-over-month performance by finding the percentage change
-- in sales between the current and previous months

SELECT
*,
CurrentMonthSales - PreviousMonthSales AS MoM_Change,
ROUND(CAST((CurrentMonthSales - PreviousMonthSales) AS FLOAT)/PreviousMonthSales * 100)AS Mom_Perc
FROM(
SELECT 
	DATE_PART('month', OrderDate) AS OrderMonth,
	SUM(Sales) CurrentMonthSales,
	LAG(SUM(Sales)) OVER(ORDER BY DATE_PART('month', OrderDate)) PreviousMonthSales
FROM Sales.Orders
GROUP BY 
	DATE_PART('month', OrderDate)

)t

--USE CASE 2: CUSTOMER RETENTION ANALYSIS

--In order to analyze customer loyalty,
--rank custoemrs based on the average days between their orders

SELECT
CustomerId,
AVG(DaysUntilNextOrder) AvgDays,
RANK() OVER(ORDER BY COALESCE(AVG(DaysUntilNextOrder), 99999)) RankAvg
FROM(
SELECT
OrderId,
CustomerId,
OrderDate As CurrentDate,
LEAD(OrderDate) OVER(PARTITION BY CustomerId ORDER BY OrderDate) NextOrder,
ABS(OrderDate - LEAD(OrderDate) OVER(PARTITION BY CustomerId ORDER BY OrderDate)) AS DaysUntilNextOrder
FROM Sales.Orders
)t
GROUP BY 
	CustomerId


/* FIRST_VALUE AND LAST_VALUE */
-- Use case: Compare to Extermes
--How well a value is performing relative to the extremes

--Find the lowest and highest sales for each product
-- Find the difference in sales between the current and the lowest sales.


/* Default frame for FIRST_VALUE AND LAST_VALUE IS: ROW BETWEEN UNBOUNDED PRECEEDING AND CURRENT ROW */
SELECT 
OrderId,
ProductId,
Sales,
FIRST_VALUE(Sales) OVER(PARTITION BY ProductId ORDER BY Sales) LowestSales,
LAST_VALUE(Sales) OVER(PARTITION BY ProductId ORDER BY Sales 
ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) HishestSales,
FIRST_VALUE(Sales) OVER(PARTITION BY ProductId ORDER BY Sales DESC) HighestSales2,
MIN(Sales) OVER(PARTITION BY ProductId) LowestSales2,
MAX(Sales) OVER(PARTITION BY ProductId) HishestSaleUsingMax
FROM Sales.Orders






SELECT 
OrderId,
ProductId,
Sales,
FIRST_VALUE(Sales) OVER(PARTITION BY ProductId ORDER BY Sales) LowestSales,
LAST_VALUE(Sales) OVER(PARTITION BY ProductId ORDER BY Sales 
ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) HishestSales,
Sales - FIRST_VALUE(Sales) OVER(PARTITION BY ProductId ORDER BY Sales) AS SalesDifference
FROM Sales.Orders
























































































