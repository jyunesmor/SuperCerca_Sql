INSERT INTO country (id_country,country_name)
  VALUES 
  (1,'Argentina'),
  (2,'Brasil'),
  (3,'Mexico'),
  (4,'Peru'),
  (5,'Colombia'),
  (6,'Uruguay'),
  (7,'Costa Rica'),
  (8,'Bolivia')
;  

INSERT INTO state (id_state, state_name,id_country)
  VALUES 
  (1, 'Córdoba',1),
  (2, 'Santa Fe',1),
  (3, 'Buenos Aires',1),
  (4, 'Santa Catarina',2),
  (5, 'Mendoza',1),
  (6, 'Ciudad de México',3),
  (7, 'La Rioja',1),
  (8, 'Salta',1),
  (9, 'San José',7),
  (10, 'Neuquen',1),
  (11, 'Bogotá',5), 
  (12, 'São Paulo',2), 
  (13, 'Entre Rios',1),
  (14, 'La Pampa',1), 
  (15, 'Rio Grande',1),
  (16, 'La Paz',8),
  (17, 'Montevideo',6),
  (18, 'Rio Grande Do Sud',2);
  
  INSERT INTO city (id_city,city_name,id_state)
  VALUES 
  (1, 'Córdoba',1),
  (2, 'Rosario',2),
  (3, 'La Paz',16),
  (4, 'Ciudad Autonoma de Buenos Aires',3),
  (5, 'Bogotá',5),
  (6, 'Rio de Janeiro',4),
  (7, 'São Paulo',12),
  (8, 'San José',9),
  (9, 'San Fernando del Valle',12),
  (10, 'Bahia Blanca',3),
  (11, 'Montevideo',17), 
  (12, 'San Salvador de Jujuy',16), 
  (13, 'Mar del Plata',3),
  (14, 'Porto Alegre',18), 
  (15, 'Ciudad de México',6);
  
INSERT INTO phone (id_phone,phone_number)
VALUES
  (1, '+5491112345678'),  -- Argentina
  (2, '+5511987654321'),  -- Brazil
  (3, '+525555543210'),  -- Mexico
  (4, '+5713124567'),  -- Colombia
  (5, '+12125551212'),  -- USA
  (6, '+14155555555'),  -- USA
  (7, '+13125555555'),  -- USA
  (8, '+56222345678'),  -- Chile
  (9, '+5114567890'),  -- Peru
  (10, '+58414213456'),  -- Venezuela
  (11, '+50688888888'),  -- Costa Rica
  (12, '+50377777777'),  -- El Salvador
  (13, '+50499999999'),  -- Honduras
  (14, '+50588888888'),  -- Nicaragua
  (15, '+59399999999'),  -- Ecuador
  (16, '+59822234567'); -- Uruguay
  ;
  
INSERT INTO address (id_address,street_address,number_street,postal_code,id_phone,id_city)
VALUES
  (1,'Avenida 9 de Julio', '1900', 'C1078AAB',1,1),
  (2,'Rua Augusta', '200', '01330-010',2,7),
  (3,'Calle 5ta', '123', '10500',11,8),
  (4,'Avenida Reforma', '1234', '01010',3,15),
  (5,'Calle 72', '345', '11001',4,5),
  (6,'Calle Sucre', '567', '7890',9,3),
  (7,'Calle Uruguay', '987', '12345',16,11);

INSERT INTO company_type (id_company_type, name_co_type)
VALUES
  (1, 'Minorista en línea'),
  (2, 'Mayorista'),
  (3, 'Fabricante'),
  (4, 'Dropshipper'),
  (5, 'Marketplace'),
  (6, 'Proveedor de logística'),
  (7, 'Proveedor de pagos');
  
INSERT INTO company (id_company, name_company, tax_id_number, id_company_type, id_address)
VALUES
  (1, 'Apple Inc.', '94-3055622', 1, 1),
  (2, 'Microsoft Corporation', '79-4636462', 1, 2),
  (3, 'Google LLC', '79-4636462', 1, 3),
  (4, 'Amazon.com, Inc.', '94-1065045', 1, 4),
  (5, 'Meta Platforms, Inc.', '94-3055622', 1, 5),
  (6, 'Tesla, Inc.', '94-3055622', 1, 6),
  (7, 'NVIDIA Corporation', '94-3055622', 1, 7),
  (8, 'Intel Corporation', '94-3055622', 1, 1), 
  (9, 'UPS', '54321987', 2, 3),
  (10, 'Samsung Electronics', '94-3055622', 1, 3),
  (11, 'DHL', '12345678', 2, 1),
  (12, 'Xiaomi Corporation', '94-3055622', 1, 5),
  (13, 'Sony Group Corporation', '94-3055622', 1, 6),
  (14, 'LG Electronics', '94-3055622', 1, 7),
  (15, 'FedEx', '87654321', 2, 2);
  

INSERT INTO products (id_product, name_product, price_product, description_product, id_company)
VALUES
  (1, 'iPhone 15 Pro Max', 1299.99, 'High-end smartphone with powerful processor and advanced camera system', 1),
  (2, 'Samsung Galaxy S24 Ultra', 1199.99, 'Premium smartphone with large display, excellent camera, and fast charging', 2),
  (3, 'MacBook Pro 14"', 1999.99, 'Powerful laptop for professionals, with M2 Pro chip and long battery life', 3),
  (4, 'Dell XPS 13', 1499.99, 'Sleek and lightweight laptop with high-resolution display and fast performance', 4),
  (5, 'Sony PlayStation 5', 499.99, 'Next-gen gaming console with stunning graphics and immersive sound', 5),
  (6, 'Microsoft Xbox Series X', 499.99, 'Powerful gaming console with 4K gaming and fast load times', 6),
  (7, 'Nintendo Switch OLED', 349.99, 'Portable gaming console with a vibrant OLED display', 7),
  (8, 'Apple Watch Series 9', 399.99, 'Smartwatch with advanced health tracking and fitness features', 1),
  (9, 'Samsung Galaxy Watch 6', 299.99, 'Versatile smartwatch with long battery life and stylish design', 2),
  (10, 'Sony WH-1000XM5', 399.99, 'Premium noise-canceling headphones with excellent sound quality', 8),
  (11, 'Bose QuietComfort 45', 329.99, 'Comfortable noise-canceling headphones with customizable sound', 9),
  (12, 'Apple AirPods Pro (2nd Gen)', 249.99, 'Wireless earbuds with active noise cancellation and spatial audio', 1),
  (13, 'Samsung Galaxy Buds 2 Pro', 199.99, 'Compact earbuds with high-quality sound and ANC', 2),
  (14, 'LG OLED C3 Series', 1299.99, 'Immersive OLED TV with stunning picture quality and Dolby Vision', 10),
  (15, 'Samsung Neo QLED 8K', 2999.99, 'High-resolution TV with incredible brightness and contrast', 2);
 
INSERT INTO delivery (id_delivery,id_company)
VALUES
(1,15),
(2,9),
(3,11),
(4,15);

INSERT INTO payment_methods (id_payment, payment_type)
VALUES
  (1, 'Tarjeta de Crédito'),
  (2, 'Tarjeta de Débito'),
  (3, 'PayPal'),
  (4, 'Transferencia Bancaria'),
  (5, 'Efectivo');

  
INSERT INTO users (id_user, name_user, last_name_user, identification_id, email, user_password, id_address, id_payment)
VALUES
  (1, 'John', 'Doe', '12345678', 'johndoe@gmail.com', 'P@ssw0rd1', 1, 1),
  (2, 'Jane', 'Smith', '98765432', 'janesmith@outlook.com', 'S3cr3t2', 2, 3),
  (3, 'Michael', 'Johnson', '11223344', 'mjohnson@yahoo.com', 'P@ssw0rd3', 3,4),
  (4, 'Emily', 'Brown', '44556677', 'ebrown@hotmail.com', 'S3cr3t4', 4, 4),
  (5, 'David', 'Lee', '77889900', 'dlee@gmail.com', 'P@ssw0rd5', 5, 5),
  (6, 'Ethan', 'Davis', '55667788', 'edavis@yahoo.com', 'P@ssw0rd7', 7, 5),
  (7, 'Olivia', 'Miller', '88990011', 'omiller@hotmail.com', 'S3cr3t8', 5, 2);

INSERT INTO order_purchase (id_order, total_order_price, order_created, id_product, id_user, id_delivery)
VALUES
  (1, 1299.99, curdate(), 1, 1, 1),  -- iPhone 15 Pro Max (user John Doe)
  (2, 1499.99, curdate(), 3, 2, 2),  -- MacBook Pro 14" (user Jane Smith)
  (3, 499.99, curdate(), 5, 3, 3); -- Sony PlayStation 5 (user Michael Johnson);


  INSERT INTO cart (id_cart, users_id)
  VALUES 
    (1,3),
    (2,4),
    (3,7),
    (4,2),
    (5,3);
    
  INSERT INTO cart_items (id_cart_items, cart_id, products_id)
  VALUES 
    (1,1,3),
    (2,1,9),
    (3,1,15),
    (4,1,13),
    (5,2,3),
    (6,2,14),
    (7,2,6),
    (8,2,4),
    (9,3,1),
    (10,3,15),
    (11,3,4),
    (12,3,8),
    (13,1,2),
    (14,1,10),
    (15,1,15),
    (16,1,6),
    (17,5,3),
    (18,5,7),
    (19,5,9),
    (20,5,6);