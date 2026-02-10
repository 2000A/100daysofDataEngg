-- Integer based ranking

-- ROW_NUMBER()  - Unique Ranking, leaving no gaps(no skipping)
-- Assign a unique number to each row.
-- It doesn't handle ties (if say two rows has same values still assigned unique number ie no same rank sharing)
-- No skipping of ranking

-- Rank the orders based on their sales from highest to lowest
SELECT
	OrderId,
	ProductId,
	Sales,
	ROW_NUMBER() OVER(ORDER BY Sales DESC) SalesRank_Row
FROM Sales.Orders



-- RANK() - Shared Ranking, leaving gaps(skipping)
-- Assign a rank to each row
-- It handles ties (i.e, Same value same rank)
-- It leaves gaps in ranking (usually happens to row after similar values)

SELECT
	OrderId,
	ProductId,
	Sales,
	RANK() OVER(ORDER BY Sales DESC) SalesRank_Rank
FROM Sales.Orders


-- DENSE_RANK() - Shared Ranking, leaving no gaps(no skipping)
-- Assighn a rank to each row.
-- It handles ties.
-- It doen't leaves gaps in ranking.


-- Rank the orders based on their sales from highest to lowest
SELECT
	OrderId,
	ProductId,
	Sales,
	DENSE_RANK() OVER(ORDER BY Sales DESC) SalesRank_Dense
FROM Sales.Orders


-- ROW_NUMBER 
-- USE CASE:1
-- TOP-N ANALYSIS : Analysis the top performers to do targeted marketing

-- Find the top hishest sales for each product

/* Each window (products) will have top performing products
Since we want only the top performing products only from each window use subquery*/

SELECT *
FROM (
SELECT 
	OrderId,
	ProductId,
	Sales,
	ROW_NUMBER() OVER(PARTITION BY ProductId ORDER BY Sales DESC) RankByProduct
FROM Sales.Orders
)t WHERE RankByProduct = 1


--USE CASE 2: BOTTON-N ANALYSIS
/* Helps analysis the underperformance to manage risks and to do optimizations*/

-- Find the lowest 2 customers based on their total sales
SELECT *
FROM (
SELECT 
	CustomerId,
	SUM(Sales) TotalSales,
	ROW_NUMBER() OVER(ORDER BY SUM(Sales)) RankCustomers
FROM Sales.Orders
GROUP BY CustomerId 
)t WHERE RankCustomers <=2


/* USE CASE 3: Assign unique IDs
Say we have table without primary key and we like to create
unique id for each row

-> Help to assign unique identifier for each row to help paginating
PAGINATING: The process of breaking down a large data into smaller, more
manageable chunks
*/

-- Assign unique IDs to the rows of the 'Orders Archive' table

SELECT 
ROW_NUMBER() OVER(ORDER BY Orderid,OrderDate) UniqueId,
*
FROM Sales.OrdersArchive

/* USE CASE 4: IDENTIFY DUPLICATES
Identify and remove duplicates rows to improve data qualty
*/

-- Identify duplicate rows in the table 'Orders Archive'
-- and return a clean result without any dupliates
-- you can write another query to alert the source system about fault 

SELECT *
FROM(
SELECT
ROW_NUMBER() OVER(PARTITION BY OrderId ORDER BY CreationTime DESC) rn,
*
FROM Sales.OrdersArchive
)t WHERE rn = 1


SELECT *
FROM(
SELECT
ROW_NUMBER() OVER(PARTITION BY OrderId ORDER BY CreationTime DESC) rn,
*
FROM Sales.OrdersArchive
)t WHERE rn > 1


/* NTILE():
Divides the rows into a specified number of approximately 
equal groups(Barakets)

** impt to note: Larger groups comes first 
*/

SELECT
	OrderId,
	Sales,
	NTILE(4) OVER(ORDER BY Sales DESC) OneBucket,
	NTILE(3) OVER(ORDER BY Sales DESC) OneBucket, /* (Bucket Size) 3 ~10/3 */
	NTILE(2) OVER(ORDER BY Sales DESC) TwoBucket,
	NTILE(1) OVER(ORDER BY Sales DESC) OneBucket  /*Bucket size = 1 = 10/1  */
FROM Sales.Orders

/* for odd numbers first bucket make itself bigger so othr bucket gets equal bucket size like in bucket size 3 above example*/

--USE CASE 1: DATA SEGMENTATION (used by data analyst)
-- Divides a dataset into distinct subsets based on certain criteria.

-- sEGMENT ALL ORDERS INTO 3 CATEGORIES: HIGH, MEDIUM AND LOW SALES.
SELECT 
*,
CASE WHEN Bucket = 1 THEN 'HIGH'
	 WHEN Bucket = 2 THEN 'MEDIUM'
	 WHEN Bucket = 3 THEN 'LOW'
END SalesSegmentations
FROM(
SELECT
	OrderId,
	Sales,
	NTILE(3) OVER(ORDER BY SALES DESC) Bucket
FROM Sales.Orders

)

/* USE CASE 2: EQUALIZING LOAD (used by Data engineer)
Data engineers can use NTILE() for load balancing in ETL */

-- In order to export the data, divide the orders into 2 groups.

SELECT
NTILE(2) OVER(ORDER BY OrderId) Buckets,
*
FROM Sales.Orders

/* impp note: In ORDER BY we can add any column but we use
PK like orderid which contains sequence of numbers its recommended */



--PERCENTAGE BASED RANKING FUNCTIONS

-- Great for distribution analysis.

-- Find the products that fall within the highest 40% of the prices

SELECT 
*,
CONCAT(DistRank * 100, '%')DistRankPerc
FROM(
SELECT
	Product,
	Price,
	CUME_DIST() OVER(ORDER BY Price DESC) DistRank
FROM Sales.Products
)t WHERE DistRank <= 0.4




SELECT 
*,
CONCAT(DistRank * 100, '%')DistRankPerc
FROM(
SELECT
	Product,
	Price,
	PERCENT_RANK() OVER(ORDER BY Price DESC) DistRank
FROM Sales.Products
)t WHERE DistRank <= 0.4
















