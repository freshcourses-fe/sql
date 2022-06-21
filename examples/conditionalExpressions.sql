/*
  Условные выражения
*/

SELECT * FROM users;

SELECT (
  CASE
    WHEN is_male  THEN 'Male' -- if
    WHEN is_male = false THEN 'Female' -- else if
    ELSE '?' -- else
  END
) as gender, count (*)
FROM users
GROUP BY gender;

SELECT (
  CASE is_male
    WHEN TRUE THEN 'Male'
    WHEN FALSE THEN 'Female'
    ELSE '?'
  END
) gender , * FROM users;
-- надо найти сезон рождения пользователя (осень, лето)
SELECT (
  CASE extract('month' from birthday)
    WHEN 1 THEN 'Зима'
    WHEN 2 THEN 'Зима'
    WHEN 3 THEN 'Весна'
    WHEN 4 THEN 'Весна'
    WHEN 5 THEN 'Весна'
    WHEN 6 THEN 'Лето'
    WHEN 7 THEN 'Лето'
    WHEN 8 THEN 'Лето'
    WHEN 9 THEN 'Осень'
    WHEN 10 THEN 'Осень'
    WHEN 11 THEN 'Осень'
    WHEN 12 THEN 'Зима'
    ELSE '404'
  END
) season_of_birth, * FROM users;
-- Отобразить все продукты, с новым столбиком - price_bracket
-- в нем всем товаром у которых цена выше средней цены товаров указать что они дорогие
-- остальным что они дешевые
SELECT (CASE 
  WHEN price > (SELECT avg(price) FROM products) THEN 'дорогой'
  WHEN price <= (SELECT avg(price) FROM products) THEN 'дешевый'
END
) bracket, * from products;
-- v2
SELECT (
  CASE price > (SELECT avg(price) FROM products)
  WHEN TRUE THEN 'дорогой'
  ELSE 'дешевый'
  END
) bracket, * from products;
-- 12230.410000000000
SELECT count(*) 
from products
WHERE price > 12230.410000000000;
--
SELECT sum(
  CASE
  WHEN price > 12230.410000000000 THEN 1
  else 0
END
) amount from products;
-- COALESCE возвращает первое не NULL значение
SELECT COALESCE(NULL , 42);

ALTER TABLE products ADD COLUMN "description" TEXT;

SELECT name, brand, COALESCE("description", 'Default product description') as "description" 
FROM products;
-- NULLIF возращаетн NULL если оба значения одинакові, иначе возвращает 1 из них

SELECT NULLIF(12, 15); -- 12

SELECT NULLIF('test','test'); -- NULL
SELECT NULLIF(NULL, NULL); -- NULL
SELECT name, brand, NULLIF("description", 'Default product description') as "description" 
FROM products;

SELECT GREATEST(5,8,30,99,-100); -- 99
SELECT LEAST(5,8,30,99,-100); -- -100