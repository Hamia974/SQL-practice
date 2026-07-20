# Day 9 - Common Table Expressions (CTEs)

## Topics Covered

### What is a CTE?

A **Common Table Expression (CTE)** is a temporary named result set that exists only for the execution of a single SQL query.

It is created using the `WITH` keyword and can be referenced like a temporary table within the same query.

---

# Why Use CTEs?

CTEs make SQL queries:

- Easier to read
- Easier to write
- Easier to debug
- Easier to maintain
- Better for complex SQL queries

Instead of writing deeply nested subqueries, we can separate logic into readable blocks.

---

# Basic Syntax

```sql
WITH cte_name AS
(
    SELECT ...
)

SELECT *
FROM cte_name;
```

---

# Example

Without CTE:

```sql
SELECT *
FROM
(
    SELECT occupation,
           AVG(salary) AS avg_salary
    FROM employee_salary
    GROUP BY occupation
) AS temp;
```

With CTE:

```sql
WITH avg_salary AS
(
    SELECT occupation,
           AVG(salary) AS avg_salary
    FROM employee_salary
    GROUP BY occupation
)

SELECT *
FROM avg_salary;
```

---

# Creating Multiple CTEs

Multiple CTEs can be created in a single query.

Syntax:

```sql
WITH cte1 AS
(
    ...
),
cte2 AS
(
    ...
)

SELECT *
FROM cte1
JOIN cte2
ON ...;
```

**Important:**

There is only **one `WITH` keyword**.

Separate multiple CTEs using commas.

✅ Correct

```sql
WITH cte1 AS (...),
cte2 AS (...)
SELECT ...
```

❌ Incorrect

```sql
WITH cte1 AS (...)

WITH cte2 AS (...)
```

---

# Using WHERE inside a CTE

```sql
WITH high_salary AS
(
    SELECT *
    FROM employee_salary
    WHERE salary > 70000
)

SELECT *
FROM high_salary;
```

---

# Using GROUP BY inside a CTE

```sql
WITH avg_salary AS
(
    SELECT
        occupation,
        AVG(salary) AS avg_salary
    FROM employee_salary
    GROUP BY occupation
)

SELECT *
FROM avg_salary;
```

---

# Using HAVING inside a CTE

```sql
WITH dept_salary AS
(
    SELECT
        dept_id,
        AVG(salary) AS avg_salary
    FROM employee_salary
    GROUP BY dept_id
    HAVING AVG(salary) > 60000
)

SELECT *
FROM dept_salary;
```

---

# Using JOIN inside a CTE

```sql
WITH employee_department AS
(
    SELECT
        s.first_name,
        d.department_name,
        s.salary
    FROM employee_salary s
    JOIN parks_departments d
        ON s.dept_id = d.department_id
)

SELECT *
FROM employee_department;
```

---

# Using Window Functions inside a CTE

```sql
WITH ranked_employees AS
(
    SELECT
        first_name,
        salary,
        ROW_NUMBER() OVER(ORDER BY salary DESC) AS rn
    FROM employee_salary
)

SELECT *
FROM ranked_employees;
```

---

# Using Multiple CTEs

Example:

```sql
WITH department_avg AS
(
    SELECT
        dept_id,
        AVG(salary) AS avg_salary
    FROM employee_salary
    GROUP BY dept_id
),

employee_info AS
(
    SELECT
        first_name,
        salary,
        dept_id
    FROM employee_salary
)

SELECT
    employee_info.first_name,
    employee_info.salary,
    department_avg.avg_salary

FROM employee_info

JOIN department_avg
ON employee_info.dept_id = department_avg.dept_id;
```

---

# CTE vs Subquery

## Subquery

```sql
SELECT *
FROM
(
    SELECT *
    FROM employee_salary
) AS temp;
```

## CTE

```sql
WITH temp AS
(
    SELECT *
    FROM employee_salary
)

SELECT *
FROM temp;
```

CTEs are generally easier to understand and maintain.

---

# Advantages of CTEs

- Improves query readability
- Makes complex SQL easier to understand
- Reduces nested subqueries
- Can be referenced multiple times in the same query
- Works with joins, grouping, window functions, and subqueries
- Commonly used in production SQL

---

# SQL Concepts Practiced

- WITH clause
- Single CTE
- Multiple CTEs
- WHERE inside CTE
- GROUP BY inside CTE
- HAVING inside CTE
- JOIN inside CTE
- Window Functions inside CTE
- Multiple CTE joins

---

# Dataset Used

- employee_salary
- employee_demographics
- parks_departments

Database: PostgreSQL

---

# Practice Completed

## Basic CTEs

✔ Display employee information

✔ Filter high-salary employees

✔ Filter female employees

✔ Filter employees by department

✔ Filter managers

---

## GROUP BY with CTEs

✔ Average salary by occupation

✔ Employee count by department

✔ Average age by gender

✔ Maximum salary by occupation

✔ Total salary by department

---

## JOIN + CTE

✔ Employee and department details

✔ Full name, occupation, and department

✔ Department average salary

---

## Window Functions + CTE

✔ ROW_NUMBER()

✔ Department ranking

✔ Running total

✔ FIRST_VALUE()

---

## Multiple CTEs

✔ Department average salary

✔ Employee information

✔ Combining CTEs

✔ UNION ALL using multiple CTEs

✔ Ranking filtered employees

---

# Common Mistakes

- Forgetting to use only one `WITH` keyword.
- Missing `GROUP BY` when using aggregate functions.
- Mixing window functions with `HAVING`.
- Forgetting to join CTEs properly.
- Confusing CTEs with permanent tables.
- Using `MAX()` instead of `SUM()` for total salary.
- Forgetting to alias calculated columns.

---

# Best Practices

- Give meaningful names to CTEs.
- Use CTEs to simplify complex queries.
- Use multiple CTEs to separate different logical steps.
- Use `GROUP BY` for summarized data.
- Use window functions when detail rows should remain visible.
- Keep each CTE focused on a single task.

---

# Interview Questions

## 1. What is a CTE?

A Common Table Expression (CTE) is a temporary named result set that exists only during the execution of a single SQL query.

---

## 2. Which keyword is used to create a CTE?

`WITH`

---

## 3. Is a CTE stored permanently?

No.

It exists only while the query is executing.

---

## 4. Can multiple CTEs be created?

Yes.

Separate them using commas under a single `WITH` clause.

---

## 5. Can a CTE contain JOINs?

Yes.

---

## 6. Can a CTE contain GROUP BY?

Yes.

---

## 7. Can a CTE contain HAVING?

Yes.

---

## 8. Can a CTE contain Window Functions?

Yes.

---

## 9. Difference between a CTE and a Subquery?

| CTE | Subquery |
|------|----------|
| More readable | Can become difficult to read |
| Easier to maintain | Harder to maintain |
| Uses `WITH` | Written inside another query |
| Can be referenced multiple times within the same query | Usually referenced once |

---

## 10. Why are CTEs widely used in Data Engineering?

Because they simplify complex ETL queries, improve readability, and make large SQL scripts easier to maintain and debug.

---

# Real-World Uses

CTEs are commonly used in:

- ETL pipelines
- Data Warehouses
- Data Cleaning
- Business Intelligence reports
- Data Transformation
- Analytical SQL
- Amazon Redshift
- Google BigQuery
- Snowflake
- Azure Synapse
- PostgreSQL
- SQL Server

---

# Key Learnings

- CTEs create temporary named result sets.
- They improve SQL readability and organization.
- Multiple CTEs are defined under a single `WITH` clause.
- CTEs work seamlessly with `JOIN`, `GROUP BY`, `HAVING`, and window functions.
- CTEs are temporary and disappear after query execution.
- They are preferred over deeply nested subqueries for complex SQL logic.

---

# Progress

Completed **Day 9** of my SQL Bootcamp using PostgreSQL. Learned how to create and use Common Table Expressions (CTEs), combine multiple CTEs, integrate them with joins, grouping, filtering, and window functions, and understand their practical use in ETL pipelines and Data Engineering workflows.
