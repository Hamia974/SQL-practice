# Day 8 - Window Functions

## Topics Covered

### 1. What is a Window Function?

A **Window Function** performs calculations across a set of related rows while **keeping every row in the result**.

Unlike `GROUP BY`, window functions **do not collapse rows**.

---

# GROUP BY vs Window Function

## GROUP BY

- Groups rows together.
- Returns one row per group.
- Detail rows are removed.
- Used for summaries.

Example:

```sql
SELECT dept_id, AVG(salary)
FROM employee_salary
GROUP BY dept_id;
```

---

## Window Function

- Keeps every row.
- Performs calculations across related rows.
- Uses the `OVER()` clause.

Example:

```sql
SELECT
    first_name,
    salary,
    AVG(salary) OVER() AS average_salary
FROM employee_salary;
```

---

# OVER() Clause

Every window function uses the `OVER()` clause.

Syntax:

```sql
WINDOW_FUNCTION() OVER()
```

The `OVER()` clause defines **how the window is created**.

It may contain:

- `PARTITION BY`
- `ORDER BY`
- Window Frame

---

# Aggregate Window Functions

## AVG()

Returns the average while keeping every row.

```sql
SELECT
    first_name,
    salary,
    AVG(salary) OVER() AS average_salary
FROM employee_salary;
```

---

## SUM()

Returns the total while keeping every row.

```sql
SELECT
    first_name,
    salary,
    SUM(salary) OVER() AS total_salary
FROM employee_salary;
```

---

## COUNT()

```sql
SELECT
    first_name,
    COUNT(*) OVER() AS total_employees
FROM employee_salary;
```

---

## MAX()

```sql
SELECT
    first_name,
    salary,
    MAX(salary) OVER() AS highest_salary
FROM employee_salary;
```

---

## MIN()

```sql
SELECT
    first_name,
    salary,
    MIN(salary) OVER() AS lowest_salary
FROM employee_salary;
```

---

# PARTITION BY

`PARTITION BY` divides rows into groups **without collapsing them**.

Example:

```sql
SELECT
    first_name,
    dept_id,
    salary,
    AVG(salary)
    OVER(PARTITION BY dept_id) AS department_average
FROM employee_salary;
```

Each employee sees the average salary of their own department.

---

# Ranking Functions

## ROW_NUMBER()

Assigns a unique number to every row.

```sql
SELECT
    first_name,
    salary,
    ROW_NUMBER()
    OVER(ORDER BY salary DESC) AS row_num
FROM employee_salary;
```

---

## RANK()

Assigns the same rank to duplicate values and **skips** the next rank.

```sql
SELECT
    first_name,
    salary,
    RANK()
    OVER(ORDER BY salary DESC) AS rank
FROM employee_salary;
```

Example:

| Salary | Rank |
|--------:|-----:|
| 90000 | 1 |
| 85000 | 2 |
| 85000 | 2 |
| 70000 | 4 |

---

## DENSE_RANK()

Assigns the same rank to duplicate values but **does not skip** ranks.

```sql
SELECT
    first_name,
    salary,
    DENSE_RANK()
    OVER(ORDER BY salary DESC) AS dense_rank
FROM employee_salary;
```

Example:

| Salary | Dense Rank |
|--------:|-----------:|
| 90000 | 1 |
| 85000 | 2 |
| 85000 | 2 |
| 70000 | 3 |

---

# ROW_NUMBER() vs RANK() vs DENSE_RANK()

| Function | Duplicate Values | Skips Ranks? |
|----------|------------------|--------------|
| ROW_NUMBER() | No | No |
| RANK() | Yes | Yes |
| DENSE_RANK() | Yes | No |

---

# LAG()

Returns the value from the **previous row**.

Syntax:

```sql
LAG(column_name)
OVER(ORDER BY column_name)
```

Example:

```sql
SELECT
    first_name,
    salary,
    LAG(salary)
    OVER(ORDER BY salary) AS previous_salary
FROM employee_salary;
```

Common Uses:

- Compare current salary with previous salary.
- Compare today's sales with yesterday's.
- Time-series analysis.

---

# LEAD()

Returns the value from the **next row**.

Syntax:

```sql
LEAD(column_name)
OVER(ORDER BY column_name)
```

Example:

```sql
SELECT
    first_name,
    salary,
    LEAD(salary)
    OVER(ORDER BY salary) AS next_salary
FROM employee_salary;
```

Common Uses:

- Next transaction
- Next sale
- Future comparison

---

# FIRST_VALUE()

Returns the **first value** within a window.

Example:

```sql
SELECT
    first_name,
    salary,
    FIRST_VALUE(salary)
    OVER(ORDER BY salary) AS lowest_salary
FROM employee_salary;
```

Using `ORDER BY salary DESC` returns the highest salary.

---

# LAST_VALUE()

Returns the **last value** within the window.

Important:

Use the full window frame.

```sql
SELECT
    first_name,
    salary,
    LAST_VALUE(salary)
    OVER(
        ORDER BY salary
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS highest_salary
FROM employee_salary;
```

Without the window frame, `LAST_VALUE()` often returns the current row instead of the last row.

---

# Running Total

Calculates a cumulative total.

Example:

```sql
SELECT
    employee_id,
    first_name,
    salary,
    SUM(salary)
    OVER(ORDER BY employee_id) AS running_total
FROM employee_salary;
```

Example:

| Employee | Salary | Running Total |
|----------|--------:|--------------:|
| A | 50000 | 50000 |
| B | 60000 | 110000 |
| C | 70000 | 180000 |

---

# Running Average

Calculates a cumulative average.

```sql
SELECT
    employee_id,
    age,
    AVG(age)
    OVER(ORDER BY employee_id) AS running_average
FROM employee_demographics;
```

---

# Running Maximum

Calculates the highest value seen so far.

```sql
SELECT
    employee_id,
    salary,
    MAX(salary)
    OVER(ORDER BY employee_id) AS running_maximum
FROM employee_salary;
```

---

# NTILE()

Splits rows into equal-sized groups.

Example:

```sql
SELECT
    first_name,
    salary,
    NTILE(4)
    OVER(ORDER BY salary DESC) AS quartile
FROM employee_salary;
```

Example:

- Quartile 1 → Top 25%
- Quartile 2
- Quartile 3
- Quartile 4 → Bottom 25%

---

# SQL Concepts Practiced

✔ OVER()

✔ Aggregate Window Functions

- AVG()
- SUM()
- COUNT()
- MAX()
- MIN()

✔ PARTITION BY

✔ ROW_NUMBER()

✔ RANK()

✔ DENSE_RANK()

✔ LAG()

✔ LEAD()

✔ FIRST_VALUE()

✔ LAST_VALUE()

✔ Running Total

✔ Running Average

✔ Running Maximum

✔ NTILE()

---

# Dataset Used

- employee_demographics
- employee_salary
- parks_departments

Database: PostgreSQL

---

# Practice Completed

## Aggregate Window Functions

✔ Average salary

✔ Total salary

✔ Employee count

✔ Highest salary

✔ Lowest salary

---

## PARTITION BY

✔ Department average salary

✔ Gender-wise average age

✔ Department total salary

✔ Occupation highest salary

✔ Occupation employee count

---

## Ranking Functions

✔ ROW_NUMBER()

✔ RANK()

✔ DENSE_RANK()

---

## Advanced Window Functions

✔ LAG()

✔ LEAD()

✔ FIRST_VALUE()

✔ LAST_VALUE()

---

## Running Calculations

✔ Running Total

✔ Running Average

✔ Running Maximum

---

## NTILE()

✔ Salary Quartiles

✔ Age Groups

---

## Challenge Problems

✔ Salary Trend Report

✔ Department Highest Salary Comparison

✔ Salary Quartile Report

---

# Common Mistakes

- Forgetting the `OVER()` clause.
- Using `LAG()` or `LEAD()` without `ORDER BY`.
- Confusing `GROUP BY` with window functions.
- Forgetting `PARTITION BY` when ranking within groups.
- Forgetting the window frame with `LAST_VALUE()`.
- Assuming running totals should always be ordered by the value itself instead of a sequence like `employee_id` or a date.

---

# Best Practices

- Always use `ORDER BY` with ranking functions.
- Use `PARTITION BY` for department-wise or group-wise calculations.
- Use `ROW_NUMBER()` when every row needs a unique rank.
- Use `RANK()` when ties should skip the next rank.
- Use `DENSE_RANK()` when ties should not skip ranks.
- Use `LAG()` and `LEAD()` for row-to-row comparisons.
- Use `FIRST_VALUE()` and `LAST_VALUE()` to compare against the first or last row in a window.
- Use running totals for cumulative reporting and dashboards.

---

# Interview Notes

## What is a Window Function?

A window function performs calculations across a set of related rows while keeping every row in the result set.

---

## GROUP BY vs Window Function

| GROUP BY | Window Function |
|-----------|-----------------|
| Collapses rows | Keeps all rows |
| Returns one row per group | Returns every row |
| Used for summaries | Used for row-level analytics |

---

## What is the purpose of the OVER() clause?

The `OVER()` clause defines the window on which the function operates. It can include `PARTITION BY`, `ORDER BY`, and a window frame.

---

## What is PARTITION BY?

`PARTITION BY` divides rows into logical groups while keeping every row visible.

---

## ROW_NUMBER() vs RANK() vs DENSE_RANK()

| Function | Duplicate Values | Skips Ranks? |
|----------|------------------|--------------|
| ROW_NUMBER() | No | No |
| RANK() | Yes | Yes |
| DENSE_RANK() | Yes | No |

---

## LAG() vs LEAD()

| LAG() | LEAD() |
|--------|---------|
| Returns the previous row's value | Returns the next row's value |

---

## What is a Running Total?

A running total is a cumulative total where each row includes the sum of all previous rows plus the current row.

---

## Why does LAST_VALUE() need a window frame?

Without specifying:

```sql
ROWS BETWEEN UNBOUNDED PRECEDING
AND UNBOUNDED FOLLOWING
```

`LAST_VALUE()` often returns the current row instead of the last row in the complete window.

---

## What is NTILE()?

`NTILE()` divides rows into a specified number of approximately equal groups, such as quartiles or tertiles, and is commonly used for ranking and segmentation.

---

# Real-World Uses

- Employee salary ranking
- Department performance analysis
- Running sales totals
- KPI dashboards
- Time-series comparisons
- Customer segmentation
- Top-N reporting
- Revenue trend analysis
- Business intelligence reporting
- ETL and analytical data processing

---

# Key Learnings

- Window functions perform calculations without collapsing rows.
- `OVER()` is required for every window function.
- `PARTITION BY` groups rows logically while preserving detail.
- Ranking functions assign positions based on an order.
- `LAG()` and `LEAD()` compare adjacent rows.
- `FIRST_VALUE()` and `LAST_VALUE()` return boundary values in a window.
- Running functions calculate cumulative metrics.
- `NTILE()` divides data into equal-sized groups for analysis.

---

# Progress

Completed **Day 8** of my SQL Bootcamp using PostgreSQL. Learned aggregate and ranking window functions, advanced analytical functions (`LAG`, `LEAD`, `FIRST_VALUE`, `LAST_VALUE`), running calculations, and data segmentation with `NTILE()`, building practical SQL skills commonly required for Data Engineering, Data Analytics, and Business Intelligence roles.
