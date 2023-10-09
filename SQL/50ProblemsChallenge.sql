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

-- 1280. Students and Examinations
select s.student_id, s.student_name, sub.subject_name, count(e.subject_name) as attended_exams 
from Students s 
cross join Subjects sub 
left join Examinations e 
on s.student_id = e.student_id 
and sub.subject_name = e.subject_name 
group by s.student_id, s.student_name, sub.subject_name 
order by s.student_id, sub.subject_name;

-- 570. Managers with at Least 5 Direct Reports
select e2.name from Employee e1 
inner join Employee e2 
on e1.managerId = e2.id
group by e1.managerId 
having count(e1.id) >= 5;

-- 1934. Confirmation Rate
SELECT s.user_id, round(ifnull(sum(action = 'confirmed') / count(c.user_id), 0), 2) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
ON s.user_id = c.user_id
GROUP BY s.user_id;



-- Basic Aggregate Functions

-- 620. Not Boring Movies
select * from Cinema where mod(id, 2) <> 0 
and description != "boring" 
order by rating desc;

-- 1251. Average Selling Price
select p.product_id, ifnull(round(sum(units * price) / sum(units), 2), 0) as average_price 
from Prices p 
left join UnitsSold us 
on p.product_id = us.product_id 
and us.purchase_date between p.start_date and p.end_date 
group by p.product_id;

-- 1075. Project Employees I
select project_id, round(avg(experience_years), 2) as average_years 
from Project p 
join Employee e 
on p.employee_id = e.employee_id 
group by p.project_id;

-- 1633. Percentage of Users Attended a Contest
select contest_id, round((count(user_id)/ (select count(user_id) from users)) * 100,2) as percentage
from register
group by contest_id
order by percentage desc, contest_id;

-- 1211. Queries Quality and Percentage
select query_name, round(sum(rating / position) / count(query_name), 2) as quality, round(AVG(if(rating < 3, 1, 0)) * 100, 2) as poor_query_percentage 
from Queries group by query_name;

-- 1193. Monthly Transactions I
SELECT date_format(trans_date, '%Y-%m') AS month, country,
count(*) AS trans_count,
sum(if(state = 'approved', 1, 0)) AS approved_count,
sum(amount) AS trans_total_amount,
sum(if(state = 'approved', amount, 0)) AS approved_total_amount
FROM Transactions
GROUP BY month, country;

-- 1174. Immediate Food Delivery II
SELECT round(avg(order_date = customer_pref_delivery_date)*100, 2) AS immediate_percentage
FROM Delivery
WHERE (customer_id, order_date)
IN 
  (select customer_id, min(order_date) from Delivery 
  group by customer_id);





-- Sorting & Grouping

-- 2356. Number of Unique Subjects Taught by Each Teacher
select teacher_id, count(distinct(subject_id)) as cnt from Teacher group by teacher_id;

-- 1141. User Activity for the Past 30 Days I
SELECT activity_date AS day, count(distinct user_id) AS active_users FROM Activity
WHERE (activity_date > '2019-06-27'
AND activity_date <= '2019-07-27')
GROUP BY activity_date;

-- 1070. Product Sales Analysis III
SELECT product_id, year AS first_year, quantity, price FROM Sales 
WHERE (product_id, year)
IN
    (SELECT product_id, MIN(year) FROM Sales 
    GROUP BY product_id);

-- 596. Classes More Than 5 Students
SELECT class FROM Courses
GROUP BY class
HAVING count(student) >= 5;

-- 1729. Find Followers Count
SELECT user_id, count(*) AS followers_count
FROM Followers group by user_id
ORDER By user_id;

-- 619. Biggest Single Number
SELECT max(num) AS num FROM MyNumbers
WHERE num IN
(SELECT num FROM MyNumbers group by num
HAVING count(num) = 1);