-- DQL - data query language

SELECT * FROM users; -- все пользователи

SELECT email FROM users; -- емейлы всех пользователей


SELECT * FROM users
WHERE id % 2 = 0 ; -- всех пользователей с четным айди

SELECT * FROM users
WHERE CAST(id^3 AS numeric) % 3 = 0 ; -- все юзеры, айдишники которых в кубе кратны трем

SELECT id, first_name AS "Name", email FROM users AS u;
SELECT id, first_name "Name", email FROM users u;
--
SELECT * FROM users
WHERE 100 <= id AND id <= 105;

SELECT * FROM users
WHERE id BETWEEN 101 AND 105;

SELECT * FROM users
WHERE id BETWEEN SYMMETRIC 105 AND 101;

SELECT * FROM users
WHERE id IN (101,102,103,104,105);
--
SELECT * FROM users
WHERE first_name IN ('John', 'Jane');

-- найти всех юзеров которые ниже 1.80

-- найти все пользоваталей которым меньше 30 лет