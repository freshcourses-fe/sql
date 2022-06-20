/*
 3 NF 
 Отношение находится во второй нормальной форме
 Ни один неключевой атрибут отношения не находится в транзитивной функциональной зависимости от потенциального ключа отношения.
 
 A -> id
 C -> id
 C -> A -- bad
 
 C -> A -> id
 */
/* NOT 3 NF*/
CREATE TABLE students (
  id serial PRIMARY KEY,
  full_name text,
  kafedra text,
  kafedra_phone text
);
INSERT INTO students (full_name, kafedra, kafedra_phone)
VALUES ('1 1', 'IT', '123443543'),
  ('2 2', 'IT', '321321321');
/* 3 NF */
CREATE TABLES kafedras (
  "name" text PRIMARY KEY,
  kafedra_phone text
);
CREATE TABLE students (
  id serial PRIMARY KEY,
  full_name text,
  kafedra text REFERENCES kafedras
);
INSERT INTO kafedras
VALUES ('IT', '12354364'),
  ('Music', '212342342304232'),
  ('Math', '21321461781254321');
--
INSERT INTO students (full_name, kafedra, kafedra_phone)
VALUES ('1 1', 'IT'),
  ('2 2', 'IT');