
/* ==============================================================================
   SQL NULL Functions
-------------------------------------------------------------------------------
   This script highlights essential SQL functions for managing NULL values.
   It demonstrates how to handle NULLs in data aggregation, mathematical operations,
   sorting, and comparisons. These techniques help maintain data integrity 
   and ensure accurate query results.

   Table of Contents:
     1. Handle NULL - Data Aggregation
     2. Handle NULL - Mathematical Operators
     3. Handle NULL - Sorting Data
     4. NULLIF - Division by Zero
     5. IS NULL - IS NOT NULL
     6. LEFT ANTI JOIN
     7. NULLs vs Empty String vs Blank Spaces
===============================================================================
*/

/* ==============================================================================
   HANDLE NULL - DATA AGGREGATION
===============================================================================*/

-- SQL SERVER code
/* TASK 1:
	Find the average scores of the customers.
	Uses COALESCE to replace NULL Score with 0
*/
-- COALESCE code is for both sql server and postgresql
SELECT
	CustomerID,
	Score,
	COALESCE(Score, 0) AS Score2,
	AVG(Score) OVER () AS AvgScores,
	AVG(COALESCE(Score, 0)) OVER () AS AvgScore2
FROM Sales.Customers;

/* ==============================================================================
   HANDLE NULL - MATHEMATICAL OPERATORS
===============================================================================*/
/* TASK 2: 
   Display the full name of customers in a single field by merging their
   first and last names, and add 10 bonus points to each customer's score.
*/
/* Code for sql server where + used for concatination*/
SELECT 
	CustomerID,
	FirstName,
	LastName,
	FirstName + ' ' + COALESCE(LastName, '') AS FullName
FROM Sales.Customers;

/* Code for postgresql where || used for concatenation*/

SELECT
	CustomerID,
	FirstName,
	LastName,
	FirstName || ' ' || COALESCE(LastName, '') AS FullName,
	Score,
	COALESCE(Score, 0) + 10 AS ScoreWithBonus
FROM Sales.Customers;

/* ==============================================================================
   HANDLE NULL - SORTING DATA
===============================================================================*/
/* Sort the customers from lowest to highest scores,
with nulls appearing last
*/

SELECT
CustomerID,
Score,
--COALESCE(Score, 99999) this is static vaule which should not be used
CASE WHEN Score IS NULL THEN 1 ELSE 0 END Flag
FROM Sales.Customers
ORDER BY CASE WHEN Score IS NULL THEN 1 ELSE 0 END, Score


/* ==============================================================================
   NULLIF - DIVISION BY ZERO
===============================================================================*/

/* Find the sales price for each order by dividing sales by quantity */

SELECT
	OrderId,
	Sales,
	Quantity,
	Sales / Quantity AS Price
FROM Sales.Orders

-- We will use NULLIF() to avoid dividing by 0

SELECT
	OrderID,
	Sales,
	Quantity,
	Sales / NULLIF(Quantity,0) AS Price
FROM Sales.Orders


/* ==============================================================================
   IS NULL - IS NOT NULL
===============================================================================*/
-- USE CASE: Filtering data (Searching for missing informations or searching for NULLs)
/* TASK 5: 
   Identify the customers who have no scores 
*/

SELECT *
FROM Sales.Customers
WHERE Score IS NULL;

/* TASK 6:
	Identify the customers who have scores
*/

SELECT *
FROM Sales.customers
WHERE Score IS NOT NULL


/* ==============================================================================
   IS NULL USE CASE : LEFT ANTI JOIN
===============================================================================*/

/* TASK 7: 
   List all details for customers who have not placed any orders 
*/

SELECT
	c.*,
	o.OrderID
FROM Sales.Customers c
LEFT JOIN Sales.Orders o
ON c.CustomerID = o.CustomerID
WHERE o.CustomerID IS NULL

/* ==============================================================================
   NULLs vs EMPTY STRING vs BLANK SPACES
===============================================================================*/

/* TASK 8: 
   Demonstrate differences between NULL, empty strings, and blank spaces 
*/

--SQL Server code
WITH Orders AS (
SELECT 1 Id, 'A' Category UNION
SELECT 2, NULL UNION
SELECT 3, '' UNION
SELECT 4, ' '
)
SELECT 
*,
DATALENGTH(Category) CategoryLen
FROM Orders



/*
| Purpose          | PostgreSQL Function           | Notes                                   |
| ---------------- | ----------------------------- | --------------------------------------- |
| Byte length      | `octet_length()`              | Equivalent to SQL Server `DATALENGTH()` |
| Character length | `char_length()` or `length()` | Counts characters, not bytes            |
| Trim whitespace  | `trim()`                      | SQL standard                            |


 */


WITH Orders AS (
SELECT 1 Id, 'A' Category UNION
SELECT 2 , NULL UNION
SELECT 3, '' UNION
SELECT 4, '  '
)
SELECT
	*,
	OCTET_LENGTH(Category)
FROM Orders



/* 
#1 Data Policy 
Only use NULLs and empty strings, but avoid blank spaces.

#2 Data Policy
Only use NULLs and avoid using empty strings and blank spaces.

#3 Data Policy
Use the default value 'unkown' and avoid using nulls,
empty strings, and blank spaces.
*/

WITH Orders AS(
SELECT 1 Id, 'A' Category UNION
SELECT 2, NULL UNION
SELECT 3, '' UNION
SELECT 4, '  '
)
SELECT
*,
TRIM(Category) Policy1,
--OCTET_LENGTH(TRIM(Category)) length
NULLIF(TRIM(Category),'') Policy2,
COALESCE(NULLIF(TRIM(Category),''),'unkown') Policy3
FROM Orders











































































