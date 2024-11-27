CREATE VIEW products_by_company AS
SELECT 
  p.name_product AS Product,
  c.name_company AS Company,
  p.price_product AS Price
FROM products AS p
INNER JOIN company AS c
  USING(id_company);

CREATE VIEW user_orders AS
  SELECT 
    o.id_order AS order_id,
    p.name_product AS product_name,
    o.total_order_price AS total_price,
    o.order_created AS order_date
  FROM order_purchase o
  INNER JOIN products p 
    USING(id_product)
  INNER JOIN users u 
    USING(id_user);