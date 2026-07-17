-- Challenge 1
-- Display:
-- occupation
-- average salary
-- Only include occupations:
-- with average salary > 60000
-- Sort by average salary from highest to lowest.
select occupation,avg(salary) as avgsalary from public.employee_salary group by occupation
having avg(salary) >60000 order by avgsalary desc;

-- Challenge 2
-- Display:
-- gender
-- number of employees
-- Only include genders having more than 3 employees.
-- Sort by employee count descending.
select gender,count(gender) as NoOfEmp from public.employee_demographics
group by gender having count(gender)>3 order by NoOfEmp desc;

-- Challenge 3
-- Display the top 5 highest-paid employees, showing:
-- employee_id
-- occupation
-- salary
-- Sort correctly.
select employee_id,occupation,salary from public.employee_salary order by salary desc
limit 5;