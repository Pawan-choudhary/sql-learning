-- Day-3
SHOW databases;
USE amazon;

SHOW TABLES;
-- 1- write a sql to get all the orders where customers name has "a" as second character and "d" as fourth character (58 rows)
SELECT * FROM orders WHERE Customer_Name LIKE "_a_d%";

-- 2- write a sql to get all the orders placed in the month of dec 2020 (352 rows) 
SELECT * FROM orders WHERE Order_Date between '2020-12-01' AND '2020-12-31';
SELECT * FROM orders WHERE Order_Date >= '2020-12-01' AND Order_Date<='2020-12-31';

-- 3- write a query to get all the orders where ship_mode is neither in 'Standard Class' nor in 'First Class' and ship_date is 
-- after nov 2020 (944 rows)
SELECT * FROM orders WHERE Ship_Mode NOT IN ('Standard Class','First Class') AND Ship_Date>='2020-12-01'; 
SELECT distinct(Ship_Mode) FROM orders;

-- 4- write a query to get all the orders where customer name neither start with "A" and nor ends with "n" (9815 rows)
SELECT * FROM orders WHERE Customer_Name NOT LIKE 'A%n' ORDER BY Customer_Name;
SELECT * FROM orders WHERE Customer_Name NOT LIKE 'A%' AND Customer_Name NOT LIKE "%n" ORDER BY Customer_Name;
SELECT * FROM orders WHERE  NOT (Customer_Name LIKE 'A%' AND Customer_Name LIKE "%n") ORDER BY Customer_Name;

SELECT * FROM orders WHERE Customer_Name  LIKE 'A%n' ORDER BY Customer_Name;

-- 5- write a query to get all the orders where profit is negative (1871 rows)
SELECT * FROM orders WHERE Profit<0 Order BY Profit DESC;

-- 6- write a query to get all the orders where either quantity is less than 3 or profit is 0 (3348)
SELECT * FROM orders WHERE Quantity<3 OR Profit=0;

-- 7- your manager handles the sales for South region and he wants you to create a report of all the orders in his region where some
--  discount is provided to the customers (815 rows)
SELECT * FROM orders WHERE Region='South' AND Discount>0;

-- 8- write a query to find top 5 orders with highest sales in furniture category 
SELECT * FROM orders WHERE Category='Furniture' ORDER BY Sales DESC LIMIT 5;

-- 9- write a query to find all the records in technology and furniture category for the orders placed in the year 2020 only (1021 rows)
SELECT Category FROM orders WHERE (Category="Technology" AND Category="Furniture") AND Order_Date BETWEEN "2020-01-01" AND "2020-12-31";

-- ------------------------------------Day-4: Assignment--------------------------------------------
-- 2- write a query to find orders where city is null (2 rows)
SELECT * FROM orders WHERE City IS NULL;

-- 3- write a query to get total profit, first order date and latest order date for each category
SELECT Category,SUM(Profit) as TotalProfit, MIN(Order_Date), MAX(Order_Date)
FROM orders
GROUP BY Category;

-- 4- write a query to find sub-categories where average profit is more than the half of the max profit in that sub-category
SELECT Sub_Category
FROM orders
GROUP BY Sub_Category
HAVING AVG(Profit)>MAX(Profit)/2;

-- 5- create the exams table with below script;
create table exams (student_id int, subject varchar(20), marks int);

insert into exams values (1,'Chemistry',91),(1,'Physics',91),(1,'Maths',92)
,(2,'Chemistry',80),(2,'Physics',90)
,(3,'Chemistry',80),(3,'Maths',80)
,(4,'Chemistry',71),(4,'Physics',54)
,(5,'Chemistry',79);

-- write a query to find students who have got same marks in Physics and Chemistry.
SELECT student_id,marks
FROM exams
WHERE subject IN ("Physics","Chemistry")
GROUP BY student_id,marks
HAVING COUNT(1)=2;


-- 6- write a query to find total number of products in each category.
SELECT Category,COUNT(DISTINCT(Sub_Category)) as Total
FROM orders
GROUP BY Category;
SELECT Category,COUNT(DISTINCT(Product_Id)) as Total
FROM orders
GROUP BY Category;

-- 7- write a query to find top 5 sub categories in west region by total quantity sold
SELECT Sub_Category, SUM(Quantity) as TotalQuantity
FROM orders
WHERE Region="west"
GROUP BY Sub_Category
ORDER BY TotalQuantity DESC
LIMIT 5;

-- 8- write a query to find total sales for each region and ship mode combination for orders in year 2020
SELECT Region, SUM(Sales),Ship_Mode
FROM orders
WHERE Order_Date >= "2020-01-01" AND Order_Date<= "2020-12-31"
GROUP BY Region,Ship_Mode;

-- --------------Assignment-5 ------------
-- 1- write a query to get region wise count of return orders

SELECT Region, COUNT(distinct(o.Order_ID)) FROM orders o INNER JOIN returns_ r ON o.Order_ID=r.Order_ID
GROUP BY Region;

-- 2- write a query to get category wise sales of orders that were not returned
SELECT Category,SUM(Sales) FROM orders o LEFT JOIN returns_ r ON o.Order_ID=r.Order_ID 
WHERE r.Order_ID IS NULL
GROUP BY Category;

-- 3- write a query to print dep name and average salary of employees in that dep .
USE companydb;

SELECT d.dname, AVG(e.salary)
FROM department d INNER JOIN employee e ON d.dnumber=e.dno
GROUP BY d.dname;

-- 4- write a query to print dep names where none of the emplyees have same salary.
SELECT d.dname
FROM department d INNER JOIN employee e ON d.dnumber=e.dno
GROUP BY d.dname ;

-- 5- write a query to print sub categories where we have all 3 kinds of returns (others,bad quality,wrong items)
USE amazon;
SELECT o.Sub_Category, r.return_reason
FROM orders o LEFT JOIN returns_ r ON  o.Order_ID=r.Order_ID
WHERE r.returns_ IN ("others","bad","bad")
GROUP BY Sub_Category;
































