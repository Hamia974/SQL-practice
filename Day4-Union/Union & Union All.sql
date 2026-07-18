-- -- Union

-- Display a single list containing:
-- first_name (from employee_demographics)
-- occupation (from employee_salary)
-- using UNION.
select first_name from employee_demographics
UNION
select occupation from employee_salary;

-- Repeat Q1 using UNION ALL.
select first_name from employee_demographics
UNION all
select occupation from employee_salary;

-- Display one list containing:
-- employee_id from employee_demographics
-- employee_id from employee_salary
-- using UNION.
select employee_id from employee_demographics
UNION 
select employee_id from employee_salary;

-- Repeat Q3 using UNION ALL.
select employee_id from employee_demographics
UNION all
select employee_id from employee_salary;

-- Display:
-- gender
-- occupation
-- as one column using UNION.
SELECT gender
FROM employee_demographics
UNION
SELECT occupation
FROM employee_salary;

-- UNION with WHERE
-- Display
-- first names of Female employees
-- UNION
-- occupations whose salary is greater than 70000.
SELECT first_name
FROM employee_demographics
WHERE gender='Female'

UNION

SELECT occupation
FROM employee_salary
WHERE salary>70000;


-- Display
-- employee IDs greater than 5
-- UNION
-- department IDs from .
select employee_id from employee_demographics where employee_id>5
union
select dept_id from employee_salary;

-- Display
-- last names ending with n
-- UNION
-- occupations containing Manager.
select last_name from employee_demographics where last_name like '%n'
union
select occupation from employee_salary where occupation like '%Manager%';

-- UNION + ORDER BY

-- Display
-- first names
-- UNION
-- occupations
-- Sort alphabetically.
select first_name as name from employee_demographics
union
select occupation as name from employee_salary 
order by name;

-- Display
-- employee IDs
-- UNION ALL
-- department IDs
-- Sort in ascending order.
select employee_id as id from employee_demographics 
union all
select dept_id as id from employee_salary
order by id;

-- Challenge Questions 

-- Challenge 1
-- Create a single column called information containing:
-- first names
-- last names
-- occupations
-- using UNION ALL.
select first_name as information from employee_demographics 
union all
select last_name as information from employee_demographics 
union all
select occupation as information from employee_salary;

-- Challenge 2
-- Display a list containing:
-- all department IDs
-- all employee IDs
-- Remove duplicates.
select employee_id as id from employee_demographics 
union 
select dept_id as id from employee_salary;

-- Challenge 3
-- Create one report showing:
-- Employee Information
-- --------------------
-- Leslie
-- Ron
-- Tom
-- Occupation Information
-- ----------------------
-- Manager
-- Director
-- Engineer
-- Hint:
-- Add another column using string literals.
-- Example:
-- SELECT
-- 'Employee' AS Type,
-- first_name
-- and
-- SELECT
-- 'Occupation',
-- occupation
-- Then combine them with UNION ALL.

select 'Employee' as Information,first_name from employee_demographics 
union all
select 'Occupation' as Information,occupation  from employee_salary;