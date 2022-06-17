/*
  1. просмотреть все товары в конкретном заказе
  2. стоимость каждого совершенного заказа
  3. колво купленных товаров (пять Food + 4 Food итого 9) 
  определенной категории ('Food') в конкретном заказе (в 5)
  4. колво заказов каждого юзера и его емейл
*/
--1
SELECT products.* FROM products
JOIN products_to_orders pto ON pto.product_id = products.id
WHERE pto.order_id = 1;
-- 2
SELECT order_id, sum(p.price * pto.quantity) FROM products_to_orders pto
JOIN products p ON p.id = pto.product_id
GROUP BY order_id;
-- 3
SELECT sum(pto.quantity) FROM products
JOIN products_to_orders pto ON pto.product_id = products.id
WHERE category = 'Food' AND pto.order_id = 5;
-- 4 
SELECT users.email, count(orders.id) FROM users
JOIN orders ON orders.buyer_id = users.id
GROUP BY users.id
ORDER BY count(orders.id) DESC;
/*
  найти самый популярный товар (вівести имя и категорию) (который есть в большем количестве заказов)
*/

/*
  пользователей и колво уникальных товаров ими купленных (через подзапросы)
  1. нужен запрос в котором у нас не будут повторятся товары и в котором будет инфа про пользователей
  2. на основании этой таблицы можно будет посшчить скоько за пользоватеем занято строк что и будет ответом
 ** все заказы со стоимостью чека выше среднего (через подзапросы) + лучше разбить на подзадачи и выполнять их по очереди
  1. найти стоиомтсь всех заказови айди заказа
  2. на основании запроса 1 найти среднюю стоимость
  3. на основаннии 1 написать селект и из него отфильтравать строки в которых сумма заказа меньше 2
*/