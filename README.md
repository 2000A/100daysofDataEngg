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

DATENAME(part, date) : To get Name like January, and for year and day they are numbers only but datatype is STRING only

DATETRUNC(part, date) : To Truncate the part of date.






















