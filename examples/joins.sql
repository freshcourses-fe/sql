-- Нееєффективный JOIN - декартово произведение с фильтрацией по общим данным
SELECT employee."employee_id", "name", "password", created_at 
from employee, employee_passwords
WHERE employee."employee_id" = employee_passwords."employee_id";
--  JOIN
SELECT employee."employee_id", "name", "password", created_at
FROM employee
JOIN employee_passwords ON employee."employee_id" = employee_passwords."employee_id";
-- перестановка таблиц не играет роли для обычного JOIN
SELECT employee."employee_id", "name", "password", created_at
FROM employee_passwords
JOIN employee ON employee."employee_id" = employee_passwords."employee_id";
--
SELECT *
FROM products
JOIN products_to_orders AS pto ON products.id = pto.product_id
JOIN orders ON pto.order_id = orders.id
WHERE orders.id = 1;
-- INNER JOIN - обычный JOIN
SELECT orders.id
FROM products
JOIN products_to_orders AS pto ON products.id = pto.product_id
JOIN orders ON pto.order_id = orders.id
WHERE products.category = 'Food'
GROUP BY orders.id;
-- LEFT JOIN - INNER JOIN к которому потом добавляются все результаты из таблицы ДО JOINа
-- и при ненахождеии им соответствия в другой таблице в её столбцы занесется NULL
SELECT users.*, sellers.*
FROM users
LEFT JOIN sellers ON users.id = sellers.user_id;
-- RIGTH JOIN - INNER JOIN к которому потом добавляются все результаты из таблицы ПОСЛЕ JOINа
-- и при ненахождеии им соответствия в другой таблице в её столбцы занесется NULL
SELECT users.*, sellers.*
FROM sellers
RIGHT JOIN users ON sellers.user_id =  users.id;
-- FULL JOIN - INNER JOIN к торорому потом применяются сначала LEFT JOIN а потом RIGTH JOIN
SELECT *
FROM sellers
FULL JOIN users ON users.id = sellers.user_id;