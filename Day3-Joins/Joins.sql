-- Joins
-- inner join
select dem.first_name,dem.last_name,sal.occupation
from public.employee_demographics as dem
JOIN public.employee_salary as sal
on dem.employee_id=sal.employee_id;
select dem.first_name,dem.gender,sal.salary
from public.employee_demographics as dem
JOIN public.employee_salary as sal
on dem.employee_id=sal.employee_id;
select dem.employee_id,dem.first_name,sal.occupation,sal.salary
from public.employee_demographics as dem
JOIN public.employee_salary as sal
on dem.employee_id=sal.employee_id;

select dem.first_name,dem.last_name,dem.gender,sal.salary
from public.employee_demographics as dem
JOIN public.employee_salary as sal
on dem.employee_id=sal.employee_id
where dem.gender='Female';

select dem.first_name,sal.occupation,sal.salary
from public.employee_demographics as dem
JOIN public.employee_salary as sal
on dem.employee_id=sal.employee_id
where sal.salary>60000;

select dem.first_name,sal.occupation,sal.salary
from public.employee_demographics as dem
JOIN public.employee_salary as sal
on dem.employee_id=sal.employee_id
order by salary desc;

-- left join
select dem.first_name,sal.occupation,sal.salary
from public.employee_demographics as dem
left JOIN public.employee_salary as sal
on dem.employee_id=sal.employee_id;

select dem.first_name,dem.last_name,sal.occupation,sal.salary
from public.employee_demographics as dem
left JOIN public.employee_salary as sal
on dem.employee_id=sal.employee_id;

-- right join
select dem.first_name,dem.last_name,sal.occupation,sal.salary
from public.employee_demographics as dem
right JOIN public.employee_salary as sal
on dem.employee_id=sal.employee_id;

select dem.first_name,sal.occupation,sal.salary
from public.employee_demographics as dem
right JOIN public.employee_salary as sal
on dem.employee_id=sal.employee_id;