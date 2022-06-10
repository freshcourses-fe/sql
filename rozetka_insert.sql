INSERT INTO users
(first_name, last_name, email)
VALUES
('Buyer', '1', '1@mail.com'),
('Seller', '2', '2@mail.com'),
('Buyer', '3', '3@mail.com'),
('Buyer', '4', '4@mail.com'),
('Seller', '5', '5@mail.com');
-- good
INSERT INTO sellers(user_id, "address", "phone")
VALUES
(2, 'ZP', '06443546845'),
(5, 'LV', '05846546886');
-- bad
INSERT INTO sellers(user_id, "address", "phone")
VALUES
(20, '404', '05846546886');
--
INSERT INTO products
("name", seller_id, price, quantity, category)
VALUES
('iphone', 2, 5000, 1000, 'phones'),
('dishwasher', 1, 14999.99, 500000, 'home' ),
('toothpick', 1, 999, 100, 'bathroom');
--
INSERT INTO orders (buyer_id)
VALUES (1),
(3),
(1);
--
INSERT INTO products_to_orders (order_id, product_id, quantity)
VALUES
(1, 1, 2),
(2, 1, 1),
(2, 3, 2),
(3, 2, 100);