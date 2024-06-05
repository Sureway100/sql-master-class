select * from public.actor;
-- public is schema name(structured folder), then actor is a table name.
-- select all, asterisk means all 

select first_name, last_name from public.actor;
-- select first name and last name from table actor and inside schema public 

select first_name, last_name, email from public.customer;
--assessment/ challenge number one

select first_name, last_name, email from public.customer order by first_name;
-- using the order by, which means select column used for ASC or DESC
-- also note that ASC is for default, maybe readability could be a reason to literally type it

select first_name, last_name, email from public.customer order by first_name, last_name;
-- odering by two columns

select first_name, last_name, email from customer order by last_name desc, first_name desc;
-- ordering by last_name desc, but if duplicate of last_name, we can now use first_name but still desc

select distinct last_name from tfare.user_details order by last_name desc, first_name desc;
--distinct means removing duplicates
--using distinct on one column means no value will be same in that column

select distinct last_name, gender from tfare.user_details order by last_name desc, first_name desc;
-- distinct means in terms of all selected columns
-- as long as there is another column different, it is not distinct
-- all columns, first_name, last_name, age must be same

select distinct amount from payment order by amount desc;
-- a marketing team member asks you about the different prices that have been paid, to make it easier for
-- them order the prices from high to low

select distinct amount from payment order by amount desc limit 10;
-- using limit to reduce the number of rows of our output

select distinct genre from books order by genre asc limit 5;
--assessment/ challenge number two


select  distinct count(first_name) first_name from actor   -- >> 200
-- this will not work, distinct should be inside count, for count to acknowledge it

select count(first_name) first_name from actor  -- >> 200
select count(first_name) from actor  -- >> 200

select count(distinct first_name) first_name from actor
--count distinct result output


-----------------todays final challenges --------------------------------------->>>>>>>>
select distinct district from address;
--create a list of all the distinct districts customers are from

select rental_date from rental order by rental_date desc limit 1;
--what is the latest rental date

select count(*) from film;
--how many films does the company have

select count(distinct last_name) from customer;
--how many distinct last names of the cutomers are there?