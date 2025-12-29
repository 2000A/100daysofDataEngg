# 100daysofDataEngg
Repo contains my 100 days of Data Engineering journey from learning basics to advance python and sql, projects and learning other data warehouse tools and more

SQL important notes:
SQL standard way to explain anyone its a language helps talks to Database.

Why Database:
1. can store/handle massive amount of data which spreadsheets cannot
2. Security

DBMS :
Database is just storage which cannot handle/manage query So we have DBMS
that helps to magnage database like which query to give priority

Note: 
ORDER BY 
Nested sorting means in order by we can pass list of columns comma separated.
Nested sorting columns sequencing is important.
Nested sorting only make sense if you have repitition in your result we can take help of second column to refine it.

-------------------------------------------------------------------------

Nested sorting ( More refining the result)


Group By : Combines rows with the same value. 
           Aggregates a column by another column.

Note:
Group BY rule
* All Columns in the SELECT must be either aggregated or included in the GROUP BY

SQL says I need only the columns that you want to group the data by or should be aggregated.

The Result of GROUP BY determined by the unique values of the grouped columns.


---------------------------------------------------------------------

Having

Filters Data After Aggregation.

Can be used only with Group.

Filter Your Data --------------> 1. Before Aggregation : Where
                                 2. After Aggregation : Having 

In Group BY clause we use column which needs to be grouped and In HAVING clause the agregated column is passed.
---------------------------------------------------------------------

Distinct 

<img width="936" height="511" alt="Screenshot 2025-12-09 144617" src="https://github.com/user-attachments/assets/d6c67053-aa1b-436d-a84a-0b509a4cfa2c" />

Is used to get unique list of anything say country in this case

Bad Habit with DISTINCT :
Don't use DISTINCT unless it's necessary; it can slow down your query.

Its compute heavy to use DISTINCT thats why only use when necessary and use it on duplicates 

--------------------------------------------------------------------

Top or Limit
Restrict the Number of Rows Retruned 

Using Top or Limit with sorting the data (order by) We can analyse top end analysis or bottom end analysis.

-----------------------------------------------------------------

Types of filteration in SQL


<img width="1152" height="685" alt="Screenshot 2025-12-09 151458" src="https://github.com/user-attachments/assets/5b4549e3-765f-45a3-a19e-0b0dde5292d1" />



Coding order and Execute Order


<img width="983" height="645" alt="Screenshot 2025-12-09 150017" src="https://github.com/user-attachments/assets/3257f5c2-4901-4a54-a615-4aecbce1ce9b" />

----------------------------------------------------------------------
DDL commands -> CREATE, ALTER, DROP

DDL commands never return data it is changing the structure of database
CREATE TABLE commands here creates the table in database.

ALTER means to edit the defination of table

Adding columns : The new columns are appended at the end of table by default.

ALTER Table When ADD we provide column name with data type and constraint (its new column thats why)

And for DROP COLUMN we provide only column name.

--------------------------------------------------------------------

DML - Modify(manipulate) Your Data
select, insert, update, delete to retreive, add, modify, and remove data.
 --------------------------------------------------------------------

 SQL JOINS
 1. Rows Join - Same Column
 2. Column Join - Key(same column in both table)

Why do we use joins?

1. Recombine Data:
   Data of Customers is spread accross different table so to get Big Picture we Join all tables.
   We will connecct all the four tables to get one big picture of customers.
   
<img width="893" height="407" alt="Screenshot 2025-12-20 060514" src="https://github.com/user-attachments/assets/bdaf9562-9379-4bf1-a7b9-b4e4163d1c12" />


2.Data Enrichment "Getting Extra Data"

Say we have one Master Table of Customers and now we want extra information about country zip code here we'll take help of another table called Reference Table and add zip code data to our master table.

<img width="859" height="387" alt="Screenshot 2025-12-20 061008" src="https://github.com/user-attachments/assets/c03fd54c-22d0-42eb-b974-cd71ff210320" />

3. Check for Existence "Filtering"

We have Customers master table and say I want customers who have made orders. For that we use a Lookup Table which acts as filter.
We will join the two table and here we will not add data to customers table we will filter out customers those that didn't make orders.

To check existence of your records in another table 

<img width="901" height="368" alt="Screenshot 2025-12-20 061656" src="https://github.com/user-attachments/assets/5a5d3164-f83a-4bad-84c1-faeda5eeff7a" />

Join Types:
After combining we have three possibilites

<img width="880" height="234" alt="Screenshot 2025-12-20 062138" src="https://github.com/user-attachments/assets/f75d0de0-6283-4888-9465-704485d07d6b" />


1. No Joins
-> all data from both tables without joining them.

2. INNER JOIN
   imp: order of table does not matter here
   
-> An inner join returns only the matching rows from both tables. This means that only data from Table A that has an overlapping match with Table B will be shown, and only the data from Table B that matches Table A will be included in output.
   
3. LEFT JOIN
-> Returns All rows from left and Only Matching from Right.
   left table has more priority (we want to see all data)
   and right table we need for additional data ( that only matching)

<img width="863" height="482" alt="Screenshot 2025-12-20 153930" src="https://github.com/user-attachments/assets/1a90a648-9ec1-4ab7-922d-15040de6aa8c" />

Imp: The order of tables is IMPORTANT

4. RIGHT JOIN (Try to skip it :)
   
-> Returns All Rows from Right and Only Matching from left.
<img width="889" height="459" alt="Screenshot 2025-12-20 160737" src="https://github.com/user-attachments/assets/fc19dfcb-f88f-4077-ba37-b260d3fc9b8e" />

Alternative: 
<img width="756" height="455" alt="Screenshot 2025-12-20 161612" src="https://github.com/user-attachments/assets/ffbd1cfa-8bd9-4dad-a83a-afdb727102f5" />

5. FULL JOIN
-> Returns All Rows from Both Tables.

<img width="879" height="449" alt="Screenshot 2025-12-20 163352" src="https://github.com/user-attachments/assets/344ebef3-304e-4bde-aa2e-1f0ed8a9b406" />

use cases when and where Joins can be used or will be helpful:

<img width="811" height="463" alt="Screenshot 2025-12-20 163805" src="https://github.com/user-attachments/assets/c1dd4313-0996-4947-9332-d9904852dc3b" />

ADVANCE JOIN
-> Here we get the unmatch rows of all joins

1. LEFT ANTI JOIN

<img width="854" height="466" alt="Screenshot 2025-12-20 224816" src="https://github.com/user-attachments/assets/5b267eaa-2139-4c4a-9d92-efd34e966c9d" />

2. RIGHT ANTI JOIN

<img width="898" height="510" alt="Screenshot 2025-12-20 225945" src="https://github.com/user-attachments/assets/d00bc380-1228-441a-a1e8-d2d3f9409ac7" />

Alternative to right anti join using left anti join 

<img width="818" height="473" alt="Screenshot 2025-12-20 230436" src="https://github.com/user-attachments/assets/ba7fe527-1ba0-449d-b6d1-366af62f9563" />

3. FULL ANTI JOIN
 order of tables doesn't matter.

<img width="902" height="464" alt="Screenshot 2025-12-20 231536" src="https://github.com/user-attachments/assets/8452e96b-fd22-4cbb-b0f2-b56caf21eefc" />

Which join type to use :

<img width="832" height="414" alt="Screenshot 2025-12-21 140456" src="https://github.com/user-attachments/assets/1a54c57e-8dd5-4f6d-8562-fee104b7241b" />

Multi table join:
When there is main table and you want extra information from other tables then go with left join to all the tables to master table

<img width="773" height="419" alt="Screenshot 2025-12-21 140827" src="https://github.com/user-attachments/assets/5cd9f23d-8cb2-45f9-b278-aefc72577e47" />

But when there is no such thing as master table all table are equal
then go with inner join 
<img width="469" height="455" alt="Screenshot 2025-12-21 141240" src="https://github.com/user-attachments/assets/4309f177-8521-47d7-b0ec-05706b7bfeb9" />

SET Operators(row joining join)

#1 RULE | SQL CLAUSES
- SET Operator can be used almost in all cluases
  WHERE | JOIN | GROUP BY | HAVING
- ORDER BY is allowed only once at the end of query
  (means it cannot be used in first query it can only be used in then end of second query)

<img width="859" height="488" alt="Screenshot 2025-12-23 151010" src="https://github.com/user-attachments/assets/11538d32-82d5-45da-9ce2-23605fe3f538" />

#2 RULE | NUMBER OF COLUMNS
- The number of columns in each query must be the same.

#3 RULE | DATA TYPES
- Data types of columns in each query must be compatible.

#4 RULE | ORDER OF COLUMNS
-The order of the columns in each query must be the same.

#5 RULE | COLUMN ALIASES
-The column names in the result set are determined by the columns names specified in the first query.

#6 RULE | CORRECT COLUMNS
-Even if all rules are met and SQL shows no errors, the result may be incorrect.
- Incorrect column selection leads to inaccurate results.

1. UNION
- Returns all distinct rows from both queries.
- Removes duplicates rows from the result.
- Order of queries does not matter in UNION operator

2. UNION ALL
- Returns all rows from both queries, including duplicates.

UNION ALL vs UNION 
- UNION ALL is genrally faster than UNION
  (if you're confident there are no duplicates, use UNION ALL)
  
- Use UNION ALL to find duplicates and quality issues

3. EXCEPT
- Returns all distinct rows from the first query that are anot found in the second query.

  In simple Returns unique rows in the 1st table that are not in 2nd table
  - The order of queries in a EXEPT does affect ther result!!
    why?
    say 1st query customers so we get customers that are not employee
    when 1st query employee so we get employee that are not customers.
  
4. INTERSECT
-Returns only the rows that are common in both queries.
can be used to find the employees, who are also customers.

How to use SET operators in Data Analysis:
->
<img width="508" height="448" alt="Screenshot 2025-12-23 170819" src="https://github.com/user-attachments/assets/b4ecf3bd-27a5-4143-aa05-e89f9c093987" />



<img width="837" height="474" alt="Screenshot 2025-12-23 170800" src="https://github.com/user-attachments/assets/d9e7e7f7-3281-4d16-b9ab-825e98492cda" />


* Database developers divide the data into multiple tables to optimize performance and archive old data.

<img width="811" height="466" alt="Screenshot 2025-12-23 173840" src="https://github.com/user-attachments/assets/18ab5617-aa4a-4780-bb61-c1fe0d5b72bc" />

very important : mapping data blindly using * 
best practice: never use select * while using set operator  WHY? Schema changes with time

first clearly list all columns
second method: source flag
           Include additional column to indicate the source of each row

above examples were of union operator.

EXCEPT USE CASES
- DELTA DETECTION : Identifying the differences or changes (delta) between two batches of data.

<img width="993" height="425" alt="Screenshot 2025-12-23 181920" src="https://github.com/user-attachments/assets/099402fd-0ae6-4ecd-8c10-f8e24bab294e" />

-DATA COMPLETENESS CHECK

example data migration from one database to other database 

<img width="666" height="374" alt="Screenshot 2025-12-23 182352" src="https://github.com/user-attachments/assets/9489d659-5e1b-4fc2-bd37-e3075a2cff9e" />

<img width="671" height="461" alt="Screenshot 2025-12-23 182601" src="https://github.com/user-attachments/assets/e362a538-417d-413d-bb03-e1d2977d5a55" />

---------------------------------------------------------------------
ROW LEVEL FUNCTIONS

1. Single-Row Functions : one input/row value and one result
   ex: 'MARIA' ----> LOWER() ----> 'maria'
3. Multi-Row Functions: multiple rows as input and single output
   30--->
   10--->      SUM() ----> 100
   20--->
   40--->


                          SQL Functions
   (Row-Level-Calculation)                     (Aggregations)
   single-row                                   multi-row
   functions                                    functions

   string     Numeric                   Aggregate          Window
   functions  functions                 functions         functions
                                         (Basics)         (Advanced)
   Date & Time  NULL
   functions    functions


String Functions:

<img width="787" height="477" alt="Screenshot 2025-12-24 133635" src="https://github.com/user-attachments/assets/dda87899-a52e-438c-aa72-c218abf56636" />

trick used in SUBSTRING() method to find last character position dynamically.
<img width="1026" height="692" alt="Screenshot 2025-12-24 132232" src="https://github.com/user-attachments/assets/072bdca0-4e63-4135-a9ba-a2bc9bdf6f05" />

NUMBER FUNCTIONS
1. ROUND()
2. ABS() - say we have mistake in database say minus sales which mean nothing which can be changed using ABS()

DATE & TIME FUNCTIONS:
- In sql server timestamp data type is called as DATETIME 

<img width="807" height="407" alt="Screenshot 2025-12-24 143602" src="https://github.com/user-attachments/assets/a397f207-8314-458c-ac9d-efa462eeefc1" />

Three different sources to query DATE:
1. Date Column from Table 
2. hardcoded
3. from system GETDATE()
   
Database	Date + Time	Date Only

MySQL	NOW()	           CURDATE()
PostgreSQL	NOW()	           CURRENT_DATE
SQL Server	GETDATE()	           CAST(GETDATE() AS DATE)
Oracle	SYSDATE	           TRUNC(SYSDATE)
SQLite	DATETIME('now')	DATE('now')
BigQuery	CURRENT_DATETIME()	CURRENT_DATE()
Snowflake	CURRENT_TIMESTAMP()	CURRENT_DATE()


<img width="889" height="482" alt="Screenshot 2025-12-25 074428" src="https://github.com/user-attachments/assets/7a8534f5-beeb-4314-96fc-07c39b31f804" />

** Part Extraction
-> DAY, MONTH, YEAR, DATEPART, DATENAME, DATETRUNC, EOMONTH

<img width="615" height="494" alt="Screenshot 2025-12-25 084656" src="https://github.com/user-attachments/assets/d12f8148-f499-45a5-9ba4-b9bb2d9b8141" />

<img width="704" height="461" alt="Screenshot 2025-12-25 101714" src="https://github.com/user-attachments/assets/7ced4fd7-c1ce-4609-aad2-543004af49f1" />

DATEPART(part, date) : can extract week, quarter and all day month year

DATENAME(part, date) : To get Name like January, and for year and day they are numbers only but datatype is STRING only(extracts the part of date and names the part extracted for month say january, feburary like that)

DATETRUNC(part, date) : To Truncate the part of date.
-time part gets reset to 00 while day and month part reseted to 01.

<img width="903" height="301" alt="Screenshot 2025-12-26 120214" src="https://github.com/user-attachments/assets/8bd82cb4-7715-4940-a905-13caef354e88" />

Why datetrunc() is amazing function for data analytics:

Say we want to count the no. of orders based on creation time.
We can use datetrunc() to get monthly orders , yearly orders, or we can get into more granuality like minutes, hours also.

<img width="620" height="398" alt="Screenshot 2025-12-27 195635" src="https://github.com/user-attachments/assets/f983fa94-b1ca-4d84-b2cc-4f36f2f06807" />
We can go to higest granuality to lowest granuality of details

** EOMONTH(date) :Returns the last day of month

ex:  2025-08-20 ------EOMONTH(date)------> 2025-08-31
How will i get the start date of month? 
DATETRUNC(month, CreationTime) StartOfMonth will reset the day to 1 easy

**PART EXTRACTION USE CASES:
Why do need date parts why and where it can be useful in data analysis.

1. Data Aggregations/Reporting
-> Sometime we aggreate data by a specific time unit
   like data based by year, or drilling it down more aggregate the data by quarter, or aggregate by month

<img width="250" height="250" alt="Screenshot 2025-12-27 201220" src="https://github.com/user-attachments/assets/40b9aa42-8b40-4fe7-8a8a-d63cc61118a6" />

<img width="250" height="250" alt="Screenshot 2025-12-27 201229" src="https://github.com/user-attachments/assets/17cd431a-4dea-4f48-bc3e-d5bc3eca3abd" />

<img width="250" height="250" alt="Screenshot 2025-12-27 201240" src="https://github.com/user-attachments/assets/3f8880ab-c8e8-4cdb-a5f5-83ce94736d79" />

2. Date Filtering:
Say we have monthly orders but we want all orders that were placed during the month of February.

* Best practice: Filtering data using an integer is faster than using a String.

FUNCTION COMPARISIONS: 

<img width="300" height="300" alt="Screenshot 2025-12-27 204318" src="https://github.com/user-attachments/assets/ea795265-8765-4c76-a22b-00458bf7fec7" />

<img width="838" height="458" alt="Screenshot 2025-12-27 204444" src="https://github.com/user-attachments/assets/de7db058-3057-42a3-9ea1-07b4e4e4c206" />


🚀Formating & Casting :

<img width="400" height="200" alt="Screenshot 2025-12-27 205314" src="https://github.com/user-attachments/assets/4c3917ea-73cd-4932-9466-f92adc13a2d1" />

Formating: We change the how the value look like.
<img width="350" height="350" alt="Screenshot 2025-12-28 132419" src="https://github.com/user-attachments/assets/eb52f947-6f67-4152-a763-71f52d503794" />

Casting: Change the Data Types.

<img width="350" height="350" alt="Screenshot 2025-12-28 132622" src="https://github.com/user-attachments/assets/e8e922fe-406a-400b-b734-9082143e5ad8" />

FORMAT() : FUNCTION Formats a date or time value.

FORMAT(value, format [,cultuer]) third is optional.

FORMAT(OrderDate, 'dd/MM/yyyy') (most used one )

FORMAT(OrderDate, 'dd/MM/yyy', 'ja-JP')

FORMAT(1234.55, 'D', 'fr-FR')

Formatting Use Case:

1. Data Aggregations: format the date before doing aggregations.
   
   <img width="200" height="200" alt="Screenshot 2025-12-28 141147" src="https://github.com/user-attachments/assets/42739aa5-6924-4d1f-babd-944602fcd5a6" />

The level of details is to high like for each day we have one order
<img width="250" height="250" alt="Screenshot 2025-12-28 141501" src="https://github.com/user-attachments/assets/b76cc84b-87db-4041-a443-a1ec22f261e4" />

We have learned in Datepart() inorder to extract one part and aggregate on it. Instead of that we will change the format using FORMAT(oRDERdATE, 'MMM yy').
Its like the datepart but we are customizing the format as we want.
Like datepart we can FORMAT() to change granuality of the date for data aggregation.
<img width="250" height="250" alt="Screenshot 2025-12-28 141950" src="https://github.com/user-attachments/assets/69f48d87-8955-46c7-9fb3-762ebd482fa6" />

2. Data Standardization:
   In our project we get data from multiple sources like csv file, API calls and Database from these sources we may get different formats of date which we store in central repository here we store all different dates in standard format.
   
<img width="300" height="300" alt="Screenshot 2025-12-28 143554" src="https://github.com/user-attachments/assets/a6236d21-4b70-4745-b366-0cf400e9a19a" />


ALL Date formats:

<img width="746" height="467" alt="Screenshot 2025-12-28 143642" src="https://github.com/user-attachments/assets/3eb8eef9-3c8a-4bb1-a7cd-8895ebe5d549" />

All Number formats:
<img width="739" height="370" alt="Screenshot 2025-12-28 143737" src="https://github.com/user-attachments/assets/b7fd1118-253b-4fa2-bd32-dbc854c34425" />


CONVERT():
Converts a date or time value to a different data type & Formats.

syntax: CONVERT(data_type, value [,style]) last parameter optional

CONVERT( INT, '123')
CONVERT(VARCHAR, OrderDate, '34') 
** Default Style = 0

 CONVERT() function can change datatype and format as well.

<img width="893" height="493" alt="Screenshot 2025-12-28 145837" src="https://github.com/user-attachments/assets/0df168f4-08a2-4e1e-ac87-da0772d648ff" />
***
CAST() : Converts a value to a specified data type.

CAST(value AS data_type)

CAST('123' AS INT)
CAST('2025-08-20' AS DATE)
** No format can be specified**

<img width="788" height="445" alt="Screenshot 2025-12-28 150545" src="https://github.com/user-attachments/assets/98c318b0-d996-46ae-98c3-15d4814a01f8" />


DATE CALCULATIONS

1. DATEADD() : Adds or subracts a specific time interval to/from a date

DATEADD(part, interval, date)
first parameter ie part means year, month, days and second parameter interval means how many months, how many years to be added or subracted and lastly we pass date.

<img width="400" height="400" alt="Screenshot 2025-12-29 052557" src="https://github.com/user-attachments/assets/32d9849e-b4cc-4bff-9ac9-8c0af5ab3541" />

DATEADD(year, 2 , OrderDate)
here we will manipulate year we will add 2 years to every OrderDate

DATEADD(month, -4, OrderDate)
here we will manipulate month and subtract 4 month from every month from OrderDate.

Conclusion : By passing positive or negative interval to DATEADD()
we can add or subtract any given DATE.

DATEDIFF(): Find the difference between two dates.

DATEDIFF(part, start_date, end_date)

-> part finds difference between years, months, days and start_date is oldest date and end_date is yongest date.

DATEDIFF(year, OrderDate, ShipDate)

DATEDIFF() IS VERY IMPORTANT/HELPFUL IN DATA ANALYSIS.

** Time Gap Analysis
If we want to find the number of days between each order and the previous order.
And if we don't have any column that previous orders data then we will go use *Window Function* LAG()

LAG() : Access a value from the previous row.
**
Date Validation
-> ISDATE() : Check if a value is a date. 
Returns 1 if the string value is a valid date and 0 for not valid date

ISDATE(value)

ISDATE('2025-08-20') OUTPUTS : 1
ISDATE(2025) OUTPUTS: 1 (for integer okay)
SQL understands year and standard date format be it inside a string it will accept.

<img width="723" height="433" alt="Screenshot 2025-12-29 095354" src="https://github.com/user-attachments/assets/b1a00f8d-3a6a-4313-9242-68e9b5a6b55a" />

using WHERE in last we can get all string values that are invalid
it helps in identifying issues , quality checks.

-----------------------------------------------------------------------

NULL Functions| COALESCE, ISNULL, NULLIF, IS(NOT) NULL

<img width="400" height="400" alt="Screenshot 2025-12-29 131347" src="https://github.com/user-attachments/assets/9299a6fb-2668-4238-84d0-941d61ddcc83" />

WHEAT is NULL?
NULL means nothing, unknown!
NULL is not equal to anything!

-NULL is not zero
-NULL is not empty string
-NULL is not blank space

NULL FUNCTIONS:
Here we will handle NULL using NULL functions.

<img width="400" height="400" alt="Screenshot 2025-12-29 131938" src="https://github.com/user-attachments/assets/0d72b01e-81be-4c54-afcd-3819fffd2ee2" />

Replace values:
           to replace NULL with value we have ISNULL & COALESCE                   functions.
           And to replace a Value with NULL we have NULLIF function.
Check for NULLS: Functions gives boolean values.
           IS NULL &  IS NOT NULL

ISNULL() : Replaces 'NULL' with a specified value.

ISNULL(value, replacement_value)

example: ISNULL(Shipping_Address, 'unknown')
We have a column Shipping_Address and if NULL present anywhere in this column will get replaces with static value 'unknown' which is default value or else we can replace with anything we want.

Another example where replacing NULL with a column:
ISNULL(Shipping_Address, Billing_Address) <--- Here Billing_Address                                                   will be replaced with                                             NULL in shipping address col.
Having a default replacement value will not give NULL in output as below example:
<img width="300" height="300" alt="Screenshot 2025-12-29 135228" src="https://github.com/user-attachments/assets/541ca5cd-a698-4a20-a175-4c60b708b82c" />

And Having a column as replacement will not garuntee value to the output as replacement column can also have NULL present in their columns:
<img width="300" height="300" alt="Screenshot 2025-12-29 140141" src="https://github.com/user-attachments/assets/0de1c8a5-b49d-4066-b1b8-a32b65772d0d" />

Better version than ISNULL() function is COALESCE()
* COALESCE()
  Returns the first non-null value from a list.
COALESCE(vlaue1, value2, value3, ....)

COALESCE(Shipping_Address, 'unknown')

COALESCE(Shipping_Address, Billing_Address)

COALESCE(Shipping_Address, Billing_Address, 'Unknown')

COALESCE() stops when it encounters the first non null value.

<img width="400" height="400" alt="Screenshot 2025-12-29 141434" src="https://github.com/user-attachments/assets/46691da0-56d6-47a5-b52b-30dc42a2bafb" />

<img width="400" height="400" alt="Screenshot 2025-12-29 141609" src="https://github.com/user-attachments/assets/7aadf078-6b67-4a34-8295-87b006047104" />


<img width="250" height="250" alt="Screenshot 2025-12-29 154211" src="https://github.com/user-attachments/assets/68e13974-e0d1-4a53-bd78-1bb618a45177" />

** ISNULL | COALESCE
(USE CASE)
1.Handle the NULL before doing data aggregations.

<img width="300" height="300" alt="Screenshot 2025-12-29 154532" src="https://github.com/user-attachments/assets/415c1057-2d7c-404f-b97b-53aa95ebe0c6" />

<img width="300" height="300" alt="Screenshot 2025-12-29 154605" src="https://github.com/user-attachments/assets/9ce5ae4b-b1c9-4dbb-9284-adffa47a40de" />

2. Mathematical Operations
   Handle the NULL before doing mathematcial operations.
    NULL + 5 => NULL
    NULL + 'b' => NULL

3. Handle the NULL before JOINING tables.  

<img width="450" height="470" alt="Screenshot 2025-12-29 162550" src="https://github.com/user-attachments/assets/fe7f7356-28a6-49ac-818a-f34a4ed63c99" />

We have to handle the NULL on the joins and not changing the value in select as below example:

<img width="450" height="437" alt="Screenshot 2025-12-29 162917" src="https://github.com/user-attachments/assets/0929014e-5691-4df1-b8e8-2ed8b2dd208b" />


4. Sorting data
-> Handle the NULL before sorting data.
  Since, NULL means nothing in ASC order 'NULL' Appears atop and during DESC it appears as lowest value and appears at last  

<img width="200" height="200" alt="Screenshot 2025-12-29 163220" src="https://github.com/user-attachments/assets/7acfc0fc-b4f2-4ba5-97ec-ddc7318832ea" />

<img width="200" height="200" alt="Screenshot 2025-12-29 163245" src="https://github.com/user-attachments/assets/4954af9f-cbfa-44aa-aa34-dcecc0d4dd21" />

**
NULLIF() - accepts two parametrs
Compares two expressions returns:
-NULL, if they are equal.
-First Value, if they are not equal.

NULLIF(value1, value2)

NULLIF(Shipping_Address, 'unknown')

NULLIF(Shipping_Address, Billing_Address)

Example 1 where NULLIF() is benificial it goes like replace -1 in price column with NULL as -1 is not good for anaylsis.
- We are generally replacing a value with NULL using NULLIF()

<img width="854" height="358" alt="Screenshot 2025-12-29 171505" src="https://github.com/user-attachments/assets/b0b306a2-8687-4743-aa0b-21b59725c02d" />

Example 2 Where we compare two columns Original_price and Discount_Price comparing these to analyse flaw in our code like where discount on product has flaw.

<img width="892" height="348" alt="Screenshot 2025-12-29 171834" src="https://github.com/user-attachments/assets/454b0f62-ffbc-4adf-85c4-a87868bd02a9" />

Just using it for quick check for matching data.

USE CASE - NULLIF()
1. Preventing the error of dividing by zero

** 
IS NULL : Returns TRUE if the value IS NULL or else returns FALSE
Value IS NULL

IS NOT NULL : Returns TRUE if the value IS NOT NULL, Otherwise it returns FALSE.
Value IS NOT NULL

<img width="400" height="400" alt="Screenshot 2025-12-29 171834" src="https://github.com/user-attachments/assets/dc6f3158-88c0-4a62-bd2a-063825362e25" />

<img width="400" height="400" alt="Screenshot 2025-12-29 172606" src="https://github.com/user-attachments/assets/848aefdf-1da4-4f93-861b-6c3c7fc7cfcc" />

USE CASES of IS NULL | IS NOT NULL
1. Filtering Date
Searching for missing information or NULL

2. ANTI JOINS
   -  LEFT ANTI JOIN | RIGHT ANTI JOIN
   -  Finding the unmatched rows between two tables.

<img width="729" height="511" alt="Screenshot 2025-12-29 174049" src="https://github.com/user-attachments/assets/db24ab86-bfbb-40b1-a8ce-8517180de896" />

<img width="847" height="335" alt="Screenshot 2025-12-29 174559" src="https://github.com/user-attachments/assets/17d46d0e-e56a-4717-a701-2a429a0718b7" />

ON part use right value ie o.customer_id to check IS NULL alsways but order_id could also have been used and we would get same result.




































