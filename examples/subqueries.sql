SELECT id, extract( 'year' from  age(birthday)) "years" 
FROM users
WHERE extract( 'year' from  age(birthday)) >= 40
ORDER BY extract( 'year' from  age(birthday)) ASC;
--
SELECT * 
FROM (
  SELECT *, extract( 'year' from  age(birthday)) "years" 
  FROM users
) users_id_with_age
WHERE "years" >= (SELECT 40)
ORDER BY "years" ASC; 
--
SELECT 40;