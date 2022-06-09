CREATE EXTENSION "uuid-ossp";


CREATE TABLE messages(
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
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
