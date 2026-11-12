
/*
Problem: 1757 - Recyclable and Low Fat Products
Difficulty: Easy
Topic: SELECT & Filtering
Concepts: SELECT, WHERE, AND
Database: MySQL

Problem Link:
https://leetcode.com/problems/recyclable-and-low-fat-products/

--------------------------------------------------
Approach:
--------------------------------------------------
1. We need to return only the product_id column.

2. The data comes from the Products table.

3. We filter products using two conditions:
   - low_fats = 'Y'
   - recyclable = 'Y'

4. We use AND because both conditions
   must be satisfied.

--------------------------------------------------
Key Takeaway:
--------------------------------------------------
WHERE filters rows based on conditions.

AND ensures that all specified conditions
must be TRUE for a row to appear in the result.
*/

SELECT product_id
FROM Products
WHERE low_fats = 'Y'
  AND recyclable = 'Y';
