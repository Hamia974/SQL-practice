-- JOIN + GROUP BY
-- Display the average salary by gender.
select dem.gender,avg(sal.salary) as avgSalary
from public.employee_demographics as dem
JOIN public.employee_salary as sal
on dem.employee_id=sal.employee_id
group by dem.gender;

-- Display the highest salary by gender.
select dem.gender,max(sal.salary) as Highestsalary
from public.employee_demographics as dem
JOIN public.employee_salary as sal
on dem.employee_id=sal.employee_id
group by dem.gender;

-- Display the number of employees in each occupation.
select sal.occupation,count(*) as NoofEmployees
from public.employee_demographics as dem
JOIN public.employee_salary as sal
on dem.employee_id=sal.employee_id
group by occupation;