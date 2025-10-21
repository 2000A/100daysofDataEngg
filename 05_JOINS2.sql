
/* ============================================================================== 
   MULTIPLE TABLE JOINS (4 Tables)
=============================================================================== */

/* Task: Using SalesDB, Retrieve a list of all orders, along with the related customer, product, 
   and employee details. For each order, display:
   - Order ID
   - Customer's name
   - Product name
   - Sales amount
   - Product price
   - Salesperson's name */

SELECT * FROM Sales.Orders

SELECT * FROM Sales.Customers

SELECT * FROM Sales.Employees

SELECT * FROM Sales.Ordersarchive

SELECT * FROM Sales.Products


SELECT 
	o.orderid,
	o.sales,
	c.firstname AS CustomerFirstName,
	c.lastname AS CustomerLastName,
	p.product AS ProductName,
	p.price,
	e.firstname AS EmployeeFirstName,
	e.lastname As EmployeeLastName
FROM Sales.Orders AS o
LEFT JOIN Sales.Customers As c
ON o.customerid = c.customerid
LEFT JOIN Sales.Products AS p
ON o.productid = p.productid
LEFT JOIN Sales.Employees AS e
ON o.salespersonid = e.employeeid


















