SELECT
  users.*
FROM
  users
  JOIN orders ON orders.buyer_id = users.id
GROUP BY
  users.id;

-- + сумма всех покупок
SELECT
  sum(products.price * pto.quantity) total_sum,
  users.*
FROM
  users
  JOIN orders ON orders.buyer_id = users.id
  JOIN products_to_orders pto ON pto.order_id = orders.id
  JOIN products ON products.id = pto.product_id
GROUP BY
  users.id;

-- сколько в всреднем пользователи потратились
SELECT
  avg(results.total_sum)
FROM (
  SELECT
    sum(products.price * pto.quantity) total_sum,
    users.*
  FROM
    users
    JOIN orders ON orders.buyer_id = users.id
    JOIN products_to_orders pto ON pto.order_id = orders.id
    JOIN products ON products.id = pto.product_id
  GROUP BY
    users.id) results;

--
SELECT
  average.*,
  sum(products.price * pto.quantity) total_sum,
  users.*
FROM
  users
  JOIN orders ON orders.buyer_id = users.id
  JOIN products_to_orders pto ON pto.order_id = orders.id
  JOIN products ON products.id = pto.product_id
  CROSS JOIN (
    SELECT
      avg(results.total_sum) average_spent_on_orders
    FROM (
      SELECT
        sum(products.price * pto.quantity) total_sum,
        users.*
      FROM
        users
        JOIN orders ON orders.buyer_id = users.id
        JOIN products_to_orders pto ON pto.order_id = orders.id
        JOIN products ON products.id = pto.product_id
      GROUP BY
        users.id) results) average
GROUP BY
  users.id,
  average.average_spent_on_orders
  /*
   Оконные функции
   */
  SELECT
    sum(products.price * pto.quantity) total_sum,
  avg(sum(products.price * pto.quantity)) OVER () average_sum,
    users.*
  FROM
    users
    JOIN orders ON orders.buyer_id = users.id
    JOIN products_to_orders pto ON pto.order_id = orders.id
    JOIN products ON products.id = pto.product_id
  GROUP BY
    users.id;

--
SELECT
  id,
  "name",
  category,
  brand,
  price,
  quantity,
  sum(price * quantity) OVER () total_price_of_all,
  sum(price * quantity) OVER (PARTITION BY id) total_price-- замена GROUP BY
FROM
  products
;

SELECT
  id,
  "name",
  category,
  brand,
  price,
  quantity,
  sum(price * quantity) OVER () total_price_of_all,
  sum(price * quantity),
  avg(price) OVER () average_price
FROM
  products
GROUP BY
  id
ORDER BY
  id;


-- вывести инфу про пользователей и количесто их заказов с помощью оконной функции
-- найдите самого активного покупателя
SELECT users.*, count(orders) OVER (PARTITION BY users.id)  total_orders
FROM users
JOIN orders ON orders.buyer_id = users.id
ORDER BY total_orders DESC;