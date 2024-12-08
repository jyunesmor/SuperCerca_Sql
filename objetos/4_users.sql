USE supercerca;

 --  Creacion Usuarios
 -- Usuario Maestro que tendra acceso a toda la base de datos, y operaciones en ella --
 
DROP USER IF EXISTS 'juan_manuel'@'%';
CREATE USER 
  'juan_manuel'@'%'
IDENTIFIED BY 'juan12345';
GRANT ALL PRIVILEGES ON supercerca.* TO 'juan_manuel'@'%';

-- Usuario para solo lectura de base de datos, y trabajo solo a traves de consutlas --

DROP USER IF EXISTS 'martin_maximiliano'@'%';  
CREATE USER 
  'martin_maximiliano'@'%'
IDENTIFIED BY 'martin12345';
GRANT SELECT ON supercerca.* TO 'martin_maximiliano'@'%';
       
       
-- Usuario para solo tarbajar la base de datos solo en las Tablas User y Productos, podra realizar el ABM en ellas --      
    
DROP USER IF EXISTS 'marite_56'@'%';
CREATE USER 
  'marite_56'@'%'
  IDENTIFIED BY 'mari1310'; 
GRANT SELECT, CREATE, UPDATE, DELETE ON supercerca.users TO 'marite_56'@'%';
GRANT SELECT, CREATE, UPDATE, DELETE  ON supercerca.products TO 'marite_56'@'%';
GRANT EXECUTE ON supercerca.* TO 'marite_56'@'%';
GRANT SELECT ON supercerca.vw_listmostsaleproduct TO 'marite_56'@'%';

FLUSH PRIVILEGES;