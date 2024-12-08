-- STORED PROCEDURES --
USE supercerca;
SET autocommit = FALSE;

-- Procedimiento para Obtener los datos de los usuarios
DELIMITER //
DROP PROCEDURE IF EXISTS  sp_GetUserDetails;
CREATE 
  PROCEDURE sp_GetUserDetails(IN user_id INT)
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


--  ABM PROCEDURES -- 

-- UPDATE --

-- Procedimiento para actualizar los precios a productos
DELIMITER //
DROP PROCEDURE IF EXISTS  sp_UpdateProductPrice;
CREATE 
  PROCEDURE sp_UpdateProductPrice(IN product_id INT, IN new_price DECIMAL(10,2))
  BEGIN
    START TRANSACTION;
    UPDATE products
    SET price_product = new_price
    WHERE id_product = product_id;
    COMMIT;
  END //
DELIMITER ;

DELIMITER //
DROP PROCEDURE IF EXISTS  sp_updateUser;
CREATE 
  PROCEDURE sp_updateUser(IN _id_user INT, IN _name VARCHAR(256), IN _last_name VARCHAR(256), IN _identification_id VARCHAR(15), 
                             IN _email VARCHAR(256), IN _password VARCHAR(10), IN _address_id INT, IN _payment_id INT)
  BEGIN
    START TRANSACTION;
    UPDATE users
      SET 
          name_user = _name,
          last_name_user = _last_name,
          identification_id = _identification_id,
          email = _email,
          user_password = _password,
          id_address = _address_id,
          id_payment = _payment_id
      WHERE id_user = _id_user;
    COMMIT;
  END //
DELIMITER ;

-- CREATE --

-- Procedimiento para la creacion de usuarios nuevos --

DELIMITER //
DROP PROCEDURE IF EXISTS  sp_createUser;
CREATE 
  PROCEDURE sp_createUser(IN _id_user INT, IN _name VARCHAR(256), IN _last_name VARCHAR(256), IN _identification_id VARCHAR(15), 
                             IN _email VARCHAR(256), IN _password VARCHAR(256), IN _address_id INT, IN _payment_id INT)
  BEGIN
    START TRANSACTION;
    INSERT INTO users(id_user,name_user, last_name_user, identification_id, email, user_password, id_address, id_payment)
    VALUES(_id_user,_name, _last_name, _identification_id, _email, _password, _address_id, _payment_id);
    COMMIT;
  END //
DELIMITER ;

-- Procedimiento para la creacion de productos nuevos --

DELIMITER //
DROP PROCEDURE IF EXISTS  sp_createProducts;
CREATE 
  PROCEDURE sp_createProducts(IN _id_product INT, IN _name_product VARCHAR(256), IN _price_product DECIMAL(10,2), IN _description_product VARCHAR(256), 
                             IN _id_company INT)
  BEGIN
    START TRANSACTION;
    INSERT INTO products(id_product,name_product, price_product, description_product, id_company)
    VALUES(_id_product,_name_product, _price_product, _description_product, _id_company);
    COMMIT;
  END //
DELIMITER ;


-- DELETE --

-- Procedimiento para la eliminacion de usuarios --

DELIMITER //
DROP PROCEDURE IF EXISTS sp_deleteUserById;
CREATE 
  PROCEDURE sp_deleteUserById(IN user_id INT)
  BEGIN
    SET FOREIGN_KEY_CHECKS = FALSE;  
    START TRANSACTION;
    DELETE FROM supercerca.users AS u WHERE u.id_user = user_id;
    COMMIT;
 END //
DELIMITER ;

-- Procedimiento para la eliminacion de Productos --

DELIMITER //
DROP PROCEDURE IF EXISTS sp_deleteProductsById;
CREATE 
  PROCEDURE sp_deleteProductsById(IN product_id INT)
  BEGIN
    SET FOREIGN_KEY_CHECKS = FALSE;  
    START TRANSACTION;
    DELETE FROM supercerca.products AS u WHERE u.id_product = product_id;
    COMMIT;
 END //
DELIMITER ;

