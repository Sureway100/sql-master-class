-------------------------------------------------------- filtering in sql
-- where clause
-- always come after and immediately after the FROM keyword
--
--
--
--
--
--

select name, price from products where category is 'Electronics' order by price asc

-- Write a SQL query to find all products in the 'Electronics' category. Select only the name of the product and the price.
-- You need to use only the SELECT, WHERE, and ORDER BY clauses to achieve this. Sort the results by price in ascending order.
-- Table and Column Names:
-- Table: products
-- Columns: product_id, name, category, price

select count(*) from payment where customer_id = 100;
--how many payment were made by the customer with customer_id = 100;

select last_name from customer where first_name = 'ERICA';
--what is the last name of our customer with first name 'ERICA'

select name, price from products where price > 200 order by price asc;
-- Write a SQL query to find all products (only select name and price) that have a price of more than 200.
-- You need to use only the SELECT, WHERE, and ORDER BY clauses to achieve this. Sort the results 
-- by price in ascending order

-- not equal !-
-- < , >, <> is same as !-
-- is null, is not null

select count(*) from rental where return_date is null;
--the inventory manager asks you how rentals have have not returned yet(return_date is null)


select payment_id, amount from payment where amount <= 2.0;
-- the sales manager asks you how for a list of all the payment_id with an amount less than or equal to
-- $2 include payment_id and the amount



---------------------------------------------------------  USING AND, OR OPERATION

--- NOTE THAT THE AND CONDITION WILL ALWAYS BE PROCESSED FIRST, SO PARENTENSIS SHOULD BE USED 

SELECT name, price from products where category is "Electronics" and price > 200 order by price asc;

-- Write a SQL query to find all products in the 'Electronics' category that have a price of more than 200.
-- You need to use only the SELECT, WHERE, and ORDER BY clauses to achieve this. Sort the results by price in ascending order.
-- Select only product name and and price.


select * from payment 
	where (customer_id = 322 or customer_id = 346 or customer_id = 354) 
	and (amount > 10.00 or amount < 2.0)
	order by customer_id asc, amount desc;
-- the support manager asks you about a list of all the payment of the customer 322, 346  and 354.
-- where the amount is either less than $2 or greater than $10
-- it should be ordered by the customer first(ascending) and then as second condition order by amount
-- in a descending order



select id, date, amount from sales where date between '2024-01-10' and '2024-02-10';
-- Write a single SQL query to find all transactions from the the table sales that occurred between '2024-01-10' and '2024-02-10', 
-- inclusive. Display the transaction ID, date, and amount. Order the results by the date of the transaction.

--between..and / not between..and => used to filter range of values.
-- for dates, make sure you use YYYY-MM-DD format


select count(*) from payment 
	where payment_date between '2020-01-26' and '2020-01-28' 
	and amount between 1.99 and 3.99;
-- there have been some faulty payments and you need to help to found how many payments have been affected
-- how many payments have been made on january 26th and 27th 2020 with an amount between 1.99 and 3.99

-- because date will end at 11:59, either you add extra day to accomodate 27 or use timestamp - 2020-01-27 11:59;



---------------------------------------------------------------------- IN / NOT IN

--this is used when you have a long list of values to check, reduces too much OR usage;

select distinct customer_id from orders where product_name = 'Laptop' OR product_name = 'Tablet' or product_name = 'Smartphone';  --- NOPE
select distinct customer_id from orders where product_name IN ('Laptop', 'Tablet', 'Smartphone'); --- YESSS

-- Write a single SQL query to select all distinct customer IDs who ordered either a 'Laptop', 'Tablet', or 'Smartphone'. 
-- Order the result by customer ID in ascending order.


select * from payment where customer_id in(12,25,67,93,124,234) 
	and amount in(4.99,7.99,9.99) and payment_date between '20200101' and '20200201';

-- there have been 6 complaints of customers about their payments, customer_id 12,25,67,93,124,234 and the concerned payments are all
-- payments of there customers with amounts 4.99, 7.99 and 9.99 in january 2020


---------------------------------------------------------------------- LIKE / NOT LIKE => matching pattern
---   __any single character
---  % any sequence of characters
--- LIKE is case sensitive and ILIKE is non sensitive

--- 'A%'  ==> means A will start and other sequence of characters
--- '%A%' ==> means A can be seen in any sequence of characters
--- '_A%' ==> first character is anything, second must be an A and % means remaining sequence
--- '__A%' ==> first and second as anything, then third must be A and remaining part



select CustomerName, ProductID, ReviewText from CustomerReviews where ReviewText LIKE '%love%';
-- Write a SQL query to find all reviews that mention the word "love" (case insensitive) in their review text. 
-- Your query should return the CustomerName, ProductID, and ReviewText.
--
-- Table Name: CustomerReviews
-- Column Names: CustomerName, ProductID, ReviewText

select count(*) from film where description ILIKE '%Documentary%';
-- You need to help the inventory manager to find out how many movies  are there that contain the "Documentary" in the description?


select * from customer 
	where (first_name like '___') and (last_name like '%X' or last_name like '%Y');
-- how many customers are there with a first name that is 3 letters long and either an 'X' or a 'Y' as the last letter in the name?


select payment_id as invoice_no from payment;
-- this will change the column output but not the actual table column




select count(*) as no_of_movies from film where description like '%Saga%' and 
	(title like 'A%' or title like '%R');
-- select count() as no_of_movies 
-- how many movies are there that contain 'Saga' in the description and where the title starts either with 'A' or ends with 'R'
-- use the alias 'no_of_movies'


select * from customer where first_name like '%ER%' and first_name ilike '_A%' 
	order by last_name desc;
-- create a list of all customers where the first name contains 'ER' and has an 'A' as the second letter order the results by the 
-- last name descendingly


select count(*) from payment where (amount = 0 or amount between 3.99 and 7.99)
	and payment_date between '2020-05-01' and '2020-05-03';
-- how many payments are there where the amount is either 0 or is between 3.99 and 7.99 and in the same time has happened 
-- on 2020-05-01




























