CREATE TABLE captains (
  id serial PRIMARY KEY,
  "name" text
);

CREATE TABLE ships (
  id serial PRIMARY KEY,
  captain_id int NOT NULL REFERENCES captains DEFERRABLE INITIALLY DEFERRED,
  "name" text
);

ALTER TABLE captains ADD COLUMN  ship_id int NOT NULL REFERENCES ships DEFERRABLE INITIALLY DEFERRED; -- отложить проверку до конца транзакции

DROP TABLE captains;
DROP TABLE ships;


BEGIN; -- началась транзакция
INSERT INTO ships ("name", captain_id)
VALUES ('test ship', 3);

INSERT INTO captains ("name", ship_id)
VALUES ('test', 3);
COMMIT; -- завершилась транзакция