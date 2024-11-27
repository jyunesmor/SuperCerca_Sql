DELIMITER //
CREATE FUNCTION fx_GetNameCompany(company_id INT)
RETURNS VARCHAR(512)
READS SQL DATA
BEGIN
  DECLARE nombre_completo VARCHAR(512);
  SELECT CONCAT(name_company, ' (', tax_id_number, ')') INTO nombre_completo
  FROM company
  WHERE id_company = company_id;
  RETURN nombre_completo;
END //
DELIMITER ; 


DELIMITER //
DROP FUNCTION IF EXISTS fx_valor_promedio_productos;
CREATE FUNCTION 
  fx_valor_promedio_productos(_price_prom INT)
RETURNS DECIMAL(10,2)
READS SQL DATA
BEGIN
  DECLARE promedio_precio DECIMAL(10,2);
  SELECT AVG(products.price_product) INTO promedio_precio
  FROM products
  WHERE products.price_product > _price_prom;

  RETURN promedio_precio;
END //
DELIMITER ;
