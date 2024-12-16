-- FUNCTION --
USE supercerca;

-- Funcion para determinar obtener nombre de la empresa segun su Id
DELIMITER //
DROP FUNCTION IF EXISTS fx_get_name_company //
CREATE
  FUNCTION fx_get_name_company(company_id INT)
  RETURNS VARCHAR(512)
  READS SQL DATA
  BEGIN
    DECLARE nombre_completo VARCHAR(512);
    SELECT CONCAT(name_company, ' (', tax_id_number, ')') INTO nombre_completo
    FROM company
    WHERE id_company = company_id;
    RETURN nombre_completo;
  END //
DELIMITER;

-- Funcion para determinar el valor total del carrito por Id Carrito
DELIMITER //
DROP FUNCTION IF EXISTS  fx_get_total_price_cart //
CREATE 
  FUNCTION fx_get_total_price_cart(_id_cart INT)
  RETURNS DECIMAL(10,2)
  DETERMINISTIC
  BEGIN
    DECLARE price_total_cart DECIMAL(10,2);
    SELECT 
        SUM(p.price_product) INTO price_total_cart
    FROM supercerca.users  AS u
    INNER JOIN supercerca.cart  AS c ON c.users_id = u.id_user
    INNER JOIN supercerca.cart_items AS ci ON ci.cart_id = c.id_cart
    INNER JOIN supercerca.products AS p ON p.id_product = ci.products_id
    WHERE c.id_cart = _id_cart;
        RETURN price_total_cart;
  END //
DELIMITER;

-- Funcion para elegir aleatoriamente una fecha para las ordenes
DELIMITER //
DROP FUNCTION IF EXISTS fx_get_date_random //
CREATE FUNCTION fx_get_date_random() RETURNS DATE
NO SQL
BEGIN
    DECLARE date_order DATE;
    SELECT DATE_ADD('2020-01-01', INTERVAL FLOOR(RAND() * DATEDIFF('2024-12-13', '2020-01-01')) DAY) INTO date_order;
    RETURN date_order;
END //
DELIMITER ;

