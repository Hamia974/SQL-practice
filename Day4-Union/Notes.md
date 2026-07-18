# Day 4 - UNION & UNION ALL

## Topics Covered

### 1. UNION
- Combines the results of two or more `SELECT` statements.
- Removes duplicate rows automatically.
- Each `SELECT` statement must return:
  - The same number of columns.
  - Compatible data types.
- The column names in the final result come from the first `SELECT` statement.

**Syntax**
```sql
SELECT column_name
FROM table1

UNION

SELECT column_name
FROM table2;
```

---

### 2. UNION ALL
- Combines the results of two or more `SELECT` statements.
- Keeps all rows, including duplicates.
- Faster than `UNION` because it does not perform duplicate removal.

**Syntax**
```sql
SELECT column_name
FROM table1

UNION ALL

SELECT column_name
FROM table2;
```

---

## UNION vs UNION ALL

| UNION | UNION ALL |
|--------|-----------|
| Removes duplicate rows | Keeps duplicate rows |
| Slightly slower | Faster |
| Used when unique results are required | Used when all records should be preserved |

---

## Rules for Using UNION

- Every `SELECT` statement must return the same number of columns.
- Corresponding columns should have compatible data types.
- `ORDER BY` is written only once, at the end of the final query.
- Column names in the output are taken from the first `SELECT`.

---

## SQL Concepts Practiced

### Basic UNION
- Combine first names and occupations.
- Combine employee IDs from different queries.
- Compare `UNION` and `UNION ALL`.

### UNION with WHERE
- Filter data before combining results.
- Combine employee names and occupations based on conditions.
- Combine employee IDs and department IDs.

### UNION with ORDER BY
- Sort combined results alphabetically.
- Sort numeric results in ascending order.

### Advanced UNION
- Combine multiple `SELECT` statements using `UNION ALL`.
- Merge first names, last names, and occupations into a single column.
- Create categorized reports using string literals.
- Remove duplicate IDs using `UNION`.

---

## Key Learnings

- `UNION` combines rows, not columns.
- `UNION` automatically removes duplicate rows.
- `UNION ALL` preserves duplicate rows.
- `ORDER BY` is always written at the end of the complete UNION query.
- Table relationships are not required when using `UNION`.
- Only compatible result sets can be combined.

---

## Common Mistakes

- Using different numbers of columns in each `SELECT`.
- Combining incompatible data types.
- Writing `ORDER BY` before the last `SELECT`.
- Confusing `JOIN` with `UNION`.
- Forgetting that `UNION` removes duplicates automatically.

---

## Best Practices

- Use `UNION ALL` when duplicate rows are acceptable because it is more efficient.
- Use meaningful aliases for output columns.
- Keep all `SELECT` statements consistent in structure.
- Apply filtering (`WHERE`) before performing the `UNION`.

---

## Dataset Used

- employee_demographics
- employee_salary

Database: PostgreSQL

---

## Practice Completed

✔ UNION

✔ UNION ALL

✔ UNION with WHERE

✔ UNION with ORDER BY

✔ Combining IDs from multiple tables

✔ Combining text columns

✔ Removing duplicate values

✔ Challenge Problems

---

## Interview Notes

### Difference between JOIN and UNION
- JOIN combines **columns** from related tables.
- UNION combines **rows** from multiple `SELECT` statements.

### Difference between UNION and UNION ALL
- UNION removes duplicates.
- UNION ALL keeps duplicates and is faster.

### Why is UNION ALL faster?
- It does not spend time checking and removing duplicate rows.

### Can UNION combine queries with different numbers of columns?
- **No.**
- Every `SELECT` statement must return the same number of columns with compatible data types.

### Where is ORDER BY written?
- At the end of the complete UNION query.

---

## SQL Execution Reminder

When using UNION:

1. Execute the first `SELECT`
2. Execute the second `SELECT`
3. Combine the result sets
4. Remove duplicates (only for `UNION`)
5. Apply `ORDER BY` (if present)

---

## Progress

Completed Day 4 of my SQL Bootcamp using PostgreSQL. Learned how to combine result sets using `UNION` and `UNION ALL`, apply filtering before combining data, sort combined results, and understand the differences between horizontal (JOIN) and vertical (UNION) data combination.
