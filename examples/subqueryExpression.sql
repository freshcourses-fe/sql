/*
  Выражения подзапросов

  IN, NOT IN,
  SOME, ANY,
  EXSISTS,
  ALL
*/
-- Все юзеры НЕ сделавшие заказ NOT IN
SELECT *
FROM users
WHERE id NOT IN (SELECT buyer_id FROM orders);
-- IN
SELECT * FROM products
WHERE id IN (SELECT product_id FROM products_to_orders);
-- ANY / SOME
SELECT *
FROM products
WHERE id = ANY (SELECT product_id FROM products_to_orders );
-- EXISTS
SELECT *
FROM users
WHERE EXISTS (SELECT * FROM orders WHERE orders.buyer_id = users.id );
--
SELECT buyer_id FROM orders
GROUP BY buyer_id;
-- ALL
-- все не продавцы
SELECT *
FROM users
WHERE id != ALL (SELECT user_id FROM sellers);