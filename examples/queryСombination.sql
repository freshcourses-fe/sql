CREATE TABLE employee (
  employee_id int,
  "name" text,
);

ALTER TABLE employee ADD COLUMN created_at timestamp default current_timestamp;

CREATE TABLE employee_passwords(
  employee_id int,
  "password" text
);

INSERT INTO employee (employee_id, "name")
VALUES (1, 'JOHN'),
(2, 'Jane'),
(3, 'Jack'),
(4, 'Joe');

INSERT INTO employee_passwords (employee_id, "password")
VALUES (8, 'admin'),
(5, '12345'),
(9, 'hdoufgd^(dfd213FKJS#');
--
SELECT * FROM employee;
--
SELECT * FROM employee_passwords;
--
SELECT * FROM employee, employee_passwords;
-- ОБЬЕДИНЕНИЕ - все значения в обоих запросах
SELECT employee_id FROM employee
UNION
SELECT employee_id FROM employee_passwords;
-- ПЕРЕСЕЧЕНИЕ - общие значения в обоих запросах
SELECT employee_id FROM employee
INTERSECT
SELECT employee_id FROM employee_passwords;
-- ВЫЧИТАНИЕ - все результаты из перовго запроса которых нет во втором
SELECT employee_id FROM employee
EXCEPT
SELECT employee_id FROM employee_passwords;
/*
 Найти id всех юзеров которые НЕ являются продавцами
*/
SELECT id FROM users
EXCEPT
SELECT user_id FROM sellers;
/*
 найдите id всех юзеров которые выполнили хоть один заказ
*/
SELECT id FROM users
INTERSECT
SELECT buyer_id FROM orders;