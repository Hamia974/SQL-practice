--Group by
Select gender,count(gender) as NoOfEmployees from employee_demographics group by gender;
select occupation,avg(salary) as averagesalaray from employee_salary group by occupation;
select occupation,max(salary) as highestsalary from employee_salary group by occupation;
select occupation,min(salary) as lowestsalary from employee_salary group by occupation;
select occupation,sum(salary) as TotalSalary from employee_salary group by occupation;
SELECT EXTRACT(YEAR FROM birth_date) AS birth_year, COUNT(employee_id) AS number_of_employees
FROM employee_demographics
GROUP BY EXTRACT(YEAR FROM birth_date) order by birth_year ;
select gender,avg(age) as AverageAge from employee_demographics group by gender;
select last_name,count(last_name) from employee_demographics group by last_name;
select gender,max(employee_id) from employee_demographics group by gender;
select gender,min(employee_id) from employee_demographics group by gender;

--Display the average salary of employees whose salary is greater than 50,000,
--grouped by occupation.
select occupation,avg(salary) as AverageSalary
from employee_salary where salary>50000 group by occupation;

-- Display the number of female employees in each birth year.
select EXTRACT(Year from birth_date) as birth_year,count(gender) from employee_demographics 
 where gender='Female' group by birth_year;
 
 -- Display the total salary of employees whose occupation
 -- contains the word Manager, grouped by occupation.
 select occupation,sum(salary) as TotalSalary from employee_salary 
 where occupation LIKE '%Manager%' group by occupation;
 
 -- Display the average salary of employees whose occupation starts with A,
 -- grouped by occupation.
 select occupation,avg(salary) from employee_salary
 where occupation like 'A%' group by occupation;

--  Display the number of employees grouped by:
-- Gender
-- Birth year
select gender,Extract(year from birth_date) as birth_year,count(first_name) from employee_demographics 
group by gender,birth_year;

select dept_id,occupation,avg(salary) from employee_salary
group by occupation,dept_id;

select employee_id,occupation,sum(salary) from employee_salary group by occupation,employee_id;