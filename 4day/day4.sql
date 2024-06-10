-------------------------------------------------  FUNCTIONS
-------------------------------------TEXT RELATED FUNCTIONS called string functions

select upper(email) as EMAIL_UPPER from customer;
select upper(email) as EMAIL_UPPER, email from customer;
select length(email), upper(email) as EMAIL_UPPER, email from customer;
select length(email), upper(email) as EMAIL_UPPER, email from customer where length(email) < 29;



select review_id, review_text, length(review_text) as review_length 
from customer_reviews where product_id = 101 and review_text like '%great%' order by length(review_text)
-- Write a SQL query to find all reviews for product_id = 101 where the review text contains 
-- the word "great" (case insensitive), and order the results by the length of the review text (from shortest to longest).
-- Return the review_id, review_text, and the length of the review_text (use alias review_length).


select customer_id, lower(first_name), lower(last_name), lower(email) from customer 
	where length(first_name) > 10 or length(last_name) > 10
-- in the email system there was a problem with names where either the first name or last name is more than 
-- 10 characters long. find these customers and output the list of these first and last names in all lower case



-----------------------------------------------------------------------------------  LEFT AND RIGHT
-- LEFT(COL_NAME, HOW MANY CHARS FROM LEFT)
-- RIGHT(COL_NAME, HOW MANY CHARS FROM RIGHT)
select right(left(first_name, 3),1), first_name from customer;


select right(email, 5) from customer;
-- extract the last 5 characters of the email address first

----------------------------------------------------------------------------------- CONCANTENATION
select left(first_name, 1) || left(last_name, 1) from customer 
select left(first_name, 1) || '.' || left(last_name, 1) from customer || '.';



select name || ' - ' || category|| ': ' || '$'||price as  product_summary from products order by name
-- Write a single SQL query to concatenate the product name, category, and price into a single string for 
-- each product, formatted as: "Product Name - Category: Price". Use alias AS product_summary. Ensure the price 
-- is prefixed with a dollar sign ($), e.g. $1.99. Order the results by the product name in ascending order.
-- Available columns: product_id, name, category, and price from the products table.



select left(email, 1) || '***' || right(email, 19) as anonumized from customer
-- you need to create an anonymized version of the email addresses. it should be the first character followed by
-- '***' and then last part starting with '@'
-- Note the email address always ends with '@sakilacustomer.ord'

----------------------------------------------------------------------------POSITION FUNCTION

select position('@' IN email), email from customer;
select left(position('@' IN email)), email from customer;
select left(position('@' IN email)-1), email from customer;
select left(position(last_name IN email)), email from customer;




select first_name, last_name,left(email, position('.' IN email)-1) || ',' || last_name as fullname from customer;
-- in this challenge you have only the email address and the last name of the customers.
-- you need to extract the first name from the email address and concatenate it with the last name. 
-- it should be in the form "last name, first name".




------------------------------------------------------------------------ SUBSTRING
--USED TO EXTRACT A SUBSTRING FROM A STRING

select email, SUBSTRING(email from position('.' in email)+1 for  length(last_name)) from customer


select email, SUBSTRING(email from position('.' in email)+1 for  length(last_name)) from customer
-- for position('@' in email) - position('.' in email) - 1
