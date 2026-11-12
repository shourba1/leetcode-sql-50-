/*
Problem: 1757 - Recyclable and Low Fat Products
Difficulty: Easy
Topic: 01 - SELECT & Filtering
Dialect: MySQL
Concepts: SELECT, WHERE, AND
Link: https://leetcode.com/problems/recyclable-and-low-fat-products/

Approach:
We need product IDs for rows where both flags equal 'Y'.
AND is required because satisfying only one flag is not enough.

Key takeaway:
A row passes WHERE only if both conditions evaluate to TRUE.

Learning note: Review the reasoning before reading the SQL solution.
*/

SELECT product_id
FROM Products
WHERE low_fats = 'Y'
  AND recyclable = 'Y';
