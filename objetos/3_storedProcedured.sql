DELIMITER //
CREATE PROCEDURE sp_GetUserDetails(IN user_id INT)
BEGIN
  SELECT 
      u.identification_id AS Documento_Identidad
  ,   u.name_user AS Nombre
  ,   u.last_name_user AS Apellido
  ,   u.email AS Mail
  ,   a.street_address AS Calle
  ,   a.number_street AS Numero
  ,   c.city_name AS Ciudad
  ,   s.state_name AS Provincia
  FROM
      users  AS u
  INNER JOIN  address AS a
      USING(id_address)
  INNER JOIN  city AS c
      USING(id_city)
  INNER JOIN  state AS s
      USING(id_state)
  WHERE
    id_user = user_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_UpdateProductPrice(IN product_id INT, IN new_price DECIMAL(10,2))
BEGIN
  UPDATE products
  SET price_product = new_price
  WHERE id_product = product_id;
END //
DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_CreateUser(IN _id_user INT, IN _name VARCHAR(256), IN _last_name VARCHAR(256), IN _identification_id VARCHAR(15), 
                             IN _email VARCHAR(256), IN _password VARCHAR(10), IN _address_id INT, IN _payment_id INT)
BEGIN
  INSERT INTO users(id_user,name_user, last_name_user, identification_id, email, user_password, id_address, id_payment)
  VALUES(_id_user,_name, _last_name, _identification_id, _email, _password, _address_id, _payment_id);
END //
DELIMITER ;