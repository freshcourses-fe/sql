 -- sellers_data.*
SELECT orders.id as order_id,
  users.first_name,
  users.last_name,
  sum(products.price * products_to_orders.quantity) as "Total price"
  FROM users
  JOIN orders ON orders.buyer_id = users.id
  JOIN products_to_orders ON products_to_orders.order_id = orders.id
  JOIN products ON products.id = products_to_orders.product_id
  GROUP BY orders.id, users.id;
  /*
  JOIN (
    SELECT users.first_name as seller_name,
      users.last_name as seller_last_name,
      users.id
    from users
      JOIN sellers ON sellers.user_id = users.id
      JOIN orders ON orders.buyer_id = users.id
      JOIN products_to_orders ON products_to_orders.order_id = orders.id
      JOIN products ON products.id = products_to_orders.product_id
  ) as sellers_data ON users.id = sellers_data.id;
  */