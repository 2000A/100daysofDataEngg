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

 






























