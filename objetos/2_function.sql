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