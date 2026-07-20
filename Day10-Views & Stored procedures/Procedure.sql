-- Practice Questions — Functions/Procedures
-- Q6
CREATE OR REPLACE FUNCTION gethighsalary()
RETURNS SETOF public.employee_salary 
LANGUAGE plpgsql 
AS $$
BEGIN
    RETURN QUERY 
    SELECT * 
    FROM public.employee_salary 
    WHERE salary > 60000;
END;
$$;
SELECT * FROM gethighsalary();


-- Q7
-- Create a function returning
-- first_name
-- occupation
-- for managers only.
CREATE OR REPLACE FUNCTION managers()

RETURNS TABLE
(
    first_name TEXT,
    occupation TEXT
)

LANGUAGE sql

AS
$$

SELECT
first_name,
occupation

FROM employee_salary

WHERE occupation LIKE '%Manager';

$$;
-- Q8
-- Create a procedure that prints
-- SQL Bootcamp Running...
-- using RAISE NOTICE.
CREATE PROCEDURE prints()

LANGUAGE plpgsql

AS
$$

BEGIN

RAISE NOTICE 'SQL BOOTCAMP RUNNING...';

END;

$$;
CALL prints();

$$;
-- Q9
-- Create a function that returns all employees from department 1.
create function returnemp ()
RETURNS SETOF public.employee_salary
language plpgsql 
as $$ 
begin
return query
select* from public.employee_salary where dept_id=1;
end;
$$;
-- Q10
-- Create a function that returns
-- first_name
-- salary
-- ordered from highest salary to lowest.
CREATE OR REPLACE FUNCTION highest_salary()

RETURNS TABLE
(
    first_name TEXT,
    salary NUMERIC
)

LANGUAGE sql

AS
$$

SELECT
first_name,
salary

FROM employee_salary

ORDER BY salary DESC;

$$;