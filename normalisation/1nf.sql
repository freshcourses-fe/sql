/*
  1 NF - по определению понятия отношение
*/
/* НЕ 1 NF*/
CREATE TABLE students(
  full_name text NOT NULL,
  phone text NOT NULL,
  specialty text,  
);
--
INSERT INTO students VALUES
('Test Testovich', '0894564684', 'IT'),
('Null 12345', '06378529379', 'IT'),
('Null 12345', '06378529379', 'IT'), -- BAD
('Multifunctional User', '015645454', 'IT, Music'), -- BAD
('Multifunctional User', '015645454',);
/*1 NF*/
CREATE TABLE students(
  id serial PRIMARY KEY,
  full_name text NOT NULL,
  phone text NOT NULL,
  specialty text
);
INSERT INTO students VALUES
('Test Testovich', '0894564684', 'IT'),
('Null 12345', '06378529379', 'IT'),
('Multifunctional User', '015645454', 'IT'), 
('Multifunctional User', '015645454', 'Music');
/* ALT 1 NF */
CREATE TABLE students(
  full_name text,
  phone text ,
  specialty text,
  PRIMARY KEY (full_name, phone, specialty)
);
INSERT INTO students VALUES
('Test Testovich', '0894564684', 'IT'),
('Null 12345', '06378529379', 'IT'),
('Multifunctional User', '015645454', 'IT'), 
('Multifunctional User', '015645454', 'Music');
