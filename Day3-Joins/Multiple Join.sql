--  Multiple JOIN

-- Display
-- first_name
-- occupation
-- -- department_name
select emp.first_name,sal.occupation,dep.department_name
from public.employee_demographics as emp
join public.employee_salary as sal
on emp.employee_id=sal.employee_id
join public.parks_departments as dep
on sal.dept_id=dep.department_id;

-- Display
-- department_name
-- average salary
select dep.department_name,avg(sal.salary)
from public.employee_demographics as emp
join public.employee_salary as sal
on emp.employee_id=sal.employee_id
join public.parks_departments as dep
on sal.dept_id=dep.department_id
group by dep.department_name;

-- Display
-- department_name
-- number of employees
select dep.department_name,count(*)
from public.employee_demographics as emp
join public.employee_salary as sal
on emp.employee_id=sal.employee_id
join public.parks_departments as dep
on sal.dept_id=dep.department_id
group by dep.department_name;

-- Display
-- department_name
-- highest salary
select dep.department_name,max(sal.salary)
from public.employee_demographics as emp
join public.employee_salary as sal
on emp.employee_id=sal.employee_id
join public.parks_departments as dep
on sal.dept_id=dep.department_id
group by dep.department_name;

-- Display
-- department_name
-- total salary
select dep.department_name,sum(sal.salary)
from public.employee_demographics as emp
join public.employee_salary as sal
on emp.employee_id=sal.employee_id
join public.parks_departments as dep
on sal.dept_id=dep.department_id
group by dep.department_name;