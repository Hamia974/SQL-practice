-- JOIN + ORDER BY + LIMIT
-- Display the top 3 highest-paid employees.
-- Show
-- first_name
-- occupation
-- salary
select dem.first_name,sal.occupation,sal.salary
from public.employee_demographics as dem
JOIN public.employee_salary as sal
on dem.employee_id=sal.employee_id
order by sal.salary desc
limit 3;


-- Display the youngest employee with:
-- first_name
-- last_name
-- occupation
-- salary
select dem.first_name,dem.last_name,sal.occupation,sal.salary
from public.employee_demographics as dem
JOIN public.employee_salary as sal
on dem.employee_id=sal.employee_id
order by dem.birth_date desc
limit 1;