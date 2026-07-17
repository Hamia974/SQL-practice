-- JOIN + HAVING
-- Display occupations whose average salary is greater than 60000.
select sal.occupation,avg(sal.salary)
from public.employee_demographics as dem
JOIN public.employee_salary as sal
on dem.employee_id=sal.employee_id
group by occupation
having avg(sal.salary)>60000;

-- Display genders having total salary greater than 200000.
select dem.gender,sum(sal.salary)
from public.employee_demographics as dem
JOIN public.employee_salary as sal
on dem.employee_id=sal.employee_id
group by dem.gender
having sum(sal.salary)>200000;

-- Display occupations having more than one employee.
select sal.occupation,count(*)
from public.employee_demographics as dem
JOIN public.employee_salary as sal
on dem.employee_id=sal.employee_id
group by occupation
having count(*)>1;