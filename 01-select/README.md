# Topic 01 — SELECT & Filtering

**Back to SQL | Relearning in Public**

> **Learning goal:** know how to choose columns, filter rows, combine conditions, and handle missing values correctly before attempting the first SQL 50 problems.

**Prerequisites:** basic understanding of tables, rows, and columns.  
**Dialect:** MySQL.  
**Practice:** [LeetCode SQL 50 study plan](https://leetcode.com/studyplan/top-sql-50/).

## 1. The mental model: rows first, columns next

A table holds rows (records) and columns (attributes). A typical query answers two questions:

1. **Which rows qualify?** → `WHERE`
2. **Which columns should be returned?** → `SELECT`

```sql
SELECT name, department
FROM employees
WHERE department = 'Analytics';
```

Although `SELECT` is typed first, the database conceptually identifies the source with `FROM`, filters rows with `WHERE`, then projects the requested columns with `SELECT`. This is a helpful *logical* model, not a promise of the physical execution plan.

## 2. SELECT — return the information you need

```sql
-- All columns (fine for exploration, often unnecessary in final answers)
SELECT *
FROM employees;

-- Only the requested columns
SELECT employee_id, name
FROM employees;

-- Rename a column in the result
SELECT name AS employee_name
FROM employees;
```

**Rule of thumb:** return only the columns the question asks for. Some interview problems expect an exact output schema.

## 3. WHERE — keep rows that match a condition

```sql
SELECT employee_id, name
FROM employees
WHERE salary > 50000;
```

Useful comparison operators include `=`, `<>` (not equal), `>`, `<`, `>=`, and `<=`. Text literals are quoted with single quotes.

```sql
SELECT name
FROM employees
WHERE department <> 'Sales';
```

**Important:** `WHERE department <> 'Sales'` does **not** include rows where `department` is `NULL`.

## 4. AND, OR, NOT — combine conditions carefully

```sql
-- Both conditions must be true
SELECT name
FROM employees
WHERE department = 'Analytics'
  AND salary >= 50000;

-- At least one condition must be true
SELECT name
FROM employees
WHERE department = 'Analytics'
   OR department = 'Engineering';

-- Parentheses make intended logic explicit
SELECT name
FROM employees
WHERE (department = 'Analytics' OR department = 'Engineering')
  AND salary >= 50000;
```

`AND` has higher precedence than `OR`; use parentheses when mixing them to make mistakes less likely.

## 5. NULL — the trap every SQL learner should know

`NULL` means a value is missing or unknown; it is not the same as `0`, an empty string, or a literal `'NULL'`.

```sql
-- Correct: employees with unknown department
SELECT employee_id, name
FROM employees
WHERE department IS NULL;

-- Correct: employees with a known department
SELECT employee_id, name
FROM employees
WHERE department IS NOT NULL;

-- Incorrect way to test for NULL
-- WHERE department = NULL
```

SQL uses **three-valued logic** for comparisons: `TRUE`, `FALSE`, and `UNKNOWN`. `WHERE` only keeps rows where the condition evaluates to `TRUE`.

| Expression, when `department` is NULL | Result |
| --- | --- |
| `department = 'Sales'` | `UNKNOWN` |
| `department <> 'Sales'` | `UNKNOWN` |
| `department IS NULL` | `TRUE` |
| `department IS NOT NULL` | `FALSE` |

If you want people who are **not in Sales, including unknown departments**:

```sql
SELECT employee_id, name
FROM employees
WHERE department <> 'Sales'
   OR department IS NULL;
```

## 6. Try an example before LeetCode

Imagine an `employees` table:

| employee_id | name | department | salary |
| --- | --- | --- | --- |
| 1 | Mona | Analytics | 60000 |
| 2 | Omar | Sales | 45000 |
| 3 | Sara | NULL | 52000 |
| 4 | Ali | Engineering | 70000 |

**Challenge A:** return the names of employees earning at least 52,000, *including only those whose department is known*.

<details>
<summary>Show one possible answer (try first!)</summary>

```sql
SELECT name
FROM employees
WHERE salary >= 52000
  AND department IS NOT NULL;
```

**Expected names:** Mona, Ali.

</details>

**Challenge B:** return the names of employees who are not in Sales, *including people whose department is unknown*.

<details>
<summary>Show one possible answer (try first!)</summary>

```sql
SELECT name
FROM employees
WHERE department <> 'Sales'
   OR department IS NULL;
```

**Expected names:** Mona, Sara, Ali.

</details>

## 7. Practice: SELECT section of SQL 50

Follow the official problems in the study plan. These links go directly to each problem, so you can attempt them before checking any future solution.

| Problem | Main idea to practice | Link |
| --- | --- | --- |
| 1757 — Recyclable and Low Fat Products | `WHERE` + `AND` | [Try it](https://leetcode.com/problems/recyclable-and-low-fat-products/) |
| 584 — Find Customer Referee | `<>` and `IS NULL` | [Try it](https://leetcode.com/problems/find-customer-referee/) |
| 595 — Big Countries | `WHERE` + `OR` | [Try it](https://leetcode.com/problems/big-countries/) |
| 1148 — Article Views I | comparing two columns, `DISTINCT`, ordering | [Try it](https://leetcode.com/problems/article-views-i/) |
| 1683 — Invalid Tweets | string length filtering | [Try it](https://leetcode.com/problems/invalid-tweets/) |

The last two introduce **`DISTINCT`, `ORDER BY`, and string functions**. You can look them up as you reach those problems; we'll explore them through practice, rather than requiring you to memorize every function now.

### My approach when solving a SQL problem

1. **Identify the expected output**: which columns? any sorting requirement?
2. **Read the schema**: table names, column types, potential `NULL` values.
3. **Translate the requirements into predicates**: which rows are included and excluded?
4. **Write a readable query**, then test against examples and edge cases.
5. **Explain the logic in plain English** before calling it done.

## 8. Common mistakes to avoid

- Using `= NULL` instead of `IS NULL`.
- Forgetting that `<>` excludes `NULL` rows unless you explicitly include them.
- Mixing `AND` and `OR` without parentheses.
- Selecting extra columns when the output format is strict.
- Forgetting `DISTINCT` when the question asks for unique values.
- Assuming result rows have a guaranteed order without `ORDER BY`.

## 9. Quick self-check

Before moving to joins, check whether you can explain:

- What is the difference between `SELECT` and `WHERE`?
- Why doesn't `column <> 'x'` return `NULL` values?
- What happens when you combine `AND` and `OR` without parentheses?
- When do you need `DISTINCT` and `ORDER BY`?

**Key takeaway:** most early SQL problems are about translating English conditions accurately. Pay special attention to missing values and the exact required output.

**Next step:** solve [1757 — Recyclable and Low Fat Products](https://leetcode.com/problems/recyclable-and-low-fat-products/) yourself and document your tested solution using [`solution-template.sql`](../templates/solution-template.sql).

[← Back to roadmap](../README.md)
