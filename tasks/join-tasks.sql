/*
 1. просмотреть все товары в конкретном заказе
 2. стоимость каждого совершенного заказа
 3. колво купленных товаров (пять Food + 4 Food итого 9) 
 определенной категории ('Food') в конкретном заказе (в 5)
 4. колво заказов каждого юзера и его емейл
 */
--1
SELECT products.*
FROM products
  JOIN products_to_orders pto ON pto.product_id = products.id
WHERE pto.order_id = 1;
-- 2
SELECT order_id,
  sum(p.price * pto.quantity)
FROM products_to_orders pto
  JOIN products p ON p.id = pto.product_id
GROUP BY order_id;
-- 3
SELECT sum(pto.quantity)
FROM products
  JOIN products_to_orders pto ON pto.product_id = products.id
WHERE category = 'Food'
  AND pto.order_id = 5;
-- 4 
SELECT users.email,
  count(orders.id)
FROM users
  JOIN orders ON orders.buyer_id = users.id
GROUP BY users.id
ORDER BY count(orders.id) DESC;
/*
 найти самый популярный товар (вывести имя и категорию) (который есть в большем количестве заказов)
 */
SELECT count(products.id) as unique_buys,
  products.*
FROM products
  JOIN products_to_orders pto ON pto.product_id = products.id
GROUP BY products.id
ORDER BY unique_buys DESC
LIMIT 10;
/*
 6. пользователей и колво уникальных товаров ими купленных (через подзапросы)
 1. нужен запрос в котором у нас не будут повторятся товары и в котором будет инфа про пользователей
 2. на основании этой таблицы можно будет посшчить скоько за пользоватеем занято строк что и будет ответом
 7.** все заказы со стоимостью чека выше среднего (через подзапросы) + лучше разбить на подзадачи и выполнять их по очереди
 1. найти стоимость всех заказов и айди заказа
 2. на основании запроса 1 найти среднюю стоимость
 3. на основании 1 написать селект и из него отфильтровать строки в которых сумма заказа меньше 2
 */
-- 6 step 1
SELECT orders.buyer_id,
  products.id
FROM orders
  JOIN products_to_orders ON products_to_orders.order_id = orders.id
  JOIN products ON products.id = products_to_orders.product_id
GROUP BY orders.buyer_id,
  products.id;
-- 6 step 2
SELECT buyer_id,
  count(users_id_products_id.id)
FROM (
    SELECT orders.buyer_id,
      products.id
    FROM orders
      JOIN products_to_orders ON products_to_orders.order_id = orders.id
      JOIN products ON products.id = products_to_orders.product_id
    GROUP BY orders.buyer_id,
      products.id
  ) as users_id_products_id
GROUP BY buyer_id;
-- 7 step 1
SELECT order_id,
  sum(p.price * pto.quantity) total
FROM products_to_orders pto
  JOIN products p ON p.id = pto.product_id
GROUP BY order_id;
-- step 2
SELECT avg(total)
FROM (
    SELECT order_id,
      sum(p.price * pto.quantity) total
    FROM products_to_orders pto
      JOIN products p ON p.id = pto.product_id
    GROUP BY order_id
  ) "avg_price";
-- 7841990.500000000000	
-- step 3
SELECT *
FROM (
    SELECT order_id,
      sum(p.price * pto.quantity) total
    FROM products_to_orders pto
      JOIN products p ON p.id = pto.product_id
    GROUP BY order_id
  ) as order_with_total_price
WHERE total > (
    SELECT avg(total)
    FROM (
        SELECT order_id,
          sum(p.price * pto.quantity) total
        FROM products_to_orders pto
          JOIN products p ON p.id = pto.product_id
        GROUP BY order_id
      ) avg_price
  )
ORDER BY total ASC;
-- WITH version
WITH order_with_total_price AS (
  SELECT order_id,
    sum(p.price * pto.quantity) total
  FROM products_to_orders pto
  JOIN products p ON p.id = pto.product_id
  GROUP BY order_id
),
avg_price AS (
  SELECT avg(total)
  FROM order_with_total_price
)
SELECT * FROM order_with_total_price 
WHERE total > (SELECT * FROM avg_price);