-- show list of products with category names
SELECT
  p.id,
  p.name,
  p.price,
  c.name
FROM product p
  LEFT JOIN category c
    ON p.category_id = c.id

-- show count of sales for product and all information about products (simple variant)
SELECT
  p.name,
  c.name,
  COALESCE(sum(oe.count), 0) as count
FROM product p
  INNER JOIN category c
    ON p.category_id = c.id
  LEFT JOIN order_entry oe
    ON p.id = oe.product_id
GROUP BY p.id

-- report of count in one order entry > 2
SELECT
  c.first_name,
  c.last_name,
  c.phone,
  ord.date
FROM customer c
  LEFT JOIN (
               SELECT
                 o.customer_id,
                 o.date
               FROM `order` o
                 INNER JOIN order_entry oe
                   ON o.id = oe.order_id
               WHERE oe.count > 2
             ) ord
    ON c.id = ord.customer_id