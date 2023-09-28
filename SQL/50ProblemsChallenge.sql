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

-- 1581. Customer Who Visited but Did Not Make Any Transactions
SELECT v.customer_id, COUNT(v.visit_id) AS count_no_trans from Visits v LEFT JOIN Transactions t ON v.visit_id = t.visit_id WHERE t.transaction_id IS NULL GROUP BY v.customer_id; 

-- 197. Rising Temperature
select w1.id from Weather w1 join Weather w2 on DATEDIFF(w1.recordDate, w2.recordDate) = 1 and w1.temperature > w2.temperature;

-- 1661. Average Time of Process per Machine
select a1.machine_id, round(avg(a2.timestamp - a1.timestamp), 3) as processing_time from Activity a1 join Activity a2 on a1.machine_id = a2.machine_id and a1.process_id = a2.process_id and a1.activity_type = 'start' and a2.activity_type = 'end' group by a1.machine_id;

-- 577. Employee Bonus
select name, bonus from Employee as emp left join Bonus as b on emp.empId = b.empId where b.bonus < 1000 or b.bonus is NULL;

-- 1633. Percentage of Users Attended a Contest
select contest_id, round((count(user_id)/ (select count(user_id) from users)) * 100,2) as percentage
from register
group by contest_id
order by percentage desc, contest_id