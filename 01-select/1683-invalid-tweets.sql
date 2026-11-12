/*
Problem: 1683 - Invalid Tweets
Difficulty: Easy
Topic: 01 - SELECT & Filtering
Dialect: MySQL
Concepts: WHERE, LENGTH
Link: https://leetcode.com/problems/invalid-tweets/

Approach:
The task is to return tweet IDs whose content is longer than 15.
LENGTH() works for the problem's stated English-letter content.
For general multilingual text, CHAR_LENGTH() counts characters whereas LENGTH() counts bytes.

Key takeaway:
Know whether the requirement is character count or byte count.

Learning note: Review the reasoning before reading the SQL solution.
*/

SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) > 15;
