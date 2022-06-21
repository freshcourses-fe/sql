CREATE VIEW orders_with_price AS 
SELECT orders.id "Order id", users.id "User id", sum(price * pto.quantity) "Total price"
FROM users
JOIN orders ON orders.buyer_id = users.id
JOIN products_to_orders pto ON pto.order_id = orders.id
JOIN products ON products.id = pto.product_id
GROUP BY orders.id, users.id;

DROP VIEW orders_with_price;
--
-- Надо общую сумму покупок пользователей
SELECT sum("Total price") "Total user spending" FROM orders_with_price;
-- MATERIALIZED
CREATE MATERIALIZED VIEW orders_with_price_m AS 
SELECT orders.id "Order id", users.id "User id", sum(price * pto.quantity) "Total price"
FROM users
JOIN orders ON orders.buyer_id = users.id
JOIN products_to_orders pto ON pto.order_id = orders.id
JOIN products ON products.id = pto.product_id
GROUP BY orders.id, users.id
WITH DATA; -- говорим что надо заполнить материализованные данные

REFRESH MATERIALIZED VIEW orders_with_price_m; -- пока вы обновляетесь то к таблицам не постучатся
REFRESH MATERIALIZED VIEW CONCURRENTLY orders_with_price_m; -- а тут можно