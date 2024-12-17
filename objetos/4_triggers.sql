-- TRIGGERS  --
USE supercerca;

-- Validación de  que no pueda cargarse un nuevo usuario con Igual Id ni email
DELIMITER //
DROP TRIGGER IF EXISTS check_user_exists;
CREATE 
  TRIGGER check_user_exists
  BEFORE INSERT ON users
  FOR EACH ROW
  BEGIN
    DECLARE user_id_exists INT;
    DECLARE user_email_exists INT;
    
    -- Check if user ID already exists
    SELECT COUNT(*) INTO user_id_exists
    FROM users
    WHERE id_user = NEW.id_user;
    
    -- Verifica si el email existe
    SELECT COUNT(*) INTO user_email_exists
    FROM users
    WHERE email = NEW.email;
    
    -- Lanza Mensaje si el ID existe
    IF user_id_exists > 0 THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'El usuario con el ID ingresado ya existe.';
    END IF;
    
    -- Lanza Error si el email existe
    IF user_email_exists > 0 THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'El correo electrónico ya está registrado.';
    END IF;
  END //
DELIMITER ;

-- Trigger to enforce minimum password length
DELIMITER //
CREATE TRIGGER before_user_insert_password_check BEFORE INSERT ON users
FOR EACH ROW
BEGIN
    IF LENGTH(NEW.user_password) < 6 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Password must be at least 6 characters long';
    END IF;
END //
DELIMITER ;

-- Trigger to validate identification number format
DELIMITER //
CREATE TRIGGER before_user_insert_id_check BEFORE INSERT ON users
FOR EACH ROW
BEGIN
    -- Example validation for identification number (adjust regex as needed)
    IF NEW.identification_id REGEXP '^[0-9]{5,15}$' = 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Invalid identification number format';
    END IF;
END //
DELIMITER ;
