-- -- Case Statements
-- Practice Questions
-- Part A — Basic

-- Display
-- first_name
-- salary
-- salary category
-- Rules
-- salary >=80000 High
-- salary >=60000 Medium
-- Otherwise Low
select first_name,salary,
case
	when salary>=80000 then 'High'
	when salary>=60000 then 'Medium'
	else 'Low'
END as salarycategory
from public.employee_salary;

-- Display
-- first_name
-- gender
-- short gender
-- Male↓M
-- Female↓F
select first_name,gender,
case
	when gender='Male' then 'M'
	when gender='Female' then 'F'
	ELSE 'Unknown'
end as shortgender
from public.employee_demographics;

-- Display
-- first_name
-- age
-- Category
-- <30 Young
-- 30-45 Adult
-- >45 Senior
select first_name,age,
case
	when age<30 then 'Young'
	when age between 30 and 45 then 'Adult'
	when age>45 then 'Senior'
end as AgeCategory
from public.employee_demographics;

-- Display
-- occupation
-- Category
-- contains Manager
-- Management
-- Otherwise
-- Staff
select occupation, 
case
	when occupation like '%Manager%' then 'Management'
	else 'Staff'
end as Category
from public.employee_salary;

-- Display
-- employee IDs
-- Category
-- Even
-- Odd
select employee_id,
case
	when employee_id%2=0 then 'Even'
	else 'Odd'
end as Category
from public.employee_demographics;

-- Part B — CASE + Calculations
-- Give employees a bonus.
-- salary>=70000 15%
-- Otherwise 8%
-- Display
-- occupation
-- salary
-- new salary
select occupation, salary,
case
	when salary>=70000 then salary*1.15
	else salary*1.08
end as newsalary
from public.employee_salary;

-- Q7
-- Display
-- salary
-- Label
-- Above Average
-- salary>=60000
-- Below Average
select salary,
case
	when salary>=60000 then 'Above Average'
	else ' Below Average'
end as label
from public.employee_salary;

-- Display
-- first_name
-- Name Length
-- >5
-- Long Name
-- Otherwise
-- Short Name
select first_name,
case 
	when length(first_name)>5 then 'Long Name'
	else 'Short Name'
end as length
from public.employee_demographics;

-- Part C — CASE + GROUP BY
-- Display
-- salary category
-- employee count
select 
case
	when salary>=80000 then 'High'
	when salary>=60000 then 'Medium'
	else 'Low'
END as salarycategory,
count(*)
from public.employee_salary  group by salarycategory;

-- Display
-- age group
-- number of employees
select 
case
	when age<30 then 'Young'
	when age between 30 and 45 then 'Adult'
	when age>45 then 'Senior'
end as AgeCategory,
count(*)
from public.employee_demographics group by AgeCategory;

-- Display
-- management vs staff
-- count
select  
case
	when occupation like '%Manager%' then 'Management'
	else 'Staff'
end as Category,
count(*)
from public.employee_salary group by Category ;

-- Part D — CASE + ORDER BY
-- Sort employees
-- Female first
-- Male second
SELECT first_name, gender
FROM employee_demographics
ORDER BY
CASE
    WHEN gender='Female' THEN 1
    ELSE 2
END;

-- Sort employees
-- High Salary
-- ↓
-- Medium
-- ↓
-- Low
SELECT employee_id,salary 
FROM public.employee_salary
ORDER BY
    CASE
        WHEN salary >= 80000 THEN 1  -- High
        WHEN salary >= 60000 THEN 2  -- Medium
        ELSE 3                       -- Low
   END ASC;

-- Challenge Questions 
-- Challenge 1
-- Display
-- Full Name
-- Occupation
-- Salary
-- Salary Category
-- Rules
-- >=90000 
-- 70000-89999 Good
-- 50000-69999 Average
-- Otherwise Needs Improvement
select first_name|| ' ' || last_name as fullname,occupation, salary,
case
	when salary>=90000 then 'Excellent'
	WHEN salary between 70000 and 89999 then 'Good'
	WHEN salary between 50000 and 69999 then 'Average'
    else 'Needs Improvement'
end as SalaryCategory
from public.employee_salary;

-- Challenge 2
-- Create a report
-- Employee
-- Age
-- Category
-- Bonus
-- Bonus
-- Age<30 5000
-- Otherwise 3000
select employee_id,first_name|| ' ' || last_name as fullname,age,
case
	when age<30 then 5000
	else 3000
end as bonus
from public.employee_demographics;

-- Challenge 3 (Real Company Scenario)
-- Management has announced salary increments.
-- Rules:
-- Managers: +20%
-- Employees with salary ≥ 70,000 (non-managers): +10%
-- Everyone else: +5%
-- Display:
-- Employee Name
-- Occupation
-- Current Salary
-- New Salary
select first_name|| ' ' || last_name as fullname,occupation,salary as CurrentSalary,
case
	when occupation like '%Manager%' then salary*1.20
	when occupation not like '%Manager%' and salary>=70000 then salary*1.10
	else salary*1.05
end as NewSalary
from public.employee_salary;