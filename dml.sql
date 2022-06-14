-- DML -data manipulation language
INSERT INTO users (first_name, last_name, email, is_male, birthday)
VALUES ('Test', 'Testovich', 'T3@t.t', true, '1999-1-1')
RETURNING *;
-- обновляет данные в таблице
UPDATE users SET height = 1.5; -- обновит всем 
UPDATE users SET height = 1.95 WHERE id = 6 RETURNING *; -- обновит рост юзеру с 6 айдишником
UPDATE users SET height = 1.2 , first_name = 'John' WHERE id = 7 RETURNING *; -- обновит несколько полей
UPDATE users SET height = 2.5 WHERE id != 7 AND first_name = 'John' RETURNING *; -- обновит рост всем джонам айди которіх не равен семи
-- изменить всем женщинам рост
UPDATE users SET height = 2.22 WHERE is_male = false RETURNING *;
UPDATE users SET height = 2 WHERE NOT is_male RETURNING *;
-- удаляет данные в таблице
--DELETE FROM users; -- удаляет ВСЕХ юзеров

DELETE FROM users WHERE id = 1002 RETURNING *; -- удаляет всех пользователей у которых айди равен 1002

