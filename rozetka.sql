CREATE TABLE users(
  id serial PRIMARY KEY,
  first_name varchar(64) NOT NULL CHECK (first_name != ''),
  last_name varchar(64) NOT NULL CHECK (last_name != ''),
  email varchar(100) NOT NULL UNIQUE CONSTRAINT "VALID EMAIL" CHECK (
    email ~ '^[A-Za-z0-9]\w{0,}@[a-z]{1,}\.[a-z]{1,}$'
  ),
  height numeric(3, 2) CHECK (
    height > 0
    AND height < 3
  ),
  is_male bool,
  birthday date CHECK (
    age(birthday) < interval '120 years'
    AND birthday < (current_date + interval '1 day')
  )
);
--
CREATE TABLE products(
  id serial PRIMARY KEY,
  "name" varchar(256) NOT NULL CHECK("name" != ''),
  price numeric(11, 2) NOT NULL CHECK(price > 0),
  quantity integer NOT NULL CHECK(quantity > 0),
  category varchar(256) NOT NULL CHECK(category != ''),
  manufacturer_id bigint NOT NULL
);
--
CREATE TABLE orders (
  id serial PRIMARY KEY,
  buyer_id int NOT NULL REFERENCES users (id),
  -- ссылаемся на таблицу users и столбец id (1 : m)
  created_at timestamp NOT NULL DEFAULT current_timestamp
);
