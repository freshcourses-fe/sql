-- Найти рост самого высокого мужчины
-- v1 aggregation
SELECT max(height) FROM users
WHERE is_male;
-- v1.5
SELECT max(height), is_male FROM users
GROUP BY is_male;
-- v2 SORT + LIMIT
SELECT height
FROM users
WHERE is_male = true
ORDER BY height DESC
LIMIT 1;
-- Найти самого высокого мужчину
SELECT *
FROM users
WHERE is_male = true
ORDER BY height DESC,
birthday ASC
LIMIT 10;