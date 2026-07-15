--Like statments
--% or _
select* from employee_demographics where first_name like 'A%';
select* from employee_demographics where first_name like 'J%';
select* from employee_demographics where first_name like '%n';
select* from employee_demographics where last_name like 'H%';
select* from employee_demographics where first_name like '%e%';
select* from employee_demographics where last_name like '%o%';
select* from employee_demographics where first_name like '%y';
select* from employee_demographics where last_name like '%e';
select* from employee_demographics where first_name like '___';
select* from employee_demographics where first_name like '____';
select* from employee_demographics where first_name like 'J___';
select* from employee_demographics where first_name like '_o%';
select* from employee_demographics where first_name like 'A____';
select* from employee_demographics where last_name like 'K____';
select* from employee_demographics where first_name like 'A%y';
select* from employee_demographics where last_name like '%er%';
select* from employee_demographics where first_name like 'L%e';
select* from employee_demographics where first_name not like 'A%';
select* from employee_demographics where last_name not like '%n';
select* from employee_demographics where first_name like 'J%e%y';

