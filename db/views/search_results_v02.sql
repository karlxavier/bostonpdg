SELECT
  order_entries.order_id AS searchable_id,
  'Order' AS searchable_type,
  products.name AS search_term
FROM order_entries
JOIN products ON products.id = order_entries.product_id

UNION

SELECT
  order_entries.order_id AS searchable_id,
  'Order' AS searchable_type,
  products.id::text AS search_term
FROM order_entries
JOIN products ON products.id = order_entries.product_id

UNION

SELECT
  orders.id AS searchable_id,
  'Order' AS searchable_type,
  orders.brand_id::text AS search_term
FROM orders

UNION

SELECT
  orders.id AS searchable_id,
  'Order' AS searchable_type,
  brands.name AS search_term
FROM orders
JOIN brands ON brands.id = orders.brand_id

UNION

SELECT
  orders.id AS searchable_id,
  'Order' AS searchable_type,
  order_users.regional::text AS search_term
FROM orders
JOIN order_users ON order_users.order_id = orders.id

UNION

SELECT
  orders.id AS searchable_id,
  'Order' AS searchable_type,
  order_users.comms::text AS search_term
FROM orders
JOIN order_users ON order_users.order_id = orders.id

UNION

SELECT
  orders.id AS searchable_id,
  'Order' AS searchable_type,
  order_users.art::text AS search_term
FROM orders
JOIN order_users ON order_users.order_id = orders.id

UNION

SELECT
  orders.id AS searchable_id,
  'Order' AS searchable_type,
  order_users.processor::text AS search_term
FROM orders
JOIN order_users ON order_users.order_id = orders.id

UNION

SELECT
  orders.id AS searchable_id,
  'Order' AS searchable_type,
  order_users.designer::text AS search_term
FROM orders
JOIN order_users ON order_users.order_id = orders.id

UNION

SELECT
  orders.id AS searchable_id,
  'Order' AS searchable_type,
  order_users.client_contact::text AS search_term
FROM orders
JOIN order_users ON order_users.order_id = orders.id

UNION

SELECT
  orders.id AS searchable_id,
  'Order' AS searchable_type,
  users.email AS search_term
FROM orders
JOIN order_users ON order_users.order_id = orders.id
JOIN users ON order_users.regional = users.id

UNION

SELECT
  orders.id AS searchable_id,
  'Order' AS searchable_type,
  users.first_name AS search_term
FROM orders
JOIN order_users ON order_users.order_id = orders.id
JOIN users ON order_users.regional = users.id

UNION

SELECT
  orders.id AS searchable_id,
  'Order' AS searchable_type,
  users.last_name AS search_term
FROM orders
JOIN order_users ON order_users.order_id = orders.id
JOIN users ON order_users.regional = users.id

UNION

SELECT
  orders.id AS searchable_id,
  'Order' AS searchable_type,
  users.email AS search_term
FROM orders
JOIN order_users ON order_users.order_id = orders.id
JOIN users ON order_users.comms = users.id

UNION

SELECT
  orders.id AS searchable_id,
  'Order' AS searchable_type,
  users.first_name AS search_term
FROM orders
JOIN order_users ON order_users.order_id = orders.id
JOIN users ON order_users.comms = users.id

UNION

SELECT
  orders.id AS searchable_id,
  'Order' AS searchable_type,
  users.last_name AS search_term
FROM orders
JOIN order_users ON order_users.order_id = orders.id
JOIN users ON order_users.comms = users.id

UNION

SELECT
  orders.id AS searchable_id,
  'Order' AS searchable_type,
  users.email AS search_term
FROM orders
JOIN order_users ON order_users.order_id = orders.id
JOIN users ON order_users.art = users.id

UNION

SELECT
  orders.id AS searchable_id,
  'Order' AS searchable_type,
  users.first_name AS search_term
FROM orders
JOIN order_users ON order_users.order_id = orders.id
JOIN users ON order_users.art = users.id

UNION

SELECT
  orders.id AS searchable_id,
  'Order' AS searchable_type,
  users.last_name AS search_term
FROM orders
JOIN order_users ON order_users.order_id = orders.id
JOIN users ON order_users.art = users.id

UNION

SELECT
  orders.id AS searchable_id,
  'Order' AS searchable_type,
  users.email AS search_term
FROM orders
JOIN order_users ON order_users.order_id = orders.id
JOIN users ON order_users.processor = users.id

UNION

SELECT
  orders.id AS searchable_id,
  'Order' AS searchable_type,
  users.first_name AS search_term
FROM orders
JOIN order_users ON order_users.order_id = orders.id
JOIN users ON order_users.processor = users.id

UNION

SELECT
  orders.id AS searchable_id,
  'Order' AS searchable_type,
  users.last_name AS search_term
FROM orders
JOIN order_users ON order_users.order_id = orders.id
JOIN users ON order_users.processor = users.id

UNION

SELECT
  orders.id AS searchable_id,
  'Order' AS searchable_type,
  users.email AS search_term
FROM orders
JOIN order_users ON order_users.order_id = orders.id
JOIN users ON order_users.designer = users.id

UNION

SELECT
  orders.id AS searchable_id,
  'Order' AS searchable_type,
  users.first_name AS search_term
FROM orders
JOIN order_users ON order_users.order_id = orders.id
JOIN users ON order_users.designer = users.id

UNION

SELECT
  orders.id AS searchable_id,
  'Order' AS searchable_type,
  users.last_name AS search_term
FROM orders
JOIN order_users ON order_users.order_id = orders.id
JOIN users ON order_users.designer = users.id

UNION

SELECT
  orders.id AS searchable_id,
  'Order' AS searchable_type,
  users.email AS search_term
FROM orders
JOIN order_users ON order_users.order_id = orders.id
JOIN users ON order_users.client_contact = users.id

UNION

SELECT
  orders.id AS searchable_id,
  'Order' AS searchable_type,
  users.first_name AS search_term
FROM orders
JOIN order_users ON order_users.order_id = orders.id
JOIN users ON order_users.client_contact = users.id

UNION

SELECT
  orders.id AS searchable_id,
  'Order' AS searchable_type,
  users.last_name AS search_term
FROM orders
JOIN order_users ON order_users.order_id = orders.id
JOIN users ON order_users.client_contact = users.id