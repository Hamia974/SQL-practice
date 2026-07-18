-- -- Subqueries
-- Part A — Basic
-- Display employees whose salary is greater than the average salary.
select* from public.employee_salary where
salary> (select avg(salary) from public.employee_salary);

-- Display employees whose salary is less than the average salary.
select* from public.employee_salary where
salary< (select avg(salary) from public.employee_salary);

-- Display employees having the maximum salary.
select* from public.employee_salary where
salary = (select max(salary) from public.employee_salary);

-- Display employees having the minimum salary.
select* from public.employee_salary where
salary= (select min(salary) from public.employee_salary);

-- Display employees working in the department named Finance.
select* from public.employee_salary where
dept_id= (select department_id from public.parks_departments where department_name='Finance');

-- Part B — IN
-- Display employees whose department IDs exist in parks_departments.
select* from public.employee_salary where
dept_id IN (select department_id from public.parks_departments);

-- Display department names that have employees.
SELECT department_name
FROM parks_departments
WHERE department_id IN
(
    SELECT dept_id
    FROM employee_salary
);

-- Display occupations belonging to employees in department 1.
select occupation from employee_salary where
dept_id in (select department_id from public.parks_departments where department_id=1);

-- Part C — SELECT
-- Display
-- Employee Name
-- Salary
-- Average Salary
-- (Hint: Use a scalar subquery in the SELECT list.)
select first_name || ' ' ||last_name as EmployeeName,salary, 
(select avg(salary) from public.employee_salary) as AverageSalary
from public.employee_salary;
-- Display
-- Salary
-- Difference from Average Salary
select salary, salary -
(select avg(salary) from public.employee_salary) as Difference
from public.employee_salary;

-- Part D — FROM
-- Create a temporary table showing:
-- Occupation
-- Average Salary
-- Then select everything from it.
SELECT * FROM
( SELECT occupation,AVG(salary) AS AvgSalary FROM employee_salary GROUP BY occupation
) AS temp;

-- Create a temporary table showing:
-- Department ID
-- Number of Employees
-- Then display it.
select* from (select dept_id,count(*) as NumberofEmp from public.employee_salary group by dept_id )as temp;
-- Part E — EXISTS
-- Display employees who have salary records.
select* from public.employee_demographics d where exists(
select * from public.employee_salary s WHERE d.employee_id=s.employee_id);

-- Display employees who do not have salary records.
select* from public.employee_demographics d where not exists(
select * from public.employee_salary s WHERE d.employee_id=s.employee_id);

-- Challenge Questions
-- Challenge 1
-- Display employees earning more than the average salary of their own department.
-- (Correlated subquery)
SELECT *FROM employee_salary e1
WHERE salary>
(SELECT AVG(salary) FROM employee_salary e2
WHERE e1.dept_id=e2.dept_id);

-- Challenge 2
-- Display the department having the highest average salary.
-- (Hint: Subquery in FROM + ORDER BY + LIMIT.)
SELECT *
FROM
(
    SELECT
        d.department_name,
        AVG(s.salary) AS average_salary
    FROM employee_salary s
    JOIN parks_departments d
        ON s.dept_id = d.department_id
    GROUP BY d.department_name
) AS temp
ORDER BY average_salary DESC
LIMIT 1;
-- Challenge 3
-- Display employees whose salary is greater than every salary in department 1.
-- (Use ALL.)
SELECT *FROM employee_salary
WHERE salary >
ALL
(
SELECT salary
FROM employee_salary
WHERE dept_id=1
);