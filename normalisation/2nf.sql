/*
 2 NF 
 1 NF + любой его атрибут, не входящий в состав потенциального ключа, функционально полно зависит от каждого потенциального ключа
 
 |Если ваш ключ НЕ составной то достаточно быть в 1 NF  чтобы быть во 2 NF 
 */
/* без 2 NF */
DROP TABLE students;
CREATE TABLE students(
  full_name text,
  phone text,
  specialty text,
  birthday date NOT NULL DEFAULT current_date,
  PRIMARY KEY (full_name, phone, specialty)
);
INSERT INTO students (full_name, phone, specialty)
VALUES ('Test Testovich', '0894564684', 'IT'),
  ('Null 12345', '06378529379', 'IT'),
  ('Multifunctional User', '015645454', 'IT'),
  ('Multifunctional User', '015645454', 'Music');
SELECT birthday
FROM students
WHERE full_name = 'Multifunctional User'
  AND phone = '015645454';
--
CREATE TABLE teachers (
  teachers_name text,
  teachers_subject text,
  teachers_age int,
  PRIMARY KEY (teachers_name, teachers_subject)
);
INSERT INTO teachers
VALUES ('1 1', 'Math', 40),
  ('2 2', 'Music', 25);
/* 2 NF */
CREATE TABLE teachers_to_subject (
  teachers_id text,
  teachers_subject text,
  PRIMARY KEY (teachers_id, teachers_subject)
);
--
CREATE teachers_data (
  id serial PRIMARY KEY,
  teachers_name text,
  teachers_age int,
);
INSERT INTO teachers_to_subject
VALUES ('1 1', 'Math'),
  ('2 2', 'Music');