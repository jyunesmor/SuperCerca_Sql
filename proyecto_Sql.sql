DROP DATABASE IF EXISTS supercerca;
CREATE DATABASE supercerca;
USE supercerca;

CREATE TABLE users(
  id_user INT NOT NULL,
  name_user VARCHAR(256) NOT NULL,
  last_name_user VARCHAR(256) NOT NULL,
  identification_id VARCHAR(15) NOT NULL,
  email VARCHAR(256) NOT NULL,
  password VARCHAR(10) NOT NULL, 
  id_address INT, 
  id_payment INT, 

  PRIMARY KEY(id_user)
);

CREATE TABLE products(
  id_product INT NOT NULL,
  name_product VARCHAR(256) NOT NULL,
  price_product DECIMAL(10,2) NOT NULL,
  description_product VARCHAR(256) NOT NULL,
  id_company INT NOT NULL, 

  PRIMARY KEY(id_product)
);

CREATE TABLE company(
  id_company INT NOT NULL,
  name_company VARCHAR(256) NOT NULL,
  tax_id_number VARCHAR(15) NOT NULL,
  id_company_type INT NOT NULL, 
  id_address INT,

  PRIMARY KEY(id_company)
);

CREATE TABLE company_type(
  id_company_type INT NOT NULL,
  name_co_type VARCHAR(256) NOT NULL,

  PRIMARY KEY(id_company_type)
);

CREATE TABLE address(
  id_address INT NOT NULL,
  street_address VARCHAR(256) NOT NULL,
  number_street VARCHAR(256) NOT NULL,
  postal_code VARCHAR(256) NOT NULL,
  id_phone INT NOT NULL,
  id_country INT NOT NULL, 

  PRIMARY KEY(id_address)
);

CREATE TABLE order_purchase(
  id_order INT NOT NULL,
  total_order_price INT NOT NULL,
  order_created DATE NOT NULL DEFAULT(CURRENT_TIMESTAMP),
  id_product INT NOT NULL,
  id_user  INT NOT NULL, 
  id_delivery INT NOT NULL, 

  PRIMARY KEY(id_order)
);

CREATE TABLE payment_methods(
  id_payment INT NOT NULL,
  payment_type VARCHAR(256),

  PRIMARY KEY(id_payment)
);

CREATE TABLE invoice(
  id_invoice INT NOT NULL,
  id_company INT NOT NULL, 
  id_order INT NOT NULL, 

  PRIMARY KEY(id_invoice)
);

CREATE TABLE delivery(
  id_delivery INT NOT NULL,
  id_company INT NOT NULL, 

  PRIMARY KEY(id_delivery)
);

CREATE TABLE phone(
  id_phone INT NOT NULL,
  phone_number VARCHAR(256) NOT NULL,

  PRIMARY KEY(id_phone)
);

CREATE TABLE country(
  id_country INT NOT NULL,
  country_name VARCHAR(256) NOT NULL,
  id_state INT NOT NULL, 
  id_city INT NOT NULL,

  PRIMARY KEY(id_country)
);

CREATE TABLE state(
  id_state INT NOT NULL,
  state_name VARCHAR(256) NOT NULL,

  PRIMARY KEY(id_state)
);

CREATE TABLE city(
  id_city INT NOT NULL,
  city_name VARCHAR(256) NOT NULL,

  PRIMARY KEY(id_city)
);

-- FOREIGN KEY

-- USERS

ALTER TABLE users
  ADD CONSTRAINT fk_constraint_id_address_u FOREIGN KEY (id_address) 
  REFERENCES address(id_address);

ALTER TABLE users
  ADD CONSTRAINT fk_constraint_id_payment FOREIGN KEY (id_payment) 
  REFERENCES payment_methods(id_payment);

-- PRODUCTS

ALTER TABLE products
  ADD CONSTRAINT fk_constraint_id_company_p FOREIGN KEY (id_company) 
  REFERENCES company(id_company);

-- ORDER_PURCHASE

ALTER TABLE order_purchase
  ADD CONSTRAINT fk_constraint_id_product FOREIGN KEY (id_product) 
  REFERENCES products(id_product);

ALTER TABLE order_purchase
  ADD CONSTRAINT fk_constraint_id_user FOREIGN KEY (id_user) 
  REFERENCES users(id_user);

ALTER TABLE order_purchase
  ADD CONSTRAINT fk_constraint_id_delivery FOREIGN KEY (id_delivery) 
  REFERENCES delivery(id_delivery);

-- COMPANY

ALTER TABLE company
  ADD CONSTRAINT fk_constraint_id_company_type FOREIGN KEY (id_company_type) 
  REFERENCES company_type(id_company_type);

ALTER TABLE company
  ADD CONSTRAINT fk_constraint_id_address_c FOREIGN KEY (id_address) 
  REFERENCES address(id_address);

-- ADDRESS

ALTER TABLE address
  ADD CONSTRAINT fk_constraint_id_country FOREIGN KEY (id_country) 
  REFERENCES country(id_country);

ALTER TABLE address
  ADD CONSTRAINT fk_constraint_id_phone FOREIGN KEY (id_phone) 
  REFERENCES phone(id_phone);

-- INVOICE

ALTER TABLE invoice
  ADD CONSTRAINT fk_constraint_id_company_i FOREIGN KEY (id_company) 
  REFERENCES company(id_company);

ALTER TABLE invoice
  ADD CONSTRAINT fk_constraint_id_order FOREIGN KEY (id_order) 
  REFERENCES order_purchase(id_order);

-- COUNTRY

ALTER TABLE country
  ADD CONSTRAINT fk_constraint_id_state FOREIGN KEY (id_state) 
  REFERENCES state(id_state);

ALTER TABLE country
  ADD CONSTRAINT fk_constraint_id_city FOREIGN KEY (id_city) 
  REFERENCES city(id_city);

-- DELIVERY

ALTER TABLE delivery
  ADD CONSTRAINT fk_constraint_id_company_d FOREIGN KEY (id_company) 
  REFERENCES company(id_company);