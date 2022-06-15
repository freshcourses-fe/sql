CREATE TABLE employees (
  id serial PRIMARY KEY, -- ограничение первичного ключа
  email varchar(256) NOT NULL UNIQUE, -- нельзя заносить NULL, все записи должны быть уникальными
  salary numeric(9,2) NOT NULL CHECK (salary > 6500) -- общая проверка, значения внутри скобочек должны быть истинны 

);
--
INSERT INTO employees (email, salary)
VALUES ('mail1@test.test', 10000),
('mail2@test.test', 12000);
--
ALTER TABLE employees
ADD COLUMN created_at timestamp 
NOT NULL DEFAULT current_date CHECK ( age(created_at) < interval '10 years' AND created_at <= current_date);
--
ALTER TABLE employees DROP COLUMN created_at;
--
ALTER TABLE employees ADD CONSTRAINT "max_salary" CHECK (salary < 300000 AND email != 'ivan@anton.pavel');
--
ALTER TABLE employees ALTER COLUMN email SET NOT NULL;
--
ALTER TABLE employees ALTER COLUMN email DROP NOT NULL;
--
ALTER TABLE employees DROP CONSTRAINT "max_salary";