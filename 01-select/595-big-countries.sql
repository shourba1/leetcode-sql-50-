/*
Problem: 595 - Big Countries
Difficulty: Easy
Topic: 01 - SELECT & Filtering
Dialect: MySQL
Concepts: WHERE, OR, >=
Link: https://leetcode.com/problems/big-countries/

Approach:
Return the required columns for countries meeting either size threshold.
OR includes a country if its area or its population meets the cutoff (or both).

Key takeaway:
OR means at least one condition must be TRUE; >= includes the boundary.

Learning note: Review the reasoning before reading the SQL solution.
*/

SELECT name, population, area
FROM World
WHERE area >= 3000000
   OR population >= 25000000;
