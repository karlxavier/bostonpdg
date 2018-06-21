SELECT
  products.id AS searchable_id,
  'Product' AS searchable_type,
  products.id::text AS search_term
FROM products

UNION

SELECT
  products.id AS searchable_id,
  'Product' AS searchable_type,
  products.name AS search_term
FROM products

UNION

SELECT
  orders.id AS searchable_id,
  'Order' AS searchable_type,
  orders.id::text AS search_term
FROM orders

UNION

SELECT
  brands.id AS searchable_id,
  'Brand' AS searchable_type,
  brands.name AS search_term
FROM brands

UNION

SELECT
  order_entries.id AS searchable_id,
  'OrderEntry' AS searchable_type,
  products.id::text AS search_term
FROM order_entries
JOIN products ON products.id = order_entries.product_id

UNION

SELECT
  order_entries.id AS searchable_id,
  'OrderEntry' AS searchable_type,
  products.name AS search_term
FROM order_entries
JOIN products ON products.id = order_entries.product_id