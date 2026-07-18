# Day 5 - String Functions

## Topics Covered

### 1. LENGTH()
- Returns the number of characters in a string.

**Syntax**
```sql
SELECT LENGTH(column_name)
FROM table_name;
```

Example:
```sql
SELECT first_name, LENGTH(first_name)
FROM employee_demographics;
```

---

### 2. UPPER()
- Converts all characters to uppercase.

**Syntax**
```sql
SELECT UPPER(column_name)
FROM table_name;
```

---

### 3. LOWER()
- Converts all characters to lowercase.

**Syntax**
```sql
SELECT LOWER(column_name)
FROM table_name;
```

---

### 4. INITCAP()
(PostgreSQL Specific)
- Converts the first letter of every word to uppercase.

**Syntax**
```sql
SELECT INITCAP(column_name);
```

Example:

```text
haMia khaLIL
↓

Hamia Khalil
```

---

### 5. TRIM()
- Removes spaces from both the beginning and end of a string.

**Syntax**
```sql
SELECT TRIM(column_name);
```

---

### 6. LTRIM()
- Removes spaces from the left side of a string.

**Syntax**
```sql
SELECT LTRIM(column_name);
```

---

### 7. RTRIM()
- Removes spaces from the right side of a string.

**Syntax**
```sql
SELECT RTRIM(column_name);
```

---

### 8. LEFT()
- Returns the specified number of characters from the left side of a string.

**Syntax**
```sql
SELECT LEFT(column_name, number_of_characters);
```

Example:
```sql
SELECT LEFT(first_name,3)
FROM employee_demographics;
```

---

### 9. RIGHT()
- Returns the specified number of characters from the right side of a string.

**Syntax**
```sql
SELECT RIGHT(column_name, number_of_characters);
```

---

### 10. SUBSTRING()
- Extracts part of a string starting from a specified position.

**Syntax**
```sql
SELECT SUBSTRING(column_name, start_position, length);
```

Example:
```sql
SELECT SUBSTRING(first_name,1,3)
FROM employee_demographics;
```

---

### 11. REPLACE()
- Replaces one substring with another.

**Syntax**
```sql
SELECT REPLACE(column_name,'old','new');
```

Example:
```sql
SELECT REPLACE(first_name,'a','@')
FROM employee_demographics;
```

---

### 12. POSITION()
- Returns the position of a character or substring.
- Returns **0** if the value is not found.

**Syntax**
```sql
SELECT POSITION('a' IN first_name);
```

---

### 13. CONCAT()
- Combines multiple strings into one string.

**Syntax**
```sql
SELECT CONCAT(first_name,' ',last_name);
```

---

### 14. || (Concatenation Operator)
- PostgreSQL operator used to concatenate strings.
- Produces the same result as `CONCAT()`.

Example:
```sql
SELECT first_name || ' ' || last_name
FROM employee_demographics;
```

---

### 15. REVERSE()
- Reverses the characters of a string.

**Syntax**
```sql
SELECT REVERSE(column_name);
```

---

### 16. ASCII()
- Returns the ASCII value of the first character.

Example:
```sql
SELECT ASCII('A');
```

Output:
```text
65
```

---

## SQL Concepts Practiced

### Basic String Functions
- Find the length of employee names.
- Convert text to uppercase.
- Convert text to lowercase.
- Create full names using `CONCAT()`.
- Create full names using `||`.

### LEFT() and RIGHT()
- Extract the first few characters.
- Extract the last few characters.
- Work with employee names and occupations.

### SUBSTRING()
- Extract specific portions of names.
- Extract prefixes from occupations.

### REPLACE()
- Replace characters inside strings.
- Modify names and occupations dynamically.

### POSITION()
- Find the location of a character inside a string.

### Advanced String Operations
- Display full name with character count.
- Filter names based on string length.
- Use `LIKE` with string-based conditions.
- Build initials using string functions.

---

## Key Learnings

- String functions manipulate text data.
- `LENGTH()` returns the number of characters.
- `UPPER()` and `LOWER()` change letter case.
- `LEFT()` and `RIGHT()` extract characters from the beginning or end.
- `SUBSTRING()` extracts characters from any position.
- `REPLACE()` modifies text by replacing characters or words.
- `POSITION()` locates characters within a string.
- `CONCAT()` and `||` combine multiple strings.
- `TRIM()`, `LTRIM()`, and `RTRIM()` remove unnecessary spaces.

---

## Common Mistakes

- Forgetting that `POSITION()` returns **0** if a character is not found.
- Mixing up `LEFT()` and `SUBSTRING()`.
- Selecting columns from the wrong table.
- Forgetting to use aliases for calculated columns.
- Confusing `CONCAT()` with arithmetic operators.

---

## Best Practices

- Use meaningful aliases for calculated columns.
- Use `CONCAT()` or `||` consistently throughout a project.
- Use `TRIM()` before comparing user-entered text.
- Prefer descriptive output names for readability.
- Know which table contains each column before writing queries.

---

## Dataset Used

- employee_demographics
- employee_salary

Database: PostgreSQL

---

## Practice Completed

✔ LENGTH()

✔ UPPER()

✔ LOWER()

✔ INITCAP()

✔ TRIM()

✔ LTRIM()

✔ RTRIM()

✔ LEFT()

✔ RIGHT()

✔ SUBSTRING()

✔ REPLACE()

✔ POSITION()

✔ CONCAT()

✔ || (Concatenation Operator)

✔ Filtering with String Functions

✔ Challenge Problems

---

## Interview Notes

### Difference between CONCAT() and ||
- `CONCAT()` is a SQL function.
- `||` is PostgreSQL's string concatenation operator.
- Both combine strings into a single value.

### What does SUBSTRING() do?
- Extracts a specified number of characters starting from a given position.

### Difference between LEFT() and SUBSTRING()
- `LEFT()` extracts characters only from the beginning.
- `SUBSTRING()` can extract characters from any position.

### Which function removes spaces?
- `TRIM()` removes spaces from both sides.
- `LTRIM()` removes spaces from the left.
- `RTRIM()` removes spaces from the right.

### Which function returns the length of a string?
- `LENGTH()`

---

## SQL Execution Reminder

String functions are commonly used with:

1. SELECT
2. WHERE
3. ORDER BY
4. GROUP BY
5. HAVING

Example:

```sql
SELECT
    UPPER(first_name)
FROM employee_demographics
WHERE LENGTH(first_name) > 5
ORDER BY first_name;
```

---

## Real-World Uses

- Standardizing customer names.
- Cleaning imported data.
- Creating usernames and email addresses.
- Generating employee initials.
- Formatting reports and dashboards.
- Preparing text before loading data into a data warehouse.

---

## Progress

Completed **Day 5** of my SQL Bootcamp using PostgreSQL. Learned how to manipulate and clean text data using PostgreSQL string functions, create formatted output, extract portions of strings, replace characters, calculate string lengths, and prepare textual data for real-world reporting and data engineering tasks.
