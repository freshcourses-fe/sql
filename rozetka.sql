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
--
CREATE TABLE sellers (
  id serial PRIMARY KEY,
  user_id int NOT NULL UNIQUE REFERENCES users,
  -- (1 : 1) из-за UNIQUE
  "address" text,
  phone text,
  created_at timestamp NOT NULL DEFAULT current_timestamp
);
-- n : m связующая таблица
CREATE TABLE products_to_orders (
  product_id int REFERENCES products,  -- пылесос
  order_id int REFERENCES orders,  -- заказ 1 
  quantity int NOT NULL CHECK (quantity > 0),  -- 5
  PRIMARY KEY (product_id, order_id) -- составной певичный ключ
);
--
ALTER TABLE products RENAME COLUMN manufacturer_id TO seller_id;
--
ALTER TABLE products
ADD FOREIGN KEY (seller_id) REFERENCES sellers;