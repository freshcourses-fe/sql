-- sellers_data.*
SELECT orders.id as order_id,
  users.first_name,
  users.last_name,
  sum(products.price * products_to_orders.quantity) as "Total price",
  seller_data.*
FROM users
  JOIN orders ON orders.buyer_id = users.id
  JOIN products_to_orders ON products_to_orders.order_id = orders.id
  JOIN products ON products.id = products_to_orders.product_id
  JOIN sellers on products.seller_id = sellers.id
  JOIN users seller_data on sellers.user_id = seller_data.id
GROUP BY orders.id,
  users.id,
  seller_data.id;
/*
 JOIN (
 SELECT users.first_name as seller_name,
 users.last_name as seller_last_name,
 users.id
 from users
 JOIN sellers ON sellers.user_id = users.id
 JOIN orders ON orders.buyer_id = users.id
 JOIN products_to_orders ON products_to_orders.order_id = orders.id
 JOIN products ON products.id = products_to_orders.product_id
 ) as sellers_data ON users.id = sellers_data.id;
 */
--айди заказа, ФИО покупателя и продавца тоавра и имя товара
WITH sellers_data AS (
  SELECT concat(users.first_name, ' ', users.last_name) as seller_name,
    users.id as seller_id,
    products.id as product_id
  FROM users
    JOIN sellers on sellers.user_id = users.id
    JOIN products on products.seller_id = sellers.id
)
SELECT orders.id as order_id,
  users.first_name,
  users.last_name,
  sellers_data.seller_name
FROM users
  JOIN orders ON orders.buyer_id = users.id
  JOIN products_to_orders ON products_to_orders.order_id = orders.id
  JOIN products ON products.id = products_to_orders.product_id
  JOIN sellers_data on sellers_data.product_id = products.id;
--
