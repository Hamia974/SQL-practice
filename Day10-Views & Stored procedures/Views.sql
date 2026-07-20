-- Practice Questions — Views
-- Q1
-- Create a view called
-- high_salary_employees
-- containing
-- employee_id
-- first_name
-- salary
-- where
-- salary > 70000
create view high_salary_employees as
select employee_id,first_name,salary from public.employee_salary where salary>70000;
select* from high_salary_employees;
-- Q2
-- Create a view
-- female_employees
-- Display
-- first_name
-- last_name
-- age
create view female_employees as
select first_name,last_name,age from public.employee_demographics where gender='Female';
select* from female_employees;
-- Q3
-- Create a view
-- department_salary
-- Display
-- department_name
-- average salary
create view department_salary as
select d.department_name,avg(s.salary) over(partition by dept_id) from 
public.employee_salary as s join public.parks_departments as d
on s.dept_id=d.department_id;
select* from department_salary;
-- Q4
-- Create a view
-- employee_department
-- Display
-- first_name
-- occupation
-- department_name
create view employee_department as
select s.first_name,s.occupation,d.department_name from 
public.employee_salary as s join public.parks_departments as d
on s.dept_id=d.department_id;
select* from employee_department;
-- Q5
-- Query all rows from
-- employee_department
select* from employee_department;
