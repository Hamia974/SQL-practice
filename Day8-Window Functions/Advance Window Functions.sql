-- Advanced Window Functions
-- Practice Questions
-- Part A — LAG()
-- Q1
-- Display:
-- first_name
-- salary
-- previous salary
select first_name,salary,lag(salary) over(order by salary) as PreviousSalary
from public.employee_salary;
-- Q2
-- Display:
-- first_name
-- salary
-- difference between current salary and previous salary
select first_name,salary,salary-lag(salary) over(order by salary) as Difference
from public.employee_salary;
-- Q3
-- Display:
-- first_name
-- age
-- previous age
-- (Hint: employee_demographics)
select first_name,age,lag(age) over(order by age) as PreviousAge
from public.employee_demographics;
-- Part B — LEAD()
-- Q4
-- Display:
-- first_name
-- salary
-- next salary
select first_name,salary,lead(salary) over(order by salary) as NextSalary
from public.employee_salary;
-- Q5
-- Display:
-- first_name
-- age
-- next age
select first_name,age,lead(age) over(order by age) as nextAge
from public.employee_demographics;

-- Q6
-- Display:
-- occupation
-- salary
-- next salary within the same department
-- (Hint: PARTITION BY dept_id)
SELECT
occupation,
salary,
LEAD(salary)
OVER(
PARTITION BY dept_id
ORDER BY salary
)
FROM employee_salary;-- Part C — FIRST_VALUE()
-- Q7
-- Display:
-- first_name
-- salary
-- company lowest salary
select first_name,salary,first_value(salary) over(order by salary) as LowestSalary
from public.employee_salary;
-- Q8
-- Display:
-- first_name
-- department
-- salary
-- highest salary in each department
select s.first_name,d.department_name,s.salary,first_value(s.salary) over( partition by s.dept_id order by s.salary desc) as HighestSalry
from employee_salary as s join parks_departments as d on s.dept_id=d.department_id;
-- Q9
-- Display:
-- occupation
-- salary
-- lowest salary within each occupation
select occupation,salary,first_value(salary)over(partition by occupation order by salary asc) from public.employee_salary;

-- Part D — LAST_VALUE()
-- Q10
-- Display:
-- first_name
-- salary
-- company highest salary
-- (Remember to use the correct window frame.)
SELECT
    first_name,
    salary,
    LAST_VALUE(salary)
    OVER(
        ORDER BY salary
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS highest_salary
FROM employee_salary;
-- Q11
-- Display:
-- department
-- salary
-- lowest salary within each department
-- (Hint: ORDER BY salary DESC)
select d.department_name,s.salary,last_value(s.salary) over( partition by s.dept_id order by s.salary desc rows between unbounded preceding and unbounded following) as LowestSalary
from employee_salary as s join parks_departments as d on s.dept_id=d.department_id;

-- Part E — Running Totals
-- Q12
-- Display:
-- employee_id
-- first_name
-- salary
-- running total salary
SELECT
employee_id,
first_name,
salary,
SUM(salary)
OVER(ORDER BY employee_id)
AS running_total
FROM employee_salary;
-- Q13
-- Display:
-- employee_id
-- age
-- running average age
select employee_id,age,avg(age) over(order by employee_id ) as running_total 
from public.employee_demographics ;
-- Q14
-- Display:
-- employee_id
-- salary
-- running maximum salary
SELECT
employee_id,
salary,
MAX(salary)
OVER(ORDER BY employee_id)
AS running_maximum
FROM employee_salary;
-- Part F — NTILE()
-- Q15
-- Divide employees into 4 salary quartiles.
-- Display:
-- first_name
-- salary
-- quartile
SELECT
    first_name,
    salary,
    NTILE(4)
    OVER(ORDER BY salary DESC)
    AS quartile
FROM employee_salary;
-- Q16
-- Divide employees into 3 groups based on age.
-- Display:
-- first_name
-- age
-- group number
SELECT
    first_name,
    age,
    NTILE(3)
    OVER(ORDER BY age )
    AS quartile
FROM public.employee_demographics ;

-- Challenge Questions
-- Challenge 1 — Salary Trend

-- Display:
-- Employee Name
-- Salary
-- Previous Salary
-- Salary Difference
select first_name|| ' ' || last_name as employee_name,salary,LAG(salary)
OVER(ORDER BY salary) as previosSalary,
salary-lag(salary) over()  as difference from public.employee_salary;
-- Challenge 2 — Top Earner Comparison
-- Display:
-- Employee Name
-- Department
-- Salary
-- Highest Salary in Department
-- Difference from Highest Salary
select s.first_name|| ' ' || s.last_name as employee_name,
d.department_name,s.salary,first_value(s.salary) 
over( partition by s.dept_id order by s.salary desc) as HighestSALARY,
salary-first_value(s.salary) 
over( partition by s.dept_id order by s.salary desc) as difference
from employee_salary as s join parks_departments as d on s.dept_id=d.department_id;
-- Challenge 3 — Salary Quartile Report
-- Display:
-- Employee Name
-- Occupation
-- Salary
-- Quartile (1–4)
-- Running Total Salary
select first_name|| ' ' || last_name as employee_name,occupation,salary,ntile(4) over(order by salary) as quartile,
sum(salary) over(order by salary asc) as running_total from public.employee_salary;