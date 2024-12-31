show databases;

USE farmers_market;

SHOW tables;

-- Q3. List down 10 rows of farmer's market vendor booth assignments, displaying the market date, vendor ID,
-- and booth number from the vendor_booth_assignments table and sort by market_date.

SELECT market_date,vendor_id,booth_number
FROM vendor_booth_assignments
ORDER BY market_date
LIMIT 10;

-- Q4. List down 10 rows of farmer's market vendor booth assignments, displaying the market date, vendor ID,
-- and booth number from the vendor_booth_assignments table and sort by market_date and vendor_id.
SELECT *
FROM vendor_booth_assignments
ORDER BY market_date,vendor_id
LIMIT 10;

-- Q5. List down 10 rows of farmer's market vendor booth assignments, displaying the market date, vendor ID,
-- and booth number from the vendor_booth_assignments table and sort by market_date in decreasing oeder and vendor_id in increasing order.

SELECT *
FROM vendor_booth_assignments
ORDER BY market_date DESC,vendor_id
LIMIT 10;

-- Q6. Write a query product_id, product_name and product_name shoud be in alphabetcal oreder
SELECT product_id,product_name
FROM product
ORDER BY product_name;

-- Q7: In the customer purchases, we have quantity and cost per qty separate, query the total amount that
-- the customer has paid along with date, customer id, vendor_id, qty, cost per qty and the total amt.?
SELECT  market_date,customer_id,vendor_id,quantity,cost_to_customer_per_qty,ROUND((quantity*cost_to_customer_per_qty),2) AS "Total Amount"
FROM customer_purchases
LIMIT 10;

-- Question 8: We want to merge each customer's name into a single column that contains the first name,
--  then a space, and then the last name.
SELECT customer_first_name,customer_last_name, CONCAT(customer_first_name, " ", customer_last_name) AS "Full Name"
FROM customer
LIMIT 10;

-- full_name  in upper case
SELECT customer_first_name,customer_last_name, UPPER(CONCAT(customer_first_name, " ", customer_last_name)) AS "Full Name"
FROM customer
LIMIT 10;

SELECT customer_first_name,customer_last_name, LOWER(CONCAT(customer_first_name, " ", customer_last_name)) AS "Full Name"
FROM customer
LIMIT 10;

-- upper case only first name in full_name
SELECT customer_first_name,customer_last_name, CONCAT(UPPER(customer_first_name), " ", customer_last_name) AS "Full Name"
FROM customer
LIMIT 10;

-- lower case only first name in full_name
SELECT customer_first_name,customer_last_name, CONCAT(customer_first_name, " ", UPPER(customer_last_name)) AS "Full Name"
FROM customer
LIMIT 10;

-- Filtering and Subqueries
-- Question: Extract all the product name that are part of product category 1

SELECT product_name
FROM product
WHERE product_category_id=1;

SELECT COUNT(product_name)
FROM product
WHERE product_category_id=1;

-- Question: Print  report of everthing customer_id=4 has ever purchased at
-- 			farmer's market, sorted by market date, vendor id, and product id.	
SELECT * 
FROM customer_purchases
WHERE customer_id=4
ORDER BY market_date,vendor_id,product_id;

-- Question: Get all the product info for products with id between 3 and 8 (not inclusive) and product with id 10
SELECT * 
FROM product
WHERE (product_id >3 AND product_id<8) OR product_id=10;

SELECT * 
FROM product
WHERE (product_id >=3 AND product_id<=8) OR product_id=10;

-- Question: Find the customer detail with first name of "Carlos" or the last name of "Diaz". 
SELECT *
FROM customer
WHERE customer_first_name="Carlos" OR customer_last_name="Diaz";

SELECT *
FROM customer
WHERE customer_first_name LIKE "Carlos" OR customer_last_name LIKE "Diaz";

-- Question: Find the booth assignments for vendor 7 for any market date that occurred between
-- 			 April 3, 2019, and May 16, 2019, including either of the two dates.
SELECT *
FROM vendor_booth_assignments
WHERE vendor_id=7 AND (market_date>='2019-04-03' AND market_date<='2019-05-13');

SELECT *
FROM vendor_booth_assignments
WHERE vendor_id=7 AND market_date BETWEEN '2019-04-03' AND '2019-05-13';

-- Question: Return a list of cutomer with selected last names - [Diaz, Edwards, and Wilson]
SELECT *
FROM customer
WHERE customer_last_name IN ("Diaz","Edwards", "Wilson");

-- Question: You want to get data about a customer you knew as "Jerry," but you aren't sure if he was 
-- 			 listed in the database as "Jerry" or "Jeremy" or "Jeremiah."
SELECT *
FROM customer
WHERE customer_first_name LIKE "Jer%";

-- Find all the products which have no sizes recorded against them
SELECT *
FROM product
WHERE product_size IS NULL OR product_size=" ";

-- Question: Analyze purchases made at farmer's market on the day when it rained 
SELECT * 
FROM customer_purchases
WHERE market_date
IN 
	(SELECT market_date FROM market_date_info WHERE market_rain_flag="1");
    

    
    
    












