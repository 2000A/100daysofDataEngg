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







































