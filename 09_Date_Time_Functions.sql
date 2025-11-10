/* ==============================================================================
   SQL Date & Time Functions
-------------------------------------------------------------------------------
   This script demonstrates various date and time functions in SQL.
   It covers functions such as GETDATE, DATETRUNC, DATENAME, DATEPART,
   YEAR, MONTH, DAY, EOMONTH, FORMAT, CONVERT, CAST, DATEADD, DATEDIFF,
   and ISDATE.
   
   Table of Contents:
     1. GETDATE | Date Values 
     2. Date Part Extractions (DATETRUNC, DATENAME, DATEPART, YEAR, MONTH, DAY)
     3. DATETRUNC
     4. EOMONTH
     5. Date Parts
     6. FORMAT
     7. CONVERT
     8. CAST
     9. DATEADD / DATEDIFF
    10. ISDATE
===============================================================================
*/

/* ==============================================================================
   GETDATE() | DATE VALUES
===============================================================================*/

/* TASK 1:
   Display OrderID, CreationTime, a hard-coded date, and the current system date.
*/

SELECT
	OrderID,
	CreationTime,
	'2025-08-20' AS HardCoded,
	--GETDATE() AS Today
	NOW() AS Today
FROM Sales.Orders;

/* ==============================================================================
   DATE PART EXTRACTIONS
   (DATETRUNC, DATENAME, DATEPART, YEAR, MONTH, DAY)
===============================================================================*/


/* TASK 2:
   Extract various parts of CreationTime using DATETRUNC, DATENAME, DATEPART,
   YEAR, MONTH, and DAY.
*/
SELECT
	--DATETRUNC Examples
	Date_TRUNC('year', CreationTime) AS Month_dt,
	DATE_TRUNC('hour', CreationTime) AS Hour_dt,
	DATE_TRUNC('minute', CreationTime) AS Minute_dt,
	--DATENAME Examples
	TO_CHAR(CreationTime,'day') AS DAY_dn,
	TO_CHAR(CreationTime,'month') AS Month_dn,
	TO_CHAR(CreationTime,'YYYY') AS Year_dn,
	--DATEPART(part, date) Examples
	DATE_PART('year', CreationTime) AS Year_dp,
	DATE_PART('month', CreationTime) AS Month_dp,
	DATE_PART('day', CreationTime) AS Day_dp,
	DATE_PART('hour', CreationTime) AS Hour_dp,
	DATE_PART('minute', CreationTime) AS Minute_dp,
	DATE_PART('quarter', CreationTime) AS Quarter_dp,
	DATE_PART('week', CreationTime) AS Week_dp,
	EXTRACT(YEAR FROM CreationTime) As YEAR,
	EXTRACT(MONTH FROM CreationTime) As MONTH,
	EXTRACT(DAY FROM CreationTime) As DAY
	--YEAR(CreationTime) AS Years,
	--MONTH(CreationTime) AS Month,
	--DAY(CreationTime) AS DAY
FROM Sales.Orders;


/* MYSQL PART 

SELECT
    OrderID,
    CreationTime,
    -- DATETRUNC Examples
    DATETRUNC(year, CreationTime) AS Year_dt,
    DATETRUNC(day, CreationTime) AS Day_dt,
    DATETRUNC(minute, CreationTime) AS Minute_dt,
    -- DATENAME Examples
    DATENAME(month, CreationTime) AS Month_dn,
    DATENAME(weekday, CreationTime) AS Weekday_dn,
    DATENAME(day, CreationTime) AS Day_dn,
    DATENAME(year, CreationTime) AS Year_dn,
    -- DATEPART Examples
    DATEPART(year, CreationTime) AS Year_dp,
    DATEPART(month, CreationTime) AS Month_dp,
    DATEPART(day, CreationTime) AS Day_dp,
    DATEPART(hour, CreationTime) AS Hour_dp,
    DATEPART(quarter, CreationTime) AS Quarter_dp,
    DATEPART(week, CreationTime) AS Week_dp,
    YEAR(CreationTime) AS Year,
    MONTH(CreationTime) AS Month,
    DAY(CreationTime) AS Day
FROM Sales.Orders;

*/

/* ==============================================================================
   DATETRUNC() DATA AGGREGATION
===============================================================================*/

SELECT
	DATE_TRUNC('year', CreationTime) As Year_dt,
	COUNT(*) AS OrderCount
FROM Sales.Orders
GROUP BY DATE_TRUNC('year', CreationTime)

/* ==============================================================================
   EOMONTH()
===============================================================================*/
/* TASK 4:
   Display OrderID, CreationTime, and the end-of-month date for CreationTime.
*/
--Note postgresql doesn't have feature like end of month but its possible
SELECT
	OrderID,
	CreationTime,
	EOMONTH(CreationTime) AS EndOfMonth
FROM Sales.Orders;


/* ==============================================================================
   DATE PARTS | USE CASES
===============================================================================*/
/* TASK 5:
   How many orders were placed each year?
*/

SELECT 
 DATE_PART('year', OrderDate) AS OrderYear,
 COUNT(*) AS TotalOrders
FROM Sales.Orders
GROUP BY DATE_PART('year', OrderDate)

/* TASK 6:
   How many orders were placed each month?
*/
SELECT
	DATE_PART('month', OrderDate) AS OrderMonth,
	COUNT(*) AS TotalOrders
FROM Sales.Orders
GROUP BY DATE_PART('month', OrderDate)

/* TASK 7:
   How many orders were placed each month (using friendly month names)?
*/

SELECT
	TO_CHAR(OrderDate, 'month') AS OrderMonth,
	COUNT(*) AS TotalOrders
FROM Sales.Orders
WHERE TO_CHAR(OrderDate, 'month') LIKE 'february%'
GROUP BY TO_CHAR(OrderDate,'month')



SELECT 
	*
FROM Sales.Orders
WHERE DATE_PART('month',OrderDate) = 2


-- Best Practice
--Filtering Data using an Integer is faster than using string
--Avoid using DATENAME for filtering data, instead use DATEPART

/* ==============================================================================
   FORMAT()
===============================================================================*/

/* TASK 9:
 Format CreationTime into various string representations.
*/
/*
-- Below code is for MYSQL where FORMAT() FUNCTION is used for formating date and time
SELECT
	OrderID,
	CreationTime,
	FORMAT(CreationTime, 'MM-dd-yyyy') AS USA_Format,
	FORMAT(CreationTime, 'dd-MM-yyyy') AS EURO_Format,
	FORMAT(CreationTime, 'dd') AS dd,                 (Day of month (01–31))
	FORMAT(CreationTime, 'ddd') AS ddd,               (gives like tue, mon like this)
	FORMAT(CreationTime, 'dddd') AS dddd,             (gives full monday, tuesday like this)
	FORMAT(CreationTime, 'MM') AS MM,                  (same for month)
	FORMAT(CreationTime, 'MMM') AS MMM,
	FORMAT(CreationTime, 'MMMM') AS MMMM
FROM Sales.Orders;  */

--In postgresql FORMAT() has different puspose first check the alternative

SELECT 
	OrderID,
	CreationTime,
	TO_CHAR(CreationTime, 'MM-dd-yyyy') AS USA_Format,
	TO_CHAR(CreationTime, 'dd-MM-yyyy') AS EURO_Format,
	TO_CHAR(CreationTime, 'dd') AS dd,
	TO_CHAR(CreationTime, 'Dy') AS Dy,
	TO_CHAR(CreationTime, 'Day') AS Day,
	TO_CHAR(CreationTime, 'MM') AS MM,
	TO_CHAR(CreationTime, 'Mon') AS Mon,
	TO_CHAR(CreationTime, 'Month') AS Month
FROM Sales.Orders;

/* TASK 10:
   Display CreationTime using a custom format:
   Example: Day Wed Jan Q1 2025 12:34:56 PM
*/

SELECT 
	OrderID,
	CreationTime,
	'Day ' || TO_CHAR(CreationTime, 'Dy Mon') ||
	' Q'|| DATE_PART('quarter', CreationTime)::text || ' ' ||
	TO_CHAR(CreationTime, 'yyyy HH12:MI:SS AM') As CustomFormat
FROM Sales.Orders;

/* TASK 11:
   How many orders were placed each year, formatted by month and year (e.g., "Jan 25")?
*/

SELECT 
	TO_CHAR(OrderDate, 'Mon YY'),
	COUNT(*) AS TotalOrders
FROM Sales.Orders
GROUP BY TO_CHAR(OrderDate, 'Mon YY');

/* ==============================================================================
   CONVERT(type, expr) is in mysql |  CAST(expr AS type) or ::type in 
===============================================================================*/

/* TASK 12:
	Demonstrate conversion using CONVERT.

SELECT
	CONVERT(INT, '123') AS [String to Int CONVERT],
	CONVERT(DATE, '2025-08-20') AS [STRING TO Date CONVERT],
	CreationTime,
	CONVERT(DATE, CreationTime) AS [Datetime to Date CONVERT],
    CONVERT(VARCHAR, CreationTime, 32) AS [USA Std. Style:32],
    CONVERT(VARCHAR, CreationTime, 34) AS [EURO Std. Style:34]
FROM Sales.Orders;
*/

SELECT
	 CAST('123'AS INT) AS "String to Int CAST",
	 CAST('2025-08-20' AS DATE) "String to Date CAST",
	 CreationTime,
	 CAST(CreationTime AS DATE) "Datetime to Date CAST",
	 --Cast() methos not possible to use numeric standards for that use TO_CHAR()
	 CAST(CreationTime AS VARCHAR)
FROM Sales.Orders;

/* ==============================================================================
   CAST() MYSQL PART
===============================================================================*/

/* TASK 13:
   Convert data types using CAST.

SELECT
    CAST('123' AS INT) AS [String to Int],
    CAST(123 AS VARCHAR) AS [Int to String],
    CAST('2025-08-20' AS DATE) AS [String to Date],
    CAST('2025-08-20' AS DATETIME2) AS [String to Datetime],
    CreationTime,
    CAST(CreationTime AS DATE) AS [Datetime to Date]
FROM Sales.Orders;

*/

/* ==============================================================================
   DATEADD() / DATEDIFF() MYSQL PART
===============================================================================*/

/* TASK 14:
   Perform date arithmetic on OrderDate.

SELECT
    OrderID,
    OrderDate,
    DATEADD(day, -10, OrderDate) AS TenDaysBefore,
    DATEADD(month, 3, OrderDate) AS ThreeMonthsLater,
    DATEADD(year, 2, OrderDate) AS TwoYearsLater
FROM Sales.Orders;
*/

SELECT
	OrderID,
	OrderDate,
	CreationTime,
	CreationTime - INTERVAL '10 days' AS sub_days,
	CreationTime + INTERVAL '10 days' AS added_days,
	CreationTime + INTERVAL '3 months' AS added_month,
	CreationTime + INTERVAL '2 years' AS added_year
FROM Sales.Orders

/* TASK 15:
	Calculate the age of employees.
*/
SELECT 
	EmployeeID,
	BirthDate,
	DATE_PART('year',NOW()) - DATE_PART('year',BirthDate) AS "Age",
	EXTRACT(YEAR FROM AGE(NOW(), BirthDate)) AS age
FROM Sales.Employees;
	

/* TASK 16:
   Find the average shipping duration in days for each month.
*/

SELECT 
	EXTRACT(month FROM OrderDate) AS OrderMonth,
	AVG(AGE(ShipDate, OrderDate))
FROM Sales.Orders
GROUP BY EXTRACT(month FROM OrderDate);

/* TASK 17:
   Time Gap Analysis: Find the number of days between each order and the previous order.
*/
--MYSQL Version
SELECT
    OrderID,
    OrderDate AS CurrentOrderDate,
    LAG(OrderDate) OVER (ORDER BY OrderDate) AS PreviousOrderDate,
    DATEDIFF(day, LAG(OrderDate) OVER (ORDER BY OrderDate), OrderDate) AS NrOfDays
FROM Sales.Orders;

-- Postgresql version
SELECT
    OrderID,
    OrderDate AS CurrentOrderDate,
    LAG(OrderDate) OVER (ORDER BY OrderDate) AS PreviousOrderDate,
	OrderDate - LAG(OrderDate) OVER (ORDER BY OrderDate)AS NrOfDays
FROM Sales.Orders;

/* ==============================================================================
   ISDATE()
===============================================================================*/
/* TASK 18:
   Validate OrderDate using ISDATE and convert valid dates.
*/
--MYSQL version
SELECT
    OrderDate,
    ISDATE(OrderDate) AS IsValidDate,
    CASE 
        WHEN ISDATE(OrderDate) = 1 THEN CAST(OrderDate AS DATE)
        ELSE '9999-01-01'
    END AS NewOrderDate
FROM (
    SELECT '2025-08-20' AS OrderDate UNION
    SELECT '2025-08-21' UNION
    SELECT '2025-08-23' UNION
    SELECT '2025-08'
) AS t
-- WHERE ISDATE(OrderDate) = 0


--POSTGRESQL verion

CREATE OR REPLACE FUNCTION is_date(text) RETURNS boolean AS $$
BEGIN
    PERFORM TO_DATE($1, 'YYYY-MM-DD');
    RETURN TRUE;
EXCEPTION WHEN OTHERS THEN
    RETURN FALSE;
END;
$$ LANGUAGE plpgsql;

SELECT is_date('2025-11-10');  -- returns true
SELECT is_date('abc');         -- returns false




SELECT
    my_column,
    CASE 
        WHEN my_column ~ '^\d{4}-\d{2}-\d{2}$' THEN TRUE
        ELSE FALSE
    END AS is_valid_date
FROM my_table;

























































































































