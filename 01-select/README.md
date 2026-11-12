# Topic 01 — SELECT & Filtering

**Back to SQL | Relearning in Public**

> **Learning goal:** learn how to choose columns, filter rows, combine conditions, handle missing values, avoid duplicates, sort results, and filter text by length before attempting the first five SQL 50 problems.

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

## 6. Compare columns within the same row

Sometimes the condition compares **two columns**, rather than one column with a fixed value.

```sql
-- Find articles viewed by their own authors
SELECT author_id
FROM Views
WHERE author_id = viewer_id;
```

For each row, SQL checks whether the value of `author_id` equals the value of `viewer_id`. This is not a join: both columns are already in the same row of `Views`.

If either compared value is `NULL`, `=` evaluates to `UNKNOWN` rather than `TRUE`.

## 7. DISTINCT — remove duplicates from your result

`SELECT` does **not** remove duplicate result rows automatically. Use `DISTINCT` when the question asks for unique records or IDs.

Imagine a `Views` table with these rows:

| article_id | author_id | viewer_id |
| --- | --- | --- |
| 10 | 3 | 3 |
| 11 | 3 | 3 |
| 12 | 5 | 5 |
| 13 | 5 | 2 |

```sql
SELECT author_id
FROM Views
WHERE author_id = viewer_id;
-- Result values: 3, 3, 5

SELECT DISTINCT author_id
FROM Views
WHERE author_id = viewer_id;
-- Result values: 3, 5
```

**Important:** `DISTINCT` considers the *entire selected combination* of columns, not just the first column. For example, `SELECT DISTINCT author_id, article_id` keeps each unique `(author_id, article_id)` pair.

**When to use:** when the desired output explicitly requires unique rows or unique IDs. Avoid adding it automatically to every query.

## 8. AS — name result columns clearly

An alias renames a column **in the result**. It does not modify the original database table.

```sql
SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id;
```

This returns a column named `id`, as required by LeetCode problem 1148. In MySQL, `AS` is optional for a column alias, but writing it makes the intention clearer.

## 9. ORDER BY — control the result order

Without `ORDER BY`, SQL does **not** guarantee the order of returned rows, even if they appear sorted in a small test.

```sql
-- IDs from smallest to largest
SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id ASC;

-- IDs from largest to smallest
SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id DESC;
```

- `ASC` = ascending (smallest to largest / A to Z), and is the default.
- `DESC` = descending (largest to smallest / Z to A).
- You can sort by more than one expression, e.g. `ORDER BY department ASC, salary DESC`.
- You can sort by the selected alias (`id`) in this example.

**Remember:** `DISTINCT` controls uniqueness; `ORDER BY` controls presentation order. They solve different problems.

## 10. LENGTH() vs CHAR_LENGTH() — filter by text length

Text can be filtered by its length. In **MySQL**, these functions measure different things:

| Function | Measures | Example |
| --- | --- | --- |
| `LENGTH(text)` | Number of **bytes** | `LENGTH('ABC')` → `3` |
| `CHAR_LENGTH(text)` | Number of **characters** | `CHAR_LENGTH('ABC')` → `3` |

For non-ASCII text, such as Arabic, the results can differ depending on the character encoding. Under `utf8mb4`, for example, `LENGTH('ع')` is 2 bytes while `CHAR_LENGTH('ع')` is 1 character.

```sql
-- LeetCode 1683: content contains only English letters and spaces
SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) > 15;

-- General choice when requirements mean number of characters
SELECT tweet_id
FROM Tweets
WHERE CHAR_LENGTH(content) > 15;
```

In problem 1683, `LENGTH()` works because the problem restricts the contents to English letters and spaces, for which one character equals one byte. In multilingual datasets, prefer `CHAR_LENGTH()` if the requirement is about characters.

**Common pitfall:** don't assume `LENGTH()` is a character count in every dataset.

## 11. Try an example before LeetCode

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

## 12. Practice: SELECT section of SQL 50

Follow the official problems in the study plan. These links go directly to each problem, so you can attempt them before checking any future solution.

| Problem | Main idea to practice | Link |
| --- | --- | --- |
| 1757 — Recyclable and Low Fat Products | `WHERE` + `AND` | [Try it](https://leetcode.com/problems/recyclable-and-low-fat-products/) |
| 584 — Find Customer Referee | `<>` and `IS NULL` | [Try it](https://leetcode.com/problems/find-customer-referee/) |
| 595 — Big Countries | `WHERE` + `OR` | [Try it](https://leetcode.com/problems/big-countries/) |
| 1148 — Article Views I | comparing two columns, `DISTINCT`, ordering | [Try it](https://leetcode.com/problems/article-views-i/) |
| 1683 — Invalid Tweets | string length filtering | [Try it](https://leetcode.com/problems/invalid-tweets/) |

Before solving, review sections 6–10 for column comparison, `DISTINCT`, `AS`, `ORDER BY`, and string length functions. All of the core concepts needed for these five problems are covered above.

### My approach when solving a SQL problem

1. **Identify the expected output**: which columns? any sorting requirement?
2. **Read the schema**: table names, column types, potential `NULL` values.
3. **Translate the requirements into predicates**: which rows are included and excluded?
4. **Write a readable query**, then test against examples and edge cases.
5. **Explain the logic in plain English** before calling it done.

## 13. Extra mini-challenges

Use the examples and explanations above before checking these answers.

**Challenge C:** From `Views`, return the unique IDs of people who viewed their own articles, sorted from smallest to largest. Name the output column `id`.

<details>
<summary>Show a possible answer</summary>

```sql
SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id ASC;
```

**Why:** compare columns to find qualifying rows, use `DISTINCT` to remove repeats, `AS` for the expected output name, and `ORDER BY` for the required order.

</details>

**Challenge D:** From `Tweets`, return the IDs whose `content` is longer than 15 characters, even if the text includes Arabic.

<details>
<summary>Show a possible answer</summary>

```sql
SELECT tweet_id
FROM Tweets
WHERE CHAR_LENGTH(content) > 15;
```

**Why:** `CHAR_LENGTH()` counts characters rather than bytes.

</details>

## 14. Common mistakes to avoid

- Using `= NULL` instead of `IS NULL`.
- Forgetting that `<>` excludes `NULL` rows unless you explicitly include them.
- Mixing `AND` and `OR` without parentheses.
- Selecting extra columns when the output format is strict.
- Forgetting `DISTINCT` when the question asks for unique values.
- Assuming result rows have a guaranteed order without `ORDER BY`.
- Assuming `DISTINCT` applies only to the first selected column.
- Treating `LENGTH()` as character count for all languages.

## 15. Quick self-check

Before moving to joins, check whether you can explain:

- What is the difference between `SELECT` and `WHERE`?
- Why doesn't `column <> 'x'` return `NULL` values?
- What happens when you combine `AND` and `OR` without parentheses?
- When do you need `DISTINCT` and `ORDER BY`?

**Key takeaway:** most early SQL problems are about translating English conditions accurately. Pay special attention to missing values and the exact required output.

**Next step:** try the [five SELECT problems in LeetCode SQL 50](https://leetcode.com/studyplan/top-sql-50/) yourself before comparing with the explanations in this repository. Focus on the reasoning, not just the final query.

[← Back to roadmap](../README.md)
