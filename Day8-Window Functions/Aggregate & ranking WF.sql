-- -- Aggregate and ranking Window function
-- Practice Questions
-- Part A — Basic
-- Display:
-- first_name
-- salary
-- average salary of all employees
select first_name,salary,avg(salary) over() as AverageSalary from public.employee_salary;

-- Display:
-- first_name
-- salary
-- total salary of the company
select first_name,salary,sum(salary) over() as TotalSalary from public.employee_salary;

-- Display:
-- first_name
-- salary
-- total number of employees
select first_name,salary,count(*) over() as TotalNoofEmp from public.employee_salary;

-- Display:
-- first_name
-- salary
-- maximum salary of the company
select first_name,salary,max(salary) over() as MaximumSalary from public.employee_salary;

-- Display:
-- first_name
-- salary
-- minimum salary of the company
select first_name,salary,min(salary) over() as MinimumSalary from public.employee_salary;

-- Part B — PARTITION BY
-- Display:
-- first_name
-- department ID
-- salary
-- average salary within each department
select first_name,dept_id,salary,avg(salary) over(partition by dept_id) as AverageSalary from public.employee_salary;

-- Display:
-- first_name
-- gender
-- age
-- average age of each gender
-- (Hint: Use employee_demographics.)
select first_name,gender,age,avg(age) over(partition by gender) as AverageAge 
from public.employee_demographics;

-- Display:
-- first_name
-- occupation
-- salary
-- total salary of each department
select first_name,occupation,salary,sum(salary) over(partition by dept_id) as TotalSalary from public.employee_salary;

-- Display:
-- occupation
-- salary
-- highest salary within each occupation
select occupation,salary,max(salary) over(partition by occupation) as HighestSalary from public.employee_salary;

-- Display:
-- occupation
-- salary
-- number of employees in each occupation
select occupation,salary,count(*) over(partition by occupation) as NoOfEmp from public.employee_salary;

-- Part C — ROW_NUMBER()
-- Display:
-- first_name
-- salary
-- row number ordered by salary (highest first)
select first_name,salary,row_number() over(order by salary desc) as row from public.employee_salary;

-- Display:
-- first_name
-- age
-- row number ordered by age (youngest first)
select first_name,age,row_number() over(order by age asc) as row from public.employee_demographics;

-- Display:
-- first_name
-- salary
-- row number within each department
-- (Hint: PARTITION BY dept_id.)
SELECT
    first_name,
    salary,
    ROW_NUMBER()
    OVER(
        PARTITION BY dept_id
        ORDER BY salary DESC
    ) AS row_num
FROM employee_salary;
-- Part D — RANK()
-- Rank employees by salary.
select first_name,salary,rank() over(order by salary desc) as rank from public.employee_salary;

-- Rank employees within each department.
SELECT
first_name,
salary,
RANK()
OVER(
PARTITION BY dept_id
ORDER BY salary DESC
)
FROM employee_salary;
-- Part E — DENSE_RANK()
-- Dense rank employees by salary.
select first_name,salary,dense_rank() over(order by salary desc) as rank from public.employee_salary;

-- Dense rank employees within each department.
SELECT
first_name,
salary,
DENSE_RANK()
OVER(
PARTITION BY dept_id
ORDER BY salary DESC
)
FROM employee_salary;
--  Challenge Questions
-- Challenge 1
-- Display:
-- Employee Name
-- Department
-- Salary
-- Department Average Salary
-- Difference from Department Average
SELECT 
    s.first_name || ' ' || s.last_name AS employee_name,
    p.department_name,
    s.salary, 
    AVG(s.salary) OVER (PARTITION BY p.department_name) AS departmentavg, 
    s.salary - AVG(s.salary) OVER (PARTITION BY p.department_name) AS difference
FROM public.employee_salary s 
JOIN public.parks_departments p 
    ON s.dept_id = p.department_id;

-- Challenge 2
-- Display only the top highest-paid employee from each department.
-- (Hint: Use ROW_NUMBER() in a subquery.)
SELECT *
FROM
(
SELECT
s.first_name,
d.department_name,
s.salary,
ROW_NUMBER()
OVER(
PARTITION BY d.department_name
ORDER BY salary DESC
) AS rn
FROM employee_salary s
JOIN parks_departments d
ON s.dept_id=d.department_id
) x
WHERE rn=1;
-- Challenge 3
-- Display the top 3 highest-paid employees in every department.
-- (Hint: DENSE_RANK() + PARTITION BY.)
SELECT *
FROM
(
SELECT
s.first_name,
d.department_name,
s.salary,
DENSE_RANK()
OVER(
PARTITION BY d.department_name
ORDER BY salary DESC
) AS rnk
FROM employee_salary s
JOIN parks_departments d
ON s.dept_id=d.department_id
) x
WHERE rnk<=3;