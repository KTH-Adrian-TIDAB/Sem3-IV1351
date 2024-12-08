Updated for Sem5

Step 1: Run TableSchema.sql
Step 2: Run UpdatedDataScript.sql
Step 3: Run Task3queries.sql
Step 4: Run CopyingDataToHistorical.sql

------TEST QUERIES------
SELECT lesson_type, SUM(lesson_price) AS total_income
FROM historical_lessons
GROUP BY lesson_type;

SELECT COUNT(*) FROM historical_lessons WHERE lesson_type = 'individual';

SELECT COUNT(*) FROM historical_lessons WHERE lesson_type = 'group';

SELECT COUNT(*) FROM historical_lessons WHERE lesson_type = 'ensemble';
