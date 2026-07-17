--  SELF JOIN
-- Display
-- employee1 name
-- employee2 name
-- where
-- employee1.employee_id + 1 = employee2.employee_id
select emp1.first_name,emp2.first_name
from public.employee_demographics as emp1
join public.employee_demographics as emp2
on emp1.employee_id+1=emp2.employee_id;



