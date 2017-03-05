-- show list of products with category names
SELECT
  p.id,
  p.name,
  p.price,
  c.name
FROM product p
  RIGHT JOIN category c
    ON p.category_id = c.id