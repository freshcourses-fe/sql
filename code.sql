-- creates database
--CREATE DATABASE training;
-- DDL
CREATE TABLE users(
  first_name varchar(64) NOT NULL CHECK (first_name != ''),
  last_name varchar(64) NOT NULL CHECK (last_name != ''),
  email varchar(100) NOT NULL UNIQUE CONSTRAINT "VALID EMAIL" CHECK (
    email ~ '^[A-Za-z0-9]\w{0,}@[a-z]{1,}\.[a-z]{1,}$'
  ),
  height numeric(3, 2) CHECK (
    height > 0
    AND height < 3
  ),
  is_male bool NOT NULL,
  birthday date NOT NULL CHECK (
    age(birthday) < interval '120 years'
    AND birthday < (current_date + interval '1 day')
  )
);
-- созадть табличку для сообщений
CREATE TABLE messages(
  id bigserial PRIMARY KEY,
  sending_user varchar(15) NOT NULL CHECK (sending_user != ''),
  target_user varchar(15) NOT NULL CHECK (target_user != ''),
  created_at timestamp NOT NULL DEFAULT current_timestamp,
  body text NOT NULL,
  is_read boolean NOT NULL DEFAULT false
);
--
INSERT INTO messages (sending_user, target_user, body)
VALUES ('Andrey', 'Vasya', 'ETO DICH'),
  ('Andrey', 'Vasya', 'ETO DICH'),
  ('Andrey', 'Vasya', 'ETO DICH'),
  ('Andrey', 'Vasya', 'ETO DICH');
--
DELETE FROM messages
WHERE sending_user = 'Andrey';
--DML
INSERT INTO users
VALUES (
    'Test',
    'Testovich',
    'test23@test.test',
    1.60,
    true,
    '2022-6-9'
  );
-- incomplete insert
INSERT INTO users
VALUES (
    'Anton',
    'test',
    'anton@test.test',
    2,
    true,
    '1923-1-1'
  );
DROP TABLE messages;
