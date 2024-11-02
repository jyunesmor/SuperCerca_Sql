<h1><center>SuperCerca_Sql</center></h1>

<center><h2>Modelo de Base de Datos para E-commerce</h2></center>

Este modelo de base de datos soporta una aplicación de comercio electrónico donde los usuarios pueden realizar pedidos de productos ofrecidos por diferentes empresas. Cada pedido genera una factura y admite varios métodos de pago. El sistema también gestiona información de direcciones, entregas y detalles sobre las empresas que ofrecen los productos.

 <center><h2>Modelo DER Ontologico de ideas para E-commerce</h2></center>

![image](https://github.com/user-attachments/assets/4f76e05c-9ee8-4aaa-a37f-7f083de70e73)

<center><h2>Modelo DER Final en Mysql para E-commerce</h2></center>

![image](https://github.com/user-attachments/assets/88434abf-50ed-417d-bc6b-1eda3267b361)

<center><h3>Tablas y Relaciones</h3></center>

## 1. `users` (usuarios)

- Almacena los datos de los usuarios, incluyendo identificación, nombre, apellido, dni, correo electrónico, paswword. y cada usuario tendra la vinculacion de 1 a M con las tablas address y payment.
  ### Atributos
  - id_user: INT, PK, Identificador único del usuario.
  - name_user: VARCHAR(256), Nombre del usuario.
  - last_name_user: VARCHAR(256), Apellido del usuario.
  - identification_id: VARCHAR(15), Identificación única, por ejemplo, número de pasaporte o DNI.
  - email: VARCHAR(256), Correo electrónico único.
  - password: VARCHAR(256), Contraseña en formato hash.
  - id_address: INT, FK que referencia address.
  - id_payment: INT, FK que referencia payment_methods.

## 2. `order_purchase` (pedidos de compra)

- Registra los pedidos de los usuarios, con detalles como el precio total, la fecha de creación y el usuario asociado, como tambien la informacion del delivery asignado.
  ### Atributos
  - id_order: INT, PK, Identificador único del pedido.
  - total_order_price: DECIMAL(10,2), Precio total del pedido.
  - order_created: TIMESTAMP, Fecha de creación del pedido.
  - id_user: INT, FK que referencia users, usuario que realiza el pedido.
  - id_delivery: INT, FK que referencia delivery, opción de entrega seleccionada.

## 3. `products` (productos)

- Contiene los datos de cada producto disponible, como nombre, precio y una breve descripción, relacionandose con la compañia a travez de una llave foranea.
  ### Atributos
  - id_product: INT, PK, Identificador único del producto.
  - name_product: VARCHAR(256), Nombre del producto.
  - price_product: DECIMAL(10,2), Precio del producto.
  - description_product: VARCHAR(256), Descripción del producto.
  - id_company: INT, FK que referencia company, indica la empresa proveedora.

## 4. `invoice` (facturas)

- Registra las facturas generadas para cada pedido donde se vinculara con los datos de la compañia y de la orden.
  ### Atributos
  - id_invoice: INT, PK, Identificador único de la factura.
  - id_company: INT, FK que referencia company, empresa que emite la factura.
  - id_order: INT, FK que referencia order_purchase, pedido correspondiente.

## 5. `delivery` (entrega)

- Describe las opciones de entrega disponibles para los pedidos gracias a su vinculo foraneo con la tabla compañia.
  ### Atributos
  - id_delivery: INT, PK, Identificador único de la entrega.
  - id_company: INT, FK que referencia company, empresa encargada de la entrega.

## 6. `company` (empresa)

- Almacena la información de las empresas que venden productos en el sistema, relacionandose con las tablas de identificación fiscal y dirección.
  ### Atributos
  - id_company: INT, PK, Identificador único de la empresa.
  - name_company: VARCHAR(256), Nombre de la empresa.
  - tax_id_number: VARCHAR(15), Identificación fiscal única.
  - id_company_type: INT, FK que referencia company_type, especifica el tipo de empresa.
  - id_address: INT, FK que referencia address, dirección principal de la empresa.

## 7. `address` (dirección)

- Guarda las direcciones de los usuarios y las empresas, incluyendo calle, número, código postal, y referencias a las tablas de país(COUNTRY), estado(STATE) y ciudad(CITY), tanto como a la tabla telefono(PHONE).
  ### Atributos
  - id_address: INT, PK, Identificador único de la dirección.
  - street_address: VARCHAR(256), Nombre de la calle.
  - number_street: VARCHAR(256), Número de la calle.
  - postal_code: VARCHAR(256), Código postal.
  - id_phone: INT, FK que referencia phone.
  - id_country: INT, FK que referencia country.

## 8. `payment_methods` (métodos de pago)

- Contiene los tipos de métodos de pago disponibles en el sistema (por ejemplo, tarjeta de crédito, PayPal).
  ### Atributos
  - id_payment: INT, PK, Identificador único del método de pago.
  - payment_type: VARCHAR(256), Nombre del método de pago (efectivo, tarjeta, etc.).

## 9. `company_type` (tipo de empresa)

- Define el tipo de empresa (por ejemplo, fabricante, distribuidor).
  ### Atributos
- id_company_type: INT, PK, Identificador único del tipo de empresa.
- name_co_type: VARCHAR(256), Nombre del tipo de empresa.

## 10. `phone` (teléfono)

- Guarda los números de teléfono relacionados con `address`.

  ### Atributos

  - id_phone: INT, PK, Identificador único del teléfono.
  - phone_number: VARCHAR(256), Número telefónico.

- Estas tablas almacenan información geográfica de los países, estados y ciudades, relacionadas con `address`.

## 11. `country` (país)

### Atributos

- id_country: INT, PK, Identificador único del país.
- country_name: VARCHAR(256), Nombre del país.
- id_state: INT, FK que referencia state.
- id_city: INT, FK que referencia city.

## 12. `state` (estado)

### Atributos

- id_state: INT, PK, Identificador único del estado.
- state_name: VARCHAR(256), Nombre del estado.

## 13. `city` (ciudad)

### Atributos

- id_city: INT, PK, Identificador único de la ciudad.
- city_name: VARCHAR(256), Nombre de la ciudad.

- <center><h2>Solución que Proporciona</h2></center>

Este modelo de datos proporciona una estructura completa para gestionar un sistema de comercio electrónico con múltiples funcionalidades, incluyendo la administración de productos, usuarios, pedidos, facturación y logística. También asegura flexibilidad para agregar distintos métodos de pago, tipos de entrega y clasificaciones de empresas. Además, cuenta con una estructura geográfica detallada para las direcciones, facilitando futuras expansiones del sistema a nivel regional o internacional.

Con esta base de datos, un equipo de desarrollo puede crear una aplicación de comercio electrónico que gestione todas las operaciones mencionadas, ofreciendo una experiencia de compra y entrega fluida para los usuarios.
