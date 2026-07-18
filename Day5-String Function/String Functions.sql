-- String functions

-- Part A — Basic
-- Display
-- first_name
-- length of first_name
select first_name,length(first_name) from public.employee_demographics;

-- Display
-- first_name
-- last_name
-- in uppercase.
select upper(first_name),upper(last_name) from public.employee_demographics;

-- Display
-- occupation
-- in lowercase.
select lower(occupation) from employee_salary;

-- Display
-- every employee's full name using CONCAT().
select concat(first_name,' ',last_name) from public.employee_demographics;

-- Display
-- every employee's full name using ||.
select first_name || ' ' ||last_name from public.employee_demographics;

-- Part B — LEFT / RIGHT
-- Display
-- first_name
-- first 2 letters
select first_name,left(first_name,2) from public.employee_demographics;

-- Display
-- last_name
-- last 3 letters
select last_name,right(last_name,3) from public.employee_demographics;

-- Display
-- the first 4 letters of every occupation.
select left(occupation,4)  from public.employee_salary;

-- Display
-- the last 5 letters of every occupation.
select right(occupation,5)  from public.employee_salary;

-- Part C — SUBSTRING
-- Display
-- the first 3 letters of every first name using SUBSTRING().
select first_name,substring(first_name,1,3) from public.employee_demographics;

-- Display
-- the middle 3 letters of every last name.
SELECT
    last_name,
    SUBSTRING(
        last_name,
        FLOOR(LENGTH(last_name)/2.0),
        3
    )
FROM employee_demographics;
-- Display
-- the first 5 letters of every occupation.
select substring(occupation,1,5)  from public.employee_salary;

-- Part D — REPLACE
-- Replace
-- a↓@
-- inside first names.
select first_name,replace(first_name,'a','@') from public.employee_demographics;

-- Replace
-- o
-- ↓
-- 0
-- inside occupations.
select occupation,replace(occupation,'o','0')  from public.employee_salary;

-- Replace
-- e
-- ↓
-- *
-- inside last names.
select last_name,replace(last_name,'e','*') from public.employee_demographics;

-- Part E — POSITION
-- Find the position of
-- a
-- inside first names.
select first_name,position('a' in first_name) from public.employee_demographics;

-- Find the position of
-- o
-- inside occupations.
select occupation,position('o' in occupation)  from public.employee_salary;

-- Part F — Advanced
-- Display
-- full name
-- length of full name
select concat(first_name,' ',last_name),length(concat(first_name,' ',last_name)) from employee_demographics;

-- Display
-- employees whose first name has more than 5 characters.
select* from employee_demographics where length(first_name)>5;

-- Display
-- employees whose occupation starts with
-- Manager
select* from public.employee_salary where occupation like 'Manager%';

-- Challenge Questions 
-- Challenge 1
-- Display
-- Full Name
-- Occupation (uppercase)
select concat(first_name,' ',last_name) as fullname,upper(occupation) from employee_salary

-- Challenge 2
-- Display
-- First Name
-- First Letter
-- Last Letter
-- Name Length
select first_name,left(first_name,1) as firstletter,
right(first_name,1) as lastletter,length(first_name) from employee_salary

-- Challenge 3
-- Create a report like this:
-- Full Name	Initials
-- Leslie Knope	LK
-- Ron Swanson	RS
-- Hint:
-- LEFT()
-- CONCAT() or ||
select concat(first_name,' ',last_name) as fullname,
left(first_name,1) ||  left(last_name,1) as Inititals from employee_salary;

