USE supercerca;

INSERT INTO country (country_name)
  VALUES 
  ('Argentina'),
  ('Brasil'),
  ('Mexico'),
  ('Peru'),
  ('Colombia'),
  ('Uruguay'),
  ('Costa Rica'),
  ('Bolivia');  

INSERT INTO state (state_name,id_country)
  VALUES 
  ('Córdoba',1),
  ('Santa Fe',1),
  ('Buenos Aires',1),
  ('Santa Catarina',2),
  ('Mendoza',1),
  ('Ciudad de México',3),
  ('La Rioja',1),
  ('Salta',1),
  ('San José',7),
  ('Neuquen',1),
  ('Bogotá',5), 
  ('São Paulo',2), 
  ('Entre Rios',1),
  ('La Pampa',1), 
  ('Rio Grande',1),
  ('La Paz',8),
  ('Montevideo',6),
  ('Rio Grande Do Sud',2);
  
  INSERT INTO city (city_name,id_state)
  VALUES 
  ('Córdoba',1),
  ('Rosario',2),
  ('La Paz',16),
  ('Ciudad Autonoma de Buenos Aires',3),
  ('Bogotá',5),
  ('Rio de Janeiro',4),
  ('São Paulo',12),
  ('San José',9),
  ('San Fernando del Valle',12),
  ('Bahia Blanca',3),
  ('Montevideo',17), 
  ('San Salvador de Jujuy',16), 
  ('Mar del Plata',3),
  ('Porto Alegre',18), 
  ('Ciudad de México',6);
  
INSERT INTO phone (phone_number)
VALUES
  ('+5491112345678'),  -- Argentina
  ('+5511987654321'),  -- Brazil
  ('+525555543210'),  -- Mexico
  ('+5713124567'),  -- Colombia
  ('+12125551212'),  -- USA
  ('+14155555555'),  -- USA
  ('+13125555555'),  -- USA
  ('+56222345678'),  -- Chile
  ('+5114567890'),  -- Peru
  ('+58414213456'),  -- Venezuela
  ('+50688888888'),  -- Costa Rica
  ('+50377777777'),  -- El Salvador
  ('+50499999999'),  -- Honduras
  ('+50588888888'),  -- Nicaragua
  ('+59399999999'),  -- Ecuador
  ('+59822234567'); -- Uruguay
  
  
INSERT INTO address (street_address,number_street,postal_code,id_phone,id_city)
VALUES
  ('Avenida 9 de Julio', '1900', 'C1078AAB',1,1),
  ('Rua Augusta', '200', '01330-010',2,7),
  ('Calle 5ta', '123', '10500',11,8),
  ('Avenida Reforma', '1234', '01010',3,15),
  ('Calle 72', '345', '11001',4,5),
  ('Calle Sucre', '567', '7890',9,3),
  ('Calle Uruguay', '987', '12345',16,11);

INSERT INTO company_type (name_co_type)
VALUES
  ('Minorista en línea'),
  ('Mayorista'),
  ('Fabricante'),
  ('Dropshipper'),
  ('Marketplace'),
  ('Proveedor de logística'),
  ('Proveedor de pagos');
  
INSERT INTO company (name_company, tax_id_number, id_company_type, id_address)
VALUES
  ('Apple Inc.', '94-3055622', 1, 1),
  ('Microsoft Corporation', '79-4636462', 1, 2),
  ('Google LLC', '79-4636462', 1, 3),
  ('Amazon.com, Inc.', '94-1065045', 1, 4),
  ('Meta Platforms, Inc.', '94-3055622', 1, 5),
  ('Tesla, Inc.', '94-3055622', 1, 6),
  ('NVIDIA Corporation', '94-3055622', 1, 7),
  ('Intel Corporation', '94-3055622', 1, 1), 
  ('UPS', '54321987', 2, 3),
  ('Samsung Electronics', '94-3055622', 1, 3),
  ('DHL', '12345678', 2, 1),
  ('Xiaomi Corporation', '94-3055622', 1, 5),
  ('Sony Group Corporation', '94-3055622', 1, 6),
  ('LG Electronics', '94-3055622', 1, 7),
  ('FedEx', '87654321', 2, 2);
  

INSERT INTO products (name_product, price_product, description_product, id_company)
VALUES
  ('iPhone 15 Pro Max', 1299.99, 'High-end smartphone with powerful processor and advanced camera system', 1),
  ('Samsung Galaxy S24 Ultra', 1199.99, 'Premium smartphone with large display, excellent camera, and fast charging', 2),
  ('MacBook Pro 14"', 1999.99, 'Powerful laptop for professionals, with M2 Pro chip and long battery life', 3),
  ('Dell XPS 13', 1499.99, 'Sleek and lightweight laptop with high-resolution display and fast performance', 4),
  ('Sony PlayStation 5', 499.99, 'Next-gen gaming console with stunning graphics and immersive sound', 5),
  ('Microsoft Xbox Series X', 499.99, 'Powerful gaming console with 4K gaming and fast load times', 6),
  ('Nintendo Switch OLED', 349.99, 'Portable gaming console with a vibrant OLED display', 7),
  ('Apple Watch Series 9', 399.99, 'Smartwatch with advanced health tracking and fitness features', 1),
  ('Samsung Galaxy Watch 6', 299.99, 'Versatile smartwatch with long battery life and stylish design', 2),
  ('Sony WH-1000XM5', 399.99, 'Premium noise-canceling headphones with excellent sound quality', 8),
  ('Bose QuietComfort 45', 329.99, 'Comfortable noise-canceling headphones with customizable sound', 9),
  ('Apple AirPods Pro (2nd Gen)', 249.99, 'Wireless earbuds with active noise cancellation and spatial audio', 1),
  ('Samsung Galaxy Buds 2 Pro', 199.99, 'Compact earbuds with high-quality sound and ANC', 2),
  ('LG OLED C3 Series', 1299.99, 'Immersive OLED TV with stunning picture quality and Dolby Vision', 10),
  ('Samsung Neo QLED 8K', 2999.99, 'High-resolution TV with incredible brightness and contrast', 2);
 
INSERT INTO delivery (id_company)
VALUES
(15),
(9),
(11),
(15);

INSERT INTO payment_methods (payment_type)
VALUES
  ('Tarjeta de Crédito'),
  ('Tarjeta de Débito'),
  ('PayPal'),
  ('Transferencia Bancaria'),
  ('Efectivo');

  
INSERT INTO users (name_user, last_name_user, identification_id, email, user_password, id_address, id_payment)
VALUES
  ('John', 'Doe', '12345678', 'johndoe@gmail.com', 'P@ssw0rd1', 1, 1),
  ('Jane', 'Smith', '98765432', 'janesmith@outlook.com', 'S3cr3t2', 2, 3),
  ('Michael', 'Johnson', '11223344', 'mjohnson@yahoo.com', 'P@ssw0rd3', 3,4),
  ('Emily', 'Brown', '44556677', 'ebrown@hotmail.com', 'S3cr3t4', 4, 4),
  ('David', 'Lee', '77889900', 'dlee@gmail.com', 'P@ssw0rd5', 5, 5),
  ('Ethan', 'Davis', '55667788', 'edavis@yahoo.com', 'P@ssw0rd7', 7, 5),
  ('Olivia', 'Miller', '88990011', 'omiller@hotmail.com', 'S3cr3t8', 5, 2);

  INSERT INTO cart (users_id)
  VALUES 
    (3),
    (4),
    (7),
    (2),
    (3);
    
  INSERT INTO cart_items (cart_id, products_id)
  VALUES 
    (1,3),
    (1,9),
    (1,15),
    (1,13),
    (2,3),
    (2,14),
    (2,6),
    (2,4),
    (3,1),
    (3,15),
    (3,4),
    (3,8),
    (1,2),
    (1,10),
    (1,15),
    (1,6),
    (5,3),
    (5,7),
    (5,9),
    (5,6);
    


INSERT INTO order_purchase (total_order_price, order_created, id_cart, id_user, id_delivery)
VALUES
  (1299.99, supercerca.fx_get_date_random(), 1, 1, 1),  -- iPhone 15 Pro Max (user John Doe)
  (1499.99, supercerca.fx_get_date_random(), 3, 2, 2),  -- MacBook Pro 14" (user Jane Smith)
  (499.99, supercerca.fx_get_date_random(), 5, 3, 3); -- Sony PlayStation 5 (user Michael Johnson);