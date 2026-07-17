-- Challenge Questions 
-- Challenge 1
-- Display
-- gender
-- average salary
-- Sort by average salary (highest first).
select dem.gender,avg(sal.salary)
from public.employee_demographics as dem
JOIN public.employee_salary as sal
on dem.employee_id=sal.employee_id
group by dem.gender
order by avg(sal.salary) desc;

-- Challenge 2
-- Display
-- occupation
-- employee count
-- average salary
-- highest salary
-- lowest salary
-- All in one query.
select sal.occupation,count(*),avg(sal.salary),max(sal.salary),min(sal.salary)
from employee_salary as sal
group by sal.occupation;

-- Challenge 3
-- Display the top 5 highest-paid female employees.
-- Show
-- first_name
-- last_name
-- occupation
-- salary
select dem.first_name,dem.last_name,sal.occupation,sal.salary
from public.employee_demographics as dem
JOIN public.employee_salary as sal
on dem.employee_id=sal.employee_id
where dem.gender='Female'
order by sal.salary desc
limit 5;