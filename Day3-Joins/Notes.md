# Day 3 - SQL Joins

## Topics Covered

### 1. INNER JOIN
- Combines rows from two tables based on a matching column.
- Returns only the rows that exist in both tables.

**Syntax**
```sql
SELECT *
FROM table1
INNER JOIN table2
ON table1.column = table2.column;
```

---

### 2. LEFT JOIN
- Returns all rows from the left table.
- Returns matching rows from the right table.
- If no match exists, NULL values are returned for the right table.

**Syntax**
```sql
SELECT *
FROM table1
LEFT JOIN table2
ON table1.column = table2.column;
```

---

### 3. RIGHT JOIN
- Returns all rows from the right table.
- Returns matching rows from the left table.
- If no match exists, NULL values are returned for the left table.

**Syntax**
```sql
SELECT *
FROM table1
RIGHT JOIN table2
ON table1.column = table2.column;
```

---

### 4. SELF JOIN
- Joins a table with itself.
- Requires table aliases to distinguish between the two instances of the same table.
- Commonly used for hierarchical relationships such as Employee → Manager.

**Syntax**
```sql
SELECT *
FROM employees e1
JOIN employees e2
ON e1.manager_id = e2.employee_id;
```

---

### 5. Multiple JOIN
- Used to join three or more tables in a single query.
- Useful for generating reports that require data from multiple related tables.

Example:
- employee_demographics
- employee_salary
- parks_departments

---

## SQL Concepts Practiced

### INNER JOIN
- Display employee names with occupations.
- Display employee names with salaries.
- Filter joined data using WHERE.
- Sort joined data using ORDER BY.

### LEFT JOIN
- Display all employees, including those without salary records.
- Understand NULL values in unmatched rows.

### RIGHT JOIN
- Display all salary records, including those without matching employee information.

### JOIN + GROUP BY
- Average salary by gender.
- Highest salary by gender.
- Employee count by occupation.

### JOIN + HAVING
- Filter occupations by average salary.
- Filter genders by total salary.
- Filter occupations by employee count.

### JOIN + ORDER BY + LIMIT
- Top highest-paid employees.
- Youngest employee with occupation and salary.

### Multiple JOIN
- Employee name with occupation and department.
- Average salary by department.
- Employee count by department.
- Highest salary by department.
- Total salary by department.
- Department reports using HAVING.
- Department reports using ORDER BY.

---

## Key Learnings

- Joins combine data from multiple related tables.
- INNER JOIN returns only matching records.
- LEFT JOIN keeps all rows from the left table.
- RIGHT JOIN keeps all rows from the right table.
- SELF JOIN allows a table to reference itself.
- Multiple JOINs allow combining data from several tables.
- Aliases improve query readability and reduce typing.
- The ON clause defines how tables are related.

---

## SQL Execution Order (Simplified)

1. FROM
2. JOIN
3. ON
4. WHERE
5. GROUP BY
6. HAVING
7. SELECT
8. ORDER BY
9. LIMIT

---

## Common Mistakes

- Forgetting the ON condition while joining tables.
- Joining on incorrect columns.
- Confusing INNER JOIN with LEFT JOIN.
- Using GROUP BY incorrectly after joins.
- Selecting columns that are neither grouped nor aggregated.
- Forgetting that NULL values appear in LEFT and RIGHT JOIN when no matching record exists.

---

## Best Practices

- Use meaningful table aliases (e.g., `emp`, `sal`, `dep`).
- Qualify column names when multiple tables contain the same column.
- Use explicit JOIN types (`INNER JOIN`, `LEFT JOIN`, etc.) for better readability.
- Format SQL queries with proper indentation for maintainability.

---

## Dataset Used

- employee_demographics
- employee_salary
- parks_departments

Database: PostgreSQL

---

## Practice Completed

✔ INNER JOIN

✔ LEFT JOIN

✔ RIGHT JOIN

✔ SELF JOIN (Concept)

✔ Multiple JOIN

✔ JOIN with WHERE

✔ JOIN with GROUP BY

✔ JOIN with HAVING

✔ JOIN with ORDER BY

✔ JOIN with LIMIT

✔ Department-wise Reporting

✔ Challenge Problems

---

## Progress

Completed Day 3 of my SQL Bootcamp using PostgreSQL. Learned how to combine data across multiple related tables using different JOIN operations and generated analytical reports using GROUP BY, HAVING, ORDER BY, and aggregate functions.
