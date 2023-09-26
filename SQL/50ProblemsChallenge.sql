--LeetCode - SQL 50 Problems Challenge


--Select

-- 1757. Recyclable and Low Fat Products
select product_id from Products where low_fats = 'Y' and recyclable = 'Y';

-- 584. Find Customer Referee
select name from Customer where referee_id != 2 or referee_id is null;

-- 595. Big Countries
select name, population, area from World where area >= 3000000 or population >= 25000000;

-- 1148. Article Views I
select distinct author_id AS id from Views where author_id = viewer_id order by author_id;

-- 1683. Invalid Tweets
select tweet_id from Tweets where length(content) > 15;


-- Basic Joins

-- 1378. Replace Employee ID With The Unique Identifier
select unique_id, name from Employees as Emp left join EmployeeUNI as EmpUni on Emp.id = EmpUni.id;

-- 1068. Product Sales Analysis I
select p.product_name, s.year, s.price from Sales as s inner join Product as p on s.product_id = p.product_id;