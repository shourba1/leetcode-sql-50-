/*
Problem: 584 - Find Customer Referee
Difficulty: Easy
Topic: 01 - SELECT & Filtering
Dialect: MySQL
Concepts: WHERE, OR, IS NULL, <>
Link: https://leetcode.com/problems/find-customer-referee/

Approach:
Return customer names when referee_id is not 2 or is missing.
The explicit IS NULL condition matters: NULL <> 2 evaluates to UNKNOWN, not TRUE.

Key takeaway:
When using <> in WHERE, NULL values are excluded unless handled explicitly.

Learning note: Review the reasoning before reading the SQL solution.
*/

SELECT name
FROM Customer
WHERE referee_id IS NULL
   OR referee_id <> 2;
