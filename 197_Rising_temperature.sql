# NOTE :- In this context, it's important to note that the table names used in the examples include underscores and numbers, 
# which differ from the naming conventions used in the LeetCode problem.

Create table If Not Exists Weather_6
(
id int, 
recordDate date, 
temperature int
);

Truncate table Weather_6;

insert into Weather_6 (id, recordDate, temperature) values ('1', '2015-01-01', '10');
insert into Weather_6 (id, recordDate, temperature) values ('2', '2015-01-02', '25');
insert into Weather_6 (id, recordDate, temperature) values ('3', '2015-01-03', '20');
insert into Weather_6 (id, recordDate, temperature) values ('4', '2015-01-04', '30');

/**
Q. Write an SQL query to find all dates' Id with higher temperatures compared to its previous dates (yesterday).
Return the result table in any order.

Input: 
Weather table:
+----+------------+-------------+
| id | recordDate | temperature |
+----+------------+-------------+
| 1  | 2015-01-01 | 10          |
| 2  | 2015-01-02 | 25          |
| 3  | 2015-01-03 | 20          |
| 4  | 2015-01-04 | 30          |
+----+------------+-------------+
Output: 
+----+
| id |
+----+
| 2  |
| 4  |
+----+
Explanation: 
In 2015-01-02, the temperature was higher than the previous day (10 -> 25).
In 2015-01-04, the temperature was higher than the previous day (20 -> 30).

**/

SELECT * FROM Weather_6;

# Type 1 
SELECT w2.id
FROM Weather_6 AS w1
JOIN Weather_6 AS w2
ON w2.temperature > w1.temperature
AND DATEDIFF(w2.recordDate,w1.recordDate)=1;

# Type 2
SELECT w2.id 
FROM Weather_6 w1 
JOIN Weather_6 w2 
ON w2.recordDate = DATE_ADD(w1.recordDate, INTERVAL 1 DAY)
WHERE w2.temperature > w1.temperature

