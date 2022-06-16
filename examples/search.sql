/*
  Поиск текстов по шаблонам:

  LIKE - с учетом регистра
  ILIKE - без учета регистра
  glob pattern
  ? - один любой символ = _
  * - любое количество любіх символов = %

  SIMILAR TO

  ~ - регулярка с учетом регистра
  ~* - регулярка без учета регистра
  !~ - НЕ регулярка с учетом регистра
  !~* НЕ регулярка без учета регистра
*/
--
SELECT * FROM users
WHERE first_name ~ '[T-X].*';
--
SELECT * FROM users
WHERE first_name LIKE 'J%';
--
SELECT * FROM users
WHERE first_name ILIKE 'john';
--
SELECT * FROM users
WHERE first_name LIKE '%j%';
-- 
SELECT *
FROM users
WHERE first_name SIMILAR TO '[T-X]%';
/*
Найти всех юзеров имена которых начинаются на H, заканчиваются на y  И фамилии которых начнинаются на B
*/
