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
CREATE TABLE sellers (
  id serial PRIMARY KEY,
  user_id int NOT NULL UNIQUE REFERENCES users ON DELETE CASCADE ON UPDATE CASCADE,
  -- (1 : 1) из-за UNIQUE
  "address" text,
  phone text,
  created_at timestamp NOT NULL DEFAULT current_timestamp
);
--
CREATE TABLE products(
  id serial PRIMARY KEY,
  "name" varchar(256) NOT NULL CHECK("name" != ''),
  price numeric(11, 2) NOT NULL CHECK(price > 0),
  quantity integer NOT NULL CHECK(quantity > 0),
  category varchar(256) NOT NULL CHECK(category != ''),
  seller_id bigint NOT NULL REFERENCES sellers ON DELETE CASCADE ON UPDATE CASCADE
);

-- ALTER TABLE products DROP CONSTRAINT "products_seller_id_fkey";
-- ALTER TABLE products ADD FOREIGN KEY (seller_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE;
--
CREATE TABLE orders (
  id serial PRIMARY KEY,
  buyer_id int NOT NULL REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE,
  -- ссылаемся на таблицу users и столбец id (1 : m)
  created_at timestamp NOT NULL DEFAULT current_timestamp
);

-- ALTER TABLE orders DROP CONSTRAINT "orders_buyer_id_fkey";
-- ALTER TABLE orders ADD FOREIGN KEY (buyer_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE;
--


-- ALTER TABLE sellers DROP CONSTRAINT "sellers_user_id_fkey";
-- ALTER TABLE sellers ADD FOREIGN KEY (user_id)  REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE;
-- n : m связующая таблица
CREATE TABLE products_to_orders (
  product_id int REFERENCES products ON DELETE CASCADE ON UPDATE CASCADE,  -- пылесос
  order_id int REFERENCES orders ON DELETE CASCADE ON UPDATE CASCADE,  -- заказ 1 
  quantity int NOT NULL CHECK (quantity > 0),  -- 5
  PRIMARY KEY (product_id, order_id) -- составной певичный ключ
);
--
-- ALTER TABLE products RENAME COLUMN manufacturer_id TO seller_id;
-- --
-- ALTER TABLE products
-- ADD FOREIGN KEY (seller_id) REFERENCES sellers;


DELETE FROM users WHERE id = 5;

DROP TABLE products_to_orders;
DROP TABLE products;
DROP TABLE orders;
DROP TABLE sellers;
DROP TABLE users;