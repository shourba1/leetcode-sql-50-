# Back to SQL — Relearning in Public 🧠

**A SQL refresher, a problem-solving journal, and a free learning resource.**

[![Study Plan](https://img.shields.io/badge/LeetCode-SQL%2050-orange)](https://leetcode.com/studyplan/top-sql-50/)
![Dialect](https://img.shields.io/badge/SQL-MySQL-blue)
![Documented](https://img.shields.io/badge/Documented-5%2F50-teal)

## Why this repository exists

After graduating, I took a break from studying and problem-solving. When I came back, I realized that some concepts I had practiced before needed a refresh.

Instead of revisiting my old SQL problems privately, I decided to **relearn in public**: review each topic, solve the problems again, explain my reasoning, and share useful takeaways with anyone learning SQL or preparing for interviews.

This is **not a claim of expertise** and not just a collection of answers. It's a documented learning journey. I aim to make the explanations useful even if you're opening SQL for the first time.

> **The goal:** understand the idea → attempt the problem → explain the approach → share what I learned.

## Progress

**5 / 50 solutions documented** (10%)  
**1 / 50 confirmed Accepted** (other submissions still to be verified)

`██░░░░░░░░░░░░░░░░░░` **10% documented**

*Documented means the query and its reasoning have been reviewed here; Accepted is marked only after LeetCode submission is confirmed.*

## Learning roadmap

| # | Topic | Study guide | Solutions |
| --- | --- | --- | --- |
| 01 | SELECT and filtering | [Start here](./01-select/README.md) | [5 solutions](./01-select/) |
| 02 | Basic Joins | Coming soon | Coming soon |
| 03 | Basic Aggregate Functions | Coming soon | Coming soon |
| 04 | Sorting and Grouping | Coming soon | Coming soon |
| 05 | Advanced Select and Joins | Coming soon | Coming soon |
| 06 | Subqueries | Coming soon | Coming soon |
| 07 | Advanced String Functions / Regex / Clause | Coming soon | Coming soon |

The folder organization follows the topics in the [LeetCode SQL 50 study plan](https://leetcode.com/studyplan/top-sql-50/). Topics will be documented progressively rather than all at once.

## How to study with this repository

1. **Read the topic guide** for a quick conceptual refresh and hands-on examples.
2. **Try the linked LeetCode problem on your own** before opening the solution.
3. **Compare approaches**, not just final queries: which rows are kept, why each condition works, and what edge cases matter.
4. **Review the takeaway** and revisit mistakes after a few days.
5. **Practice variations** by changing conditions or test data.

Each solution includes the problem link, difficulty, concepts, the MySQL query, a short approach, and a takeaway. Solutions marked **Accepted** have confirmed LeetCode submission results.

## Solved problems

| Problem | Topic | Difficulty | Explanation & SQL |
| --- | --- | --- | --- |
| [1757 — Recyclable and Low Fat Products](https://leetcode.com/problems/recyclable-and-low-fat-products/) | SELECT & Filtering | Easy | [SQL & explanation](./01-select/1757-recyclable-and-low-fat-products.sql) |
| [584 — Find Customer Referee](https://leetcode.com/problems/find-customer-referee/) | SELECT & Filtering | Easy | [SQL & explanation](./01-select/584-find-customer-referee.sql) |
| [595 — Big Countries](https://leetcode.com/problems/big-countries/) | SELECT & Filtering | Easy | [SQL & explanation](./01-select/595-big-countries.sql) |
| [1148 — Article Views I](https://leetcode.com/problems/article-views-i/) | SELECT & Filtering | Easy | [SQL & explanation](./01-select/1148-article-views-i.sql) |
| [1683 — Invalid Tweets](https://leetcode.com/problems/invalid-tweets/) | SELECT & Filtering | Easy | [SQL & explanation](./01-select/1683-invalid-tweets.sql) |

## What you'll find here

- **Topic guides:** approachable explanations and original examples.
- **Problem solutions:** readable, tested SQL with reasoning.
- **Learning notes:** mistakes, tricky cases, and practical mental models.
- **LinkedIn series:** short posts with key insights and links back to the full guides.

## Tech & conventions

- **SQL dialect:** MySQL (the LeetCode problems will be solved in MySQL).
- **Code style:** clear SQL keywords, meaningful formatting, and comments where useful.
- **Language:** English for GitHub documentation; Egyptian Arabic + English technical terms for LinkedIn posts.
- **Problem references:** links to original LeetCode questions; no copied problem statements or editorial solutions.

## Follow the journey

**Series:** *Back to SQL | Relearning in Public*

**LinkedIn:** [Launch post](https://lnkd.in/p/deAkskp9)

I plan to share topic explainers, problem breakdowns, and quick SQL insights. The repository is the long-form reference; the posts are a friendly starting point for discussion.

## Repo structure

```text
leetcode-sql-50/
├── README.md
├── 01-select/
│   ├── README.md
│   ├── 1757-recyclable-and-low-fat-products.sql
│   ├── 584-find-customer-referee.sql
│   ├── 595-big-countries.sql
│   ├── 1148-article-views-i.sql
│   └── 1683-invalid-tweets.sql
├── 02-basic-joins/
├── 03-basic-aggregate-functions/
├── 04-sorting-and-grouping/
├── 05-advanced-select-and-joins/
├── 06-subqueries/
└── 07-advanced-string-functions-regex-clause/
```

**Want to practice together?** Start with the [SELECT topic guide](./01-select/README.md), try its exercises, and share what you found tricky.

---

*Independent educational project; not affiliated with LeetCode. Problem titles and URLs are used for identification only.*
