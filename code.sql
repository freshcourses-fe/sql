-- creates database
--CREATE DATABASE training;

-- DDL
CREATE TABLE users(
  first_name varchar(64) NOT NULL,
  last_name varchar(64) NOT NULL,
  email varchar(100) NOT NULL,
  height numeric(3, 2),
  is_male bool,
  birthday date
);

--DML
INSERT INTO users
VALUES (NULL, 'Testovich', 'test@test.test', 1.60, true, '1999-1-1');
-- incomplete insert
INSERT INTO users DEFAULT VALUES;

DROP TABLE users;
/*

'test',
'test2',
'test3'

DROP TABLE " 234342323";

'user''s choise'

'test'
'test'

'test'    'test'

$$user's choise$$
*/