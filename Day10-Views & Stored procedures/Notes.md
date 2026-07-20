# Day 10 – Views & Stored Procedures (PostgreSQL)

## Topics Covered

1. Views
2. CREATE VIEW
3. CREATE OR REPLACE VIEW
4. DROP VIEW
5. Stored Procedures
6. PostgreSQL Functions
7. RETURN QUERY
8. RETURNS TABLE
9. RETURNS SETOF
10. CALL Procedure
11. SELECT FROM Function

---

# What is a View?

A **View** is a virtual table created from a SQL query.

A view does **not store data physically**.

Instead, it stores the query definition and executes it whenever the view is called.

---

## Syntax

```sql
CREATE VIEW view_name AS
SELECT ...
FROM ...;
```

Example:

```sql
CREATE VIEW high_salary_employees AS
SELECT employee_id, first_name, salary
FROM employee_salary
WHERE salary > 70000;
```

Use the view:

```sql
SELECT *
FROM high_salary_employees;
```

---

# Why Use Views?

Views help:

- Simplify complex queries.
- Avoid rewriting long JOIN statements.
- Improve readability.
- Improve security by exposing limited columns.
- Reuse business logic.

---

# Create or Update a View

```sql
CREATE OR REPLACE VIEW employee_view AS
SELECT employee_id,
       first_name,
       salary
FROM employee_salary;
```

---

# Delete a View

```sql
DROP VIEW employee_view;
```

---

# GROUP BY vs Window Functions in Views

### GROUP BY

Returns one row per group.

```sql
SELECT occupation,
       AVG(salary)
FROM employee_salary
GROUP BY occupation;
```

---

### Window Function

Keeps all rows while showing aggregate values.

```sql
SELECT occupation,
       salary,
       AVG(salary) OVER(PARTITION BY occupation)
FROM employee_salary;
```

---

# What is a Stored Procedure?

A Stored Procedure is reusable SQL code stored inside the database.

Procedures are executed using:

```sql
CALL procedure_name();
```

---

## Procedure Syntax

```sql
CREATE PROCEDURE procedure_name()

LANGUAGE plpgsql

AS
$$

BEGIN

-- statements

END;

$$;
```

Example:

```sql
CREATE PROCEDURE prints()

LANGUAGE plpgsql

AS
$$

BEGIN

RAISE NOTICE 'SQL Bootcamp Running...';

END;

$$;
```

Run:

```sql
CALL prints();
```

---

# What is a Function?

A Function is reusable SQL code that returns a value or rows.

Functions are executed using:

```sql
SELECT * FROM function_name();
```

---

# Function Syntax

```sql
CREATE FUNCTION function_name()

RETURNS TABLE (...)

LANGUAGE sql

AS
$$

SELECT ...;

$$;
```

---

# RETURNS TABLE

Use when returning specific columns.

Example:

```sql
CREATE FUNCTION managers()

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
WHERE occupation LIKE '%Manager%';

$$;
```

Run:

```sql
SELECT *
FROM managers();
```

---

# RETURNS SETOF

Use when returning every column of an existing table.

Example:

```sql
CREATE FUNCTION get_high_salary()

RETURNS SETOF employee_salary

LANGUAGE plpgsql

AS
$$

BEGIN

RETURN QUERY

SELECT *
FROM employee_salary
WHERE salary > 60000;

END;

$$;
```

Run:

```sql
SELECT *
FROM get_high_salary();
```

---

# RETURN QUERY

`RETURN QUERY` is used inside PL/pgSQL functions to return rows.

Example:

```sql
RETURN QUERY
SELECT *
FROM employee_salary;
```

---

# Difference Between Function and Procedure

| Function | Procedure |
|----------|-----------|
| Returns values or rows | Usually performs actions |
| Can use RETURN QUERY | Cannot use RETURN QUERY |
| Called using SELECT | Called using CALL |
| Can return TABLE or SETOF | Cannot return result sets directly |

---

# Difference Between View and Function

| View | Function |
|-------|----------|
| Virtual table | Reusable SQL program |
| Query using SELECT | Execute using SELECT function() |
| Stores query definition | Stores executable logic |
| Cannot accept parameters | Can accept parameters |

---

# Difference Between View and Procedure

| View | Procedure |
|-------|-----------|
| Returns query results | Performs actions |
| Queried using SELECT | Executed using CALL |
| No procedural logic | Supports IF, LOOP, variables |

---

# Common Mistakes

### Wrong

```sql
CREATE PROCEDURE salary()
RETURNS SETOF employee_salary;
```

Procedures cannot return rows.

---

### Correct

Use a Function:

```sql
CREATE FUNCTION salary_function()
RETURNS SETOF employee_salary;
```

---

### Wrong

```sql
RETURNS SETOF employee_salary

SELECT first_name, occupation
```

You must return all columns if using `SETOF employee_salary`.

---

### Correct

Use:

```sql
RETURNS TABLE
(
    first_name TEXT,
    occupation TEXT
)
```

---

### Wrong

```sql
RAISE NOTICE 'Hello'
END;
```

Missing semicolon.

---

### Correct

```sql
RAISE NOTICE 'Hello';
```

---

# Real-World Uses

Views:

- Reporting
- Dashboards
- Business Intelligence
- Reusable joins
- Security layers

Functions:

- ETL pipelines
- Data validation
- Reusable transformations
- Data cleaning

Procedures:

- Batch jobs
- Logging
- Scheduled operations
- Administrative tasks

---

# Interview Questions

### 1. What is a View?

A virtual table created from a SQL query.

---

### 2. Does a View store data?

No.

It stores only the query definition.

---

### 3. Why are Views useful?

They simplify complex queries and improve readability.

---

### 4. What is a Stored Procedure?

A reusable block of SQL code executed using `CALL`.

---

### 5. What is a Function?

A reusable block of SQL code that returns values or rows.

---

### 6. Difference between Function and Procedure?

Functions return data; procedures generally perform actions.

---

### 7. Difference between RETURNS TABLE and RETURNS SETOF?

`RETURNS TABLE` returns specified columns.

`RETURNS SETOF table_name` returns all columns of that table.

---

### 8. Can a Procedure use RETURN QUERY?

No.

Only functions can use `RETURN QUERY`.

---

### 9. How do you execute a Procedure?

```sql
CALL procedure_name();
```

---

### 10. How do you execute a Function?

```sql
SELECT *
FROM function_name();
```

---

# Key Learnings

- Views are virtual tables.
- Views store queries, not data.
- Functions return values or rows.
- Procedures execute actions.
- Functions use SELECT.
- Procedures use CALL.
- RETURNS TABLE returns specific columns.
- RETURNS SETOF returns complete table rows.
- RETURN QUERY works only inside functions.
- Views, Functions, and Procedures are heavily used in production databases.

---

# Progress

Completed **Day 10** of the SQL Bootcamp using PostgreSQL. Learned how to create Views, Functions, and Stored Procedures, understood the differences between them, practiced reusable SQL logic, and explored how these concepts are used in real-world Data Engineering systems.
