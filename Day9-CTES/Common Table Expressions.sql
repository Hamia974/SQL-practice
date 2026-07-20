-- Practice Questions (Using Your parks_and_recreation Database)
-- Part A — Basic
-- Q1
-- Display all employees using a CTE.
-- -- Output:
-- -- employee_id
-- -- first_name
-- -- salary
with temp as (select employee_id,first_name,salary from public.employee_salary)
select * from temp;
-- Q2
-- Create a CTE containing only employees whose salary is greater than 70000.
-- Display everything.
with temp as (select* from public.employee_salary 
where salary>70000)
select * from temp; 
-- Q3
-- Create a CTE containing only female employees.
-- Display:
-- first_name
-- age
-- gender
with temp as (select first_name,age,gender from public.employee_demographics 
where gender='Female')
select * from temp; 
-- Q4
-- Create a CTE that stores all employees working in department 1.
-- Display everything.
with temp as (select* from public.employee_salary 
where dept_id=1)
select * from temp; 
-- Q5
-- Create a CTE containing occupations ending with Manager.
-- Display:
-- first_name
-- occupation
-- salary
with temp as (select first_name,occupation,salary from public.employee_salary 
where occupation like '%Manager')
select * from temp; 
-- Part B — GROUP BY
-- Q6
-- Create a CTE showing
-- occupation
-- average salary
-- Display only occupations whose average salary is greater than 60000.
WITH temp AS
(
SELECT
occupation,
AVG(salary) AS avg_salary
FROM employee_salary
GROUP BY occupation
HAVING AVG(salary)>60000
)
SELECT *
FROM temp;
-- Q7
-- Create a CTE showing
-- department id
-- employee count
-- Display everything.
WITH temp AS (
    SELECT 
        dept_id, 
        COUNT(*) AS employeecount 
    FROM public.employee_salary
    GROUP BY dept_id
)
SELECT * 
FROM temp;
-- Q8
-- Create a CTE showing
-- gender
-- average age
-- Display everything.
WITH temp AS
(
SELECT
gender,
AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender
)

SELECT *
FROM temp;
-- Q9
-- Create a CTE showing
-- occupation
-- maximum salary
-- Display everything.
WITH temp AS
(
SELECT
occupation,
MAX(salary) AS highest_salary
FROM employee_salary
GROUP BY occupation
)

SELECT *
FROM temp;

-- Q10
-- Create a CTE showing
-- department id
-- total salary
-- Display everything.
WITH temp AS
(
SELECT
dept_id,
SUM(salary) AS total_salary
FROM employee_salary
GROUP BY dept_id
)

SELECT *
FROM temp;
-- Part C — JOIN + CTE
-- Q11
-- Create a CTE joining
-- employee_salary
-- parks_departments
-- Display
-- first_name
-- department_name
-- salary
with temp as (
select s.first_name,d.department_name,s.salary 
from employee_salary as s join parks_departments d
on s.dept_id=d.department_id
)
select* from temp;
-- Q12
-- Create a CTE displaying
-- full name
-- occupation
-- department
-- Display everything.
with temp as (
select s.first_name|| ' ' ||s.last_name,s.occupation,d.department_name 
from employee_salary as s join parks_departments d
on s.dept_id=d.department_id
)
select* from temp;
-- Q13
-- Create a CTE displaying
-- department
-- average salary
-- Display only departments with average salary above 65000.
WITH temp AS
(
SELECT
d.department_name,
AVG(s.salary) AS avg_salary
FROM employee_salary s
JOIN parks_departments d
ON s.dept_id=d.department_id

GROUP BY d.department_name
HAVING AVG(s.salary)>65000
)

SELECT *
FROM temp;
-- Part D — Window Functions + CTE
-- Q14
-- Create a CTE ranking employees by salary.
-- Display
-- first_name
-- salary
-- row_number
with temp as 
(select first_name,salary,row_number() over(order by salary desc) from public.employee_salary)
SELECT * FROM temp;
-- Q15
-- Create a CTE ranking employees inside each department.
-- Display only rank 1 employees.
with temp as 
(select first_name,salary,rank() over(partition by dept_id order by salary desc) as rn from public.employee_salary)
SELECT * FROM temp where rn=1;
-- Q16
-- Create a CTE displaying
-- salary
-- running total
-- Display everything.
with temp as 
(select salary,sum(salary) over(order by employee_id asc) as rn from public.employee_salary)
SELECT * FROM temp ;
-- Q17
-- Create a CTE displaying
-- department
-- highest salary
-- using FIRST_VALUE().
WITH temp AS
(
SELECT
dept_id,

FIRST_VALUE(salary)
OVER(
PARTITION BY dept_id
ORDER BY salary DESC
) AS highest_salary

FROM employee_salary
)

SELECT *
FROM temp;
-- Part E — Multiple CTEs
-- Q18
-- Create one CTE containing
-- average salary per department
-- Create another CTE containing
-- employee information
-- Join both.
-- Display
-- first_name
-- salary
-- department average
WITH avg_salary AS
(
SELECT
dept_id,
AVG(salary) AS avg_salary
FROM employee_salary
GROUP BY dept_id
),

employee_info AS
(
SELECT
first_name,
salary,
dept_id
FROM employee_salary
)

SELECT
employee_info.first_name,
employee_info.salary,
avg_salary.avg_salary

FROM employee_info

JOIN avg_salary

ON employee_info.dept_id=avg_salary.dept_id;
-- Q19
-- Create
-- one CTE for females
-- one CTE for males
-- Combine them using UNION ALL.
WITH females AS
(
SELECT
first_name,
gender
FROM employee_demographics
WHERE gender='Female'
),

males AS
(
SELECT
first_name,
gender
FROM employee_demographics
WHERE gender='Male'
)

SELECT *
FROM females

UNION ALL

SELECT *
FROM males;
-- Q20

-- Create one CTE that stores employees with salary > 60000.

-- Create another CTE that ranks those employees by salary.

-- Display only the Top 5.
WITH high_salary AS
(
SELECT *
FROM employee_salary
WHERE salary>60000
),

ranked AS
(
SELECT *,
ROW_NUMBER()
OVER(ORDER BY salary DESC) AS rn
FROM high_salary
)

SELECT *
FROM ranked
WHERE rn<=5;