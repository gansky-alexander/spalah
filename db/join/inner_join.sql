-- show list of products with category names
SELECT
  p.id,
  p.name,
  p.price,
  c.name
FROM product p
  INNER JOIN category c
    ON p.category_id = c.id

-- show all data like report about sales
SELECT
  cu.first_name,
  cu.last_name,
  p.name,
  c.name,
  oe.price,
  oe.count,
  oe.price * oe.count AS amount
FROM product p
  INNER JOIN category c
    ON p.category_id = c.id
  INNER JOIN order_entry oe
    ON p.id = oe.product_id
  INNER JOIN `order` o
    ON oe.order_id = o.id
  INNER JOIN customer cu
    ON o.customer_id = cu.id
ORDER BY amount

--
