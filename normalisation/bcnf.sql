/*
 Нормальная форма Бойса-Кодда
 Отношение находится в BCNF, если оно находится в 3НФ 
 и в ней отсутствуют зависимости атрибутов первичного ключа от неключевых атрибутов.
 
 teachers n : 1 subjects,
 students n : m  teachers,
 students n : m subjects
 
 */
create table students (id serial);
create table teachers (id serial);
create table teachers_to_subjects_to_students (
  teacher_id int References teachers,
  student_id int References students,
  "subject" text,
  PRIMARY KEY (teacher_id, student_id)
);
INSERT INTO teachers_to_subjects_to_students
VALUES (1, 1, 'Math'),
  (1, 2, 'Math'),
  (2, 1, 'IT'),
  (2, 2, 'Gardening');
/* BCNF*/
create table students (id serial);
create table subjects (id serial);
create table teachers (id serial, subject_id int references subjects);

create table students_teachers (
    teacher_id int References teachers
  student_id int References students
    PRIMARY KEY (teacher_id, student_id)
);

INSERT INTO students_teachers
VALUES (1, 1),
  (1, 2),
  (2, 1),
  (2, 2);