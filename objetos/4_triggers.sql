DELIMITER //
CREATE TRIGGER check_user_exists
  BEFORE INSERT ON users
  FOR EACH ROW
  BEGIN
    DECLARE user_exists INT;

    SELECT COUNT(*) INTO user_exists
    FROM users
    WHERE email = NEW.email OR id_user = NEW.id_user;

    IF user_exists > 0 THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'El usuario con el correo electrónico o ID ya existe.';
    END IF;
  END //
DELIMITER ;