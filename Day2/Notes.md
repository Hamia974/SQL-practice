# Day 2 - SQL Data Filtering & Aggregation

## Topics Covered

### 1. GROUP BY
- Used to group rows with the same values.
- Commonly used with aggregate functions.

**Aggregate Functions Learned**
- COUNT()
- SUM()
- AVG()
- MAX()
- MIN()

### 2. ORDER BY
- Sorts query results.
- ASC (Ascending) – Default
- DESC (Descending)
- Sorting by multiple columns.

### 3. HAVING
- Filters grouped data after `GROUP BY`.
- Used with aggregate functions.

### 4. WHERE vs HAVING

| WHERE | HAVING |
|--------|---------|
| Filters individual rows | Filters groups |
| Executed before GROUP BY | Executed after GROUP BY |
| Cannot use aggregate functions directly | Can use aggregate functions |

### 5. LIMIT
- Restricts the number of rows returned.
- Commonly used with `ORDER BY` to retrieve Top N or Bottom N records.

---

## SQL Concepts Practiced

### GROUP BY
- Count employees by gender.
- Calculate average salary by occupation.
- Find maximum and minimum salary by occupation.
- Calculate total salary by occupation.
- Group employees by birth year.
- Group by multiple columns.

### ORDER BY
- Sort employees alphabetically.
- Sort by salary.
- Sort by age.
- Sort by birth date.
- Sort using multiple columns.

### HAVING
- Filter occupations by average salary.
- Filter occupations by total salary.
- Filter groups using COUNT(), MIN(), and MAX().

### LIMIT
- Retrieve the first N rows.
- Retrieve Top 3 highest-paid employees.
- Retrieve Bottom 2 salaries.
- Find youngest and oldest employees.

---

## Key Learnings

- `GROUP BY` groups rows with identical values.
- Aggregate functions summarize grouped data.
- `WHERE` filters rows before grouping.
- `HAVING` filters groups after aggregation.
- `ORDER BY` sorts query results.
- `LIMIT` restricts the number of returned rows.
- Multiple columns can be used in both `GROUP BY` and `ORDER BY`.

---

## Interview Notes

### SQL Execution Order

1. FROM
2. WHERE
3. GROUP BY
4. HAVING
5. SELECT
6. ORDER BY
7. LIMIT

### Common Mistakes

- Using `WHERE` with aggregate functions instead of `HAVING`.
- Forgetting that `ORDER BY` is ascending by default.
- Confusing `COUNT(column)` with `COUNT(*)`.
- Forgetting to include selected non-aggregated columns in the `GROUP BY` clause.

---

## Practice Completed

✔ GROUP BY

✔ Aggregate Functions

✔ ORDER BY

✔ HAVING

✔ LIMIT

✔ SQL Interview Questions

✔ Challenge Problems

---

## Dataset Used

- employee_demographics
- employee_salary

Database: PostgreSQL

---

## Progress

Completed Day 2 of my SQL Bootcamp using PostgreSQL. Focused on data aggregation, sorting, filtering grouped results, and limiting query output through hands-on practice and challenge questions.
