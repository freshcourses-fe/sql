-- DQL - data query language
SELECT *
FROM users;
-- все пользователи
SELECT email
FROM users;
-- емейлы всех пользователей
SELECT *
FROM users
WHERE id % 2 = 0;
-- всех пользователей с четным айди
SELECT *
FROM users
WHERE CAST(id ^ 3 AS numeric) % 3 = 0;
-- все юзеры, айдишники которых в кубе кратны трем
SELECT id,
  first_name AS "Name",
  email
FROM users AS u;
SELECT id,
  first_name "Name",
  email
FROM users u;
--
SELECT *
FROM users
WHERE 100 <= id
  AND id <= 105;
SELECT *
FROM users
WHERE id BETWEEN 101 AND 105;
SELECT *
FROM users
WHERE id BETWEEN SYMMETRIC 105 AND 101;
SELECT *
FROM users
WHERE id IN (101, 102, 103, 104, 105);
--
SELECT *
FROM users
WHERE first_name IN ('John', 'Jane');
-- найти всех юзеров которые ниже 1.80
SELECT *
FROM users
WHERE height <= 1.8;
-- найти все пользоваталей которым меньше 18 лет
-- SELECT * FROM users WHERE '1991-1-1' <= birthday;
SELECT *,
  extract (
    year
    FROM age(birthday)
  ) as "Лет прожито"
FROM users
WHERE age(birthday) <= INTERVAL '30 years 10 months';
SELECT height
FROM users
GROUP BY height;
SELECT is_male
FROM users
GROUP BY is_male;
SELECT category
FROM products
GROUP BY category;
SELECT *
FROM users
WHERE is_male = true
  /*
   Агрегатные функции
   avg - среднее арифметическое
   sum - сумму
   count - количество строк
   min - инимальное значение
   max - максимальное значение
   */
  -- найти средний рост в зависмотсти от пола
SELECT avg(height) "Средняя высота",
  is_male
FROM users
GROUP BY is_male;
SELECT count(id)
from users;
/*
 в табличке товаров найти:
 среднюю цену всех товаров
 количество товаров с категорией Hardware
 общую стоимость всех товаров (с учетом их количества)
 */
SELECT avg(price)
FROM products;
--
SELECT count(*)
FROM products
WHERE category = 'Hardware';
--
SELECT sum(price * quantity)
FROM products;
-- Пагинация запросов
SELECT *
FROM products
LIMIT 30;
-- Показываем первые 30 результатов
--
SELECT *
FROM products
LIMIT 30 OFFSET 30;
-- Пропускаем 30 и показываем 30 следующих
--
SELECT id,
  first_name || ' ' || last_name AS "Full name"
FROM users;
SELECT id,
  concat(first_name, ' ', last_name) AS "Full name"
FROM users;
-- Найти юзеров с (Именем + фамилией) длиной в 17 символов
-- char_length
SELECT id,
  concat(first_name, ' ', last_name) AS "Full name",
  char_length(concat(first_name, last_name)) AS "full name length"
FROM users
WHERE char_length(concat(first_name, last_name)) = 17;
--
SELECT *
FROM (
    SELECT concat(first_name, ' ', last_name) AS "full name",
      char_length(concat(first_name, last_name)) AS "full name length",
      *
    FROM users
  ) AS full_names_table
WHERE "full name length" = 17;
/*
  Сортировка столбцов
  ORDER BY [ ASC | DESC]
*/
SELECT * FROM users
ORDER BY id DESC;
--
SELECT * FROM users
ORDER BY height DESC,-- в первую очередь
birthday ASC -- во вторую
;