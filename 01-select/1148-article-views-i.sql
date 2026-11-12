/*
Problem: 1148 - Article Views I
Difficulty: Easy
Topic: 01 - SELECT & Filtering
Dialect: MySQL
Concepts: WHERE, DISTINCT, AS, ORDER BY
Link: https://leetcode.com/problems/article-views-i/

Approach:
An author viewed their own article when author_id equals viewer_id.
DISTINCT avoids returning the same author more than once.
AS id gives the output its required name; ORDER BY produces ascending IDs.

Key takeaway:
Compare columns within a row; use DISTINCT for unique results and ORDER BY when sorting is required.

Learning note: Review the reasoning before reading the SQL solution.
*/

SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY author_id;
