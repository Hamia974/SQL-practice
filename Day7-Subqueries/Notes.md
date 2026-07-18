# Day 7 - Subqueries (Nested Queries)

## Topics Covered

### 1. What is a Subquery?

A **subquery** (also called a **nested query**) is a query written inside another SQL query.

The **inner query executes first**, and its result is passed to the **outer query**.

**Basic Syntax**

```sql
SELECT column_name
FROM table_name
WHERE column_name OPERATOR
(
    SELECT column_name
    FROM another_table
);
```

---

# SQL Execution Order

SQL always executes a subquery in this order:

```
1. Execute the Inner Query

↓

2. Return the Result

↓

3. Execute the Outer Query
```

Example

```sql
SELECT *
FROM employee_salary
WHERE salary >
(
    SELECT AVG(salary)
    FROM employee_salary
);
```

Execution

```
Step 1

SELECT AVG(salary)

↓

65000

Step 2

SELECT *
FROM employee_salary
WHERE salary > 65000;
```

---

# Types of Subqueries

### 1. Scalar Subquery

Returns **only one value**.

Example

```sql
SELECT *
FROM employee_salary
WHERE salary >
(
    SELECT AVG(salary)
    FROM employee_salary
);
```

---

### 2. Single Row Subquery

Returns exactly one row.

Example

```sql
SELECT *
FROM employee_salary
WHERE salary =
(
    SELECT MAX(salary)
    FROM employee_salary
);
```

---

### 3. Multiple Row Subquery

Returns multiple values.

Usually used with:

- IN
- ANY
- ALL

Example

```sql
SELECT *
FROM employee_salary
WHERE dept_id IN
(
    SELECT department_id
    FROM parks_departments
);
```

---

### 4. Correlated Subquery

A correlated subquery depends on the outer query.

Example

```sql
SELECT *
FROM employee_salary e1
WHERE salary >
(
    SELECT AVG(salary)
    FROM employee_salary e2
    WHERE e1.dept_id = e2.dept_id
);
```

The inner query executes once for every row of the outer query.

---

# Subquery in WHERE

Used for filtering records.

Examples practiced:

- Salary greater than average salary
- Salary less than average salary
- Maximum salary
- Minimum salary
- Employees working in a specific department

---

# Subquery with IN

Used when a subquery returns multiple values.

Example

```sql
SELECT *
FROM employee_salary
WHERE dept_id IN
(
    SELECT department_id
    FROM parks_departments
);
```

---

# Subquery in SELECT

A scalar subquery can be placed inside the SELECT list.

Example

```sql
SELECT
    first_name,
    salary,
    (
        SELECT AVG(salary)
        FROM employee_salary
    ) AS average_salary
FROM employee_salary;
```

Useful for reports and dashboards.

---

# Subquery in FROM

A query can act as a temporary table.

Example

```sql
SELECT *
FROM
(
    SELECT
        occupation,
        AVG(salary) AS average_salary
    FROM employee_salary
    GROUP BY occupation
) AS temp;
```

Always give the temporary table an alias.

---

# EXISTS

Checks whether matching rows exist.

Example

```sql
SELECT *
FROM employee_demographics d
WHERE EXISTS
(
    SELECT *
    FROM employee_salary s
    WHERE d.employee_id = s.employee_id
);
```

Returns employees having salary records.

---

# NOT EXISTS

Returns rows that do not have matching records.

Example

```sql
SELECT *
FROM employee_demographics d
WHERE NOT EXISTS
(
    SELECT *
    FROM employee_salary s
    WHERE d.employee_id = s.employee_id
);
```

Returns employees without salary records.

---

# ALL

Compares a value against every value returned by the subquery.

Example

```sql
SELECT *
FROM employee_salary
WHERE salary >
ALL
(
    SELECT salary
    FROM employee_salary
    WHERE dept_id = 1
);
```

---

# SQL Concepts Practiced

✔ Scalar Subqueries

✔ Subqueries in WHERE

✔ Subqueries in SELECT

✔ Subqueries in FROM

✔ IN

✔ EXISTS

✔ NOT EXISTS

✔ ALL

✔ Correlated Subqueries

---

# Dataset Used

- employee_demographics
- employee_salary
- parks_departments

Database: PostgreSQL

---

# Practice Completed

## Part A

✔ Salary greater than average

✔ Salary less than average

✔ Maximum salary

✔ Minimum salary

✔ Employees in Finance department

---

## Part B

✔ IN Subqueries

✔ Department names having employees

✔ Occupation by department

---

## Part C

✔ Scalar subquery in SELECT

✔ Difference from average salary

---

## Part D

✔ Temporary table using FROM

✔ Department-wise employee count

---

## Part E

✔ EXISTS

✔ NOT EXISTS

---

## Challenge Problems

✔ Employees earning above department average (Correlated Subquery)

✔ Department with highest average salary

✔ Salary greater than every employee in Department 1 (ALL)

---

# Common Mistakes

- Forgetting parentheses around the subquery.
- Using `=` when the subquery returns multiple rows (use `IN` instead).
- Forgetting to provide an alias for a subquery in the FROM clause.
- Writing unnecessary conditions inside subqueries.
- Confusing `IN` with `EXISTS`.

---

# Best Practices

- Keep subqueries simple and readable.
- Use `IN` when comparing against multiple values.
- Use `EXISTS` to check if matching rows exist.
- Always alias subqueries in the FROM clause.
- Use correlated subqueries only when the inner query depends on the outer query.

---

# Interview Notes

### What is a Subquery?

A subquery is a query written inside another SQL query. It is also called a nested query and provides data to the outer query.

---

### What is the execution order?

1. Execute the inner query.
2. Pass the result to the outer query.
3. Execute the outer query.

---

### Scalar Subquery vs Correlated Subquery

| Scalar Subquery | Correlated Subquery |
|-----------------|---------------------|
| Returns one value | Depends on the outer query |
| Executes once | Executes once for each outer row |
| Simpler | More advanced |

---

### IN vs EXISTS

| IN | EXISTS |
|----|---------|
| Compares values returned by the subquery | Checks whether matching rows exist |
| Suitable for comparing lists of values | Often more efficient for large datasets |
| Returns matching values | Stops when the first match is found |

---

### Can a subquery be used inside SELECT, FROM, and WHERE?

Yes.

A subquery can be used inside:

- SELECT
- FROM
- WHERE
- HAVING

---

# Real-World Uses

- Employee salary analysis
- Department performance reports
- Dashboard metrics
- Data validation
- ETL pipelines
- Data cleaning
- Business intelligence reporting
- Customer segmentation

---

# Key Learnings

- A subquery is executed before the outer query.
- Scalar subqueries return one value.
- Use `IN` for multiple values.
- Use `EXISTS` to check whether matching rows exist.
- A correlated subquery depends on the outer query.
- Subqueries can be placed inside SELECT, FROM, WHERE, and HAVING clauses.

---

# Progress

Completed **Day 7** of my SQL Bootcamp using PostgreSQL. Learned how to write nested queries, use scalar and correlated subqueries, filter data with IN and EXISTS, create temporary result sets using subqueries in the FROM clause, and solve real-world business problems involving salary analysis, department reporting, and advanced data retrieval.
