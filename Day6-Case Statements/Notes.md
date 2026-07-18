# Day 6 - CASE Statements

## Topics Covered

### 1. CASE Statement
- A `CASE` statement is used to implement conditional logic in SQL.
- It works like an **if-else** statement in programming languages.
- It evaluates conditions one by one and returns the result of the first matching condition.
- If no condition is true, the `ELSE` block is executed.

**Syntax**

```sql
SELECT
    column_name,
    CASE
        WHEN condition1 THEN result1
        WHEN condition2 THEN result2
        ELSE result
    END AS alias_name
FROM table_name;
```

---

## Execution Flow

SQL checks the conditions from top to bottom.

Example:

```sql
CASE
    WHEN salary >= 80000 THEN 'High'
    WHEN salary >= 60000 THEN 'Medium'
    ELSE 'Low'
END
```

If salary is **85000**

```
85000 >= 80000

↓

High
```

SQL stops checking after finding the first true condition.

---

# SQL Concepts Practiced

## Basic CASE Statements

### Salary Categories

- High
- Medium
- Low

### Gender Labels

- Male → M
- Female → F

### Age Categories

- Young
- Adult
- Senior

### Occupation Categories

- Management
- Staff

### Even / Odd Employee IDs

Used the modulus operator `%`.

Example:

```sql
employee_id % 2
```

---

# CASE + Calculations

Used CASE to calculate salary increments.

Example:

```sql
SELECT
    salary,
    CASE
        WHEN salary >= 70000 THEN salary * 1.15
        ELSE salary * 1.08
    END AS new_salary
FROM employee_salary;
```

### Percentage Formula

To calculate **only the bonus**

```
salary × 0.05
```

To calculate the **new salary after a 5% increase**

```
salary × 1.05
```

Explanation

```
1.00 = Original Salary (100%)

0.05 = 5% Increase

-------------------

1.05 = 105%
```

Similarly,

| Increase | Formula |
|----------|---------|
| 5% | salary × 1.05 |
| 8% | salary × 1.08 |
| 10% | salary × 1.10 |
| 15% | salary × 1.15 |
| 20% | salary × 1.20 |

---

# CASE + GROUP BY

Used CASE to create categories and count employees.

Examples

- Salary Category
- Age Category
- Management vs Staff

Example

```sql
SELECT
CASE
    WHEN salary >= 80000 THEN 'High'
    WHEN salary >= 60000 THEN 'Medium'
    ELSE 'Low'
END AS salary_category,

COUNT(*)

FROM employee_salary

GROUP BY salary_category;
```

---

# CASE + ORDER BY

Used CASE for custom sorting.

Example

Female employees first.

```sql
SELECT
    first_name,
    gender
FROM employee_demographics
ORDER BY
CASE
    WHEN gender='Female' THEN 1
    ELSE 2
END;
```

CASE inside `ORDER BY` allows custom sorting instead of alphabetical sorting.

---

# CASE + Business Rules

Implemented real-world business logic.

Examples

- Salary categories
- Employee bonuses
- Salary increments
- Employee classification
- Department categorization

---

# Key Learnings

- CASE works like an if-else statement.
- SQL checks conditions from top to bottom.
- The first matching condition is returned.
- ELSE is optional but recommended.
- CASE creates new calculated columns.
- CASE can return text, numbers, dates, and expressions.
- CASE is widely used in reports and dashboards.

---

# Where CASE Can Be Used

✔ SELECT

✔ WHERE

✔ ORDER BY

✔ GROUP BY

✔ HAVING

✔ Aggregate Functions

✔ Calculations

---

# Common Mistakes

- Forgetting the `END` keyword.
- Forgetting to provide an alias.
- Writing conditions in the wrong order.
- Using incorrect percentage formulas.
- Returning different data types unnecessarily.
- Forgetting the `ELSE` block.

---

# Best Practices

- Always use meaningful aliases.
- Add an `ELSE` whenever possible.
- Keep CASE conditions simple and readable.
- Write conditions from the most specific to the most general.
- Use numeric values without quotes when performing calculations.

Example

Correct

```sql
THEN 5000
```

Incorrect

```sql
THEN '5000'
```

---

# Dataset Used

- employee_demographics
- employee_salary

Database: PostgreSQL

---

# Practice Completed

✔ Basic CASE Statements

✔ CASE with Salary Categories

✔ CASE with Age Categories

✔ CASE with Gender Labels

✔ CASE with Occupation Categories

✔ CASE with Even/Odd Numbers

✔ CASE with Calculations

✔ CASE with GROUP BY

✔ CASE with ORDER BY

✔ Real-world Salary Increment Problems

✔ Challenge Problems

---

# Interview Notes

### What is a CASE Statement?

A CASE statement is used to implement conditional logic inside SQL queries, similar to an if-else statement in programming.

---

### CASE vs WHERE

| CASE | WHERE |
|------|-------|
| Returns a new value | Filters rows |
| Creates calculated columns | Removes rows that do not meet a condition |
| Used for categorization | Used for filtering data |

---

### Can CASE return numbers and text?

Yes.

Example

```sql
CASE
WHEN salary >= 60000
THEN 'High'
ELSE 'Low'
END
```

Example

```sql
CASE
WHEN age < 30
THEN 5000
ELSE 3000
END
```

---

### Can CASE be used in ORDER BY?

Yes.

It is commonly used to implement custom sorting.

---

### Where is CASE commonly used?

- SELECT
- WHERE
- GROUP BY
- HAVING
- ORDER BY
- Aggregate Functions
- Calculations

---

# SQL Execution Reminder

Execution order of CASE

1. Read each row.
2. Evaluate conditions from top to bottom.
3. Return the first matching result.
4. If no condition matches, execute the ELSE block.
5. Continue to the next row.

---

# Real-World Uses

- Employee salary bands
- Bonus calculations
- Tax calculations
- Customer segmentation
- Age groups
- Product categorization
- Dashboard reporting
- KPI reports
- ETL data transformations
- Data cleaning

---

# Progress

Completed **Day 6** of my SQL Bootcamp using PostgreSQL. Learned how to implement conditional logic with `CASE` statements, create business rules, categorize data, calculate salary increments and bonuses, perform custom sorting, group categorized data, and apply real-world reporting logic commonly used in data engineering and analytics.
