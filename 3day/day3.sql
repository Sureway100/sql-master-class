-------------------------------------------------AGGREGATION FUNCTIONS
-- aggregating values means multiple rows to one value;
--SUM(col_name)
--AVG(col_name)
--MIN(col_name)
--MAX(col_name)
--COUNT(*) or COUNT(col_name)


select sum(amount), ROUND(AVG(amount), 2) as AVERAGE from payment;



select min(replacement_cost), 
	max(replacement_cost),
	round(avg(replacement_cost), 3),
	sum(replacement_cost)
	from film
-- your manager wants to get a better understanding of the films, thats why you are asked to write a
-- query to see the min, max, avg, sum of the replacement cost of the films.


---------------------------------------------------------------------------------->>>>> GROUP BY
-- Used to group aggregations by specific columns.
-- group by comes after from or after where
-- group by columns must have been specified inside aggregated function or after select keyword

-- you know normally you cannot add columns when you use any of those aggregated functions, 
-- so to achieve these we use group by to show grouping of what has been aggregated





select category, sum(quantity) as total_quantity, sum(sale_amount) as total_sales_amount from sales_data group by category 
order by total_sales_amount  desc
-- Using the sales_data table, write a SQL query to calculate the total quantity sold and the total sale_amount for each category.
-- Your query should return columns for the category, the sum of quantity as total_quantity, 
-- and the sum of sale_amount as total_sales_amount. Order the results by total_sales_amount in descending order.


select count(*), sum(amount) as amount, staff_id from payment group by staff_id order by staff_id desc;
--your manager wants to know which of the two employees(staff_id) is responsible for more payments, also which of the two is
--responsible for a higher overall payment amount


select count(*), sum(amount) as amount, staff_id from payment where amount != 0 group by staff_id order by staff_id desc;
-- now how do these amounts change if we dont consider amounts equal to 0;



select sum(amount) as total_sales_amount, count(*) as total_items_sold, category, sale_date from sales group by category
, sale_date order by category asc, sale_date asc;
-- Create a query showing the total sales amount (AS total_sales_amount) and total number of items sold  (AS total_items_sold), 
-- grouped by category and sale_date. Order the results by category in ascending order and then by sale_date in ascending order.
-- Use the sales table with columns: category, sale_date, amount.



select staff_id, date(payment_date), sum(amount),count(*) from payment 
	group by staff_id, date(payment_date) 
	order by sum(amount) desc
-- a->there are two competitions between the two employees, which employee had the highest sales amount in a single day?



select staff_id, date(payment_date), sum(amount),count(*) from payment 
	where amount != 0
	group by staff_id, date(payment_date) 
	order by sum(amount) desc
-- b-> which employee had the most sales in a single day(not counting payments with amount = 0)





---------------------------------------------------------->>> Used to conditionally filter groupings by aggregations 
-- example  HAVING COUNT(*) > 400
-- example  HAVING COUNT(*) > 400 or COUNT(*) = 100
-- NOTE THAT WHERE KEYWORD CANNOT CONDITIONALLY FILTER AGGREGATIONS, SO THIS IS WHERE HAVING COMES INTO PLACE
-- HAVING CAN ONLY BE USED WITH GROUP BY;



select city, avg(amount) as AverageAmount from sales group by city having avg(amount) > 150.00 and count(city) > 2
-- Find the cities with more than two transactions where the average transaction amount exceeds $150.00. List the city and the average 
-- transaction amount (AS AverageAmount), sorted by the average transaction amount in descending order.



select customer_id, date(payment_date), round(avg(amount), 2) as average, count(*)  from payment 
	where date(payment_date) between '2020-04-28' and '2020-05-01'
	group by customer_id, amount, date(payment_date) 
	having count(customer_id) > 1 or count(date(payment_date)) > 1
	order by avg(amount) desc
-- in 2020, april 28,29,30 were days with high revenue. thats why we want to focus in this task only on these days
-- find out what is the average payment amount grouped by customer and day - consider only the days/customers with
-- more than 1 payment(per customer and day) order by the average amount in a descending order