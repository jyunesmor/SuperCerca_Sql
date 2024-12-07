<div align="center">
 <img src="./img/logo700.png" style="width:500px"  />
<h1>SuperCerca_Sql</h1>
<h2>Modelo de Base de Datos para E-commerce</h2>
<i>SuperCerca_Coder_MySql - Yunes Mor, Juan Manuel Comision 59430</i>
</div>
<hr>
Modelo de Base de Datos para E-commerce

Este modelo de base de datos soporta una aplicación de comercio electrónico donde los usuarios pueden realizar pedidos de productos ofrecidos por diferentes empresas. Cada pedido genera una factura y admite varios métodos de pago. El sistema también gestiona información de direcciones, entregas y detalles sobre las empresas que ofrecen los productos.

 <center><h2>Modelo DER Ontologico de ideas para E-commerce</h2></center>

![SuperCerca DER](https://github.com/user-attachments/assets/46b7309a-c19d-4c2c-ac1a-d68221be4aca)

<center><h2>Modelo DER Final en Mysql para E-commerce</h2></center>

![DER](https://github.com/user-attachments/assets/d167d032-8e2c-4750-9e1e-4fd4348ea322)


<h2 align="center">Tablas y Relaciones</h2>

### 1. `users` (usuarios)

- Almacena los datos de los usuarios, incluyendo identificación, nombre, apellido, dni, correo electrónico, paswword. y cada usuario tendra la vinculacion de 1 a M con las tablas address y payment.
  #### Atributos
  - id_user: INT, PK, Identificador único del usuario.
  - name_user: VARCHAR(256), Nombre del usuario.
  - last_name_user: VARCHAR(256), Apellido del usuario.
  - identification_id: VARCHAR(15), Identificación única, por ejemplo, número de pasaporte o DNI.
  - email: VARCHAR(256), Correo electrónico único.
  - password: VARCHAR(256), Contraseña en formato hash.
  - id_address: INT, FK que referencia address.
  - id_payment: INT, FK que referencia payment_methods.

### 2. `order_purchase` (pedidos de compra)

- Registra los pedidos de los usuarios, con detalles como el precio total, la fecha de creación y el usuario asociado, como tambien la informacion del delivery asignado.
  #### Atributos
  - id_order: INT, PK, Identificador único del pedido.
  - total_order_price: DECIMAL(10,2), Precio total del pedido.
  - order_created: TIMESTAMP, Fecha de creación del pedido.
  - id_user: INT, FK que referencia users, usuario que realiza el pedido.
  - id_delivery: INT, FK que referencia delivery, opción de entrega seleccionada.

### 3. `products` (productos)

- Contiene los datos de cada producto disponible, como nombre, precio y una breve descripción, relacionandose con la compañia a travez de una llave foranea.
  #### Atributos
  - id_product: INT, PK, Identificador único del producto.
  - name_product: VARCHAR(256), Nombre del producto.
  - price_product: DECIMAL(10,2), Precio del producto.
  - description_product: VARCHAR(256), Descripción del producto.
  - id_company: INT, FK que referencia company, indica la empresa proveedora.

### 4. `invoice` (facturas)

- Registra las facturas generadas para cada pedido donde se vinculara con los datos de la compañia y de la orden.
  #### Atributos
  - id_invoice: INT, PK, Identificador único de la factura.
  - id_company: INT, FK que referencia company, empresa que emite la factura.
  - id_order: INT, FK que referencia order_purchase, pedido correspondiente.

### 5. `delivery` (entrega)

- Describe las opciones de entrega disponibles para los pedidos gracias a su vinculo foraneo con la tabla compañia.
  #### Atributos
  - id_delivery: INT, PK, Identificador único de la entrega.
  - id_company: INT, FK que referencia company, empresa encargada de la entrega.

### 6. `company` (empresa)

- Almacena la información de las empresas que venden productos en el sistema, relacionandose con las tablas de identificación fiscal y dirección.
  #### Atributos
  - id_company: INT, PK, Identificador único de la empresa.
  - name_company: VARCHAR(256), Nombre de la empresa.
  - tax_id_number: VARCHAR(15), Identificación fiscal única.
  - id_company_type: INT, FK que referencia company_type, especifica el tipo de empresa.
  - id_address: INT, FK que referencia address, dirección principal de la empresa.

### 7. `address` (dirección)

- Guarda las direcciones de los usuarios y las empresas, incluyendo calle, número, código postal, y referencias a las tablas de país(COUNTRY), estado(STATE) y ciudad(CITY), tanto como a la tabla telefono(PHONE).
  #### Atributos
  - id_address: INT, PK, Identificador único de la dirección.
  - street_address: VARCHAR(256), Nombre de la calle.
  - number_street: VARCHAR(256), Número de la calle.
  - postal_code: VARCHAR(256), Código postal.
  - id_phone: INT, FK que referencia phone.
  - id_country: INT, FK que referencia country.

### 8. `payment_methods` (métodos de pago)

- Contiene los tipos de métodos de pago disponibles en el sistema (por ejemplo, tarjeta de crédito, PayPal).
  #### Atributos
  - id_payment: INT, PK, Identificador único del método de pago.
  - payment_type: VARCHAR(256), Nombre del método de pago (efectivo, tarjeta, etc.).

### 9. `company_type` (tipo de empresa)

- Define el tipo de empresa (por ejemplo, fabricante, distribuidor).

#### Atributos

- id_company_type: INT, PK, Identificador único del tipo de empresa.
- name_co_type: VARCHAR(256), Nombre del tipo de empresa.

### 10. `phone` (teléfono)

- Guarda los números de teléfono relacionados con `address`.

  #### Atributos

  - id_phone: INT, PK, Identificador único del teléfono.
  - phone_number: VARCHAR(256), Número telefónico.

- Estas tablas almacenan información geográfica de los países, estados y ciudades, relacionadas con `address`.

### 11. `country` (país)

#### Atributos

- id_country: INT, PK, Identificador único del país.
- country_name: VARCHAR(256), Nombre del país.
- id_state: INT, FK que referencia state.
- id_city: INT, FK que referencia city.

### 12. `state` (estado)

#### Atributos

- id_state: INT, PK, Identificador único del estado.
- state_name: VARCHAR(256), Nombre del estado.

### 13. `city` (ciudad)

#### Atributos

- id_city: INT, PK, Identificador único de la ciudad.
- city_name: VARCHAR(256), Nombre de la ciudad.

<h3 align="center">Solución que Proporciona</h3>

Este modelo de datos proporciona una estructura completa para gestionar un sistema de comercio electrónico con múltiples funcionalidades, incluyendo la administración de productos, usuarios, pedidos, facturación y logística. También asegura flexibilidad para agregar distintos métodos de pago, tipos de entrega y clasificaciones de empresas. Además, cuenta con una estructura geográfica detallada para las direcciones, facilitando futuras expansiones del sistema a nivel regional o internacional.

Con esta base de datos, un equipo de desarrollo puede crear una aplicación de comercio electrónico que gestione todas las operaciones mencionadas, ofreciendo una experiencia de compra y entrega fluida para los usuarios.



# Sistema de Gestión de Base de Datos de E-Commerce

## Descripción General

Este proyecto implementa un sistema de gestión de base de datos integral para una plataforma de comercio electrónico, que incluye vistas, procedimientos almacenados, funciones y triggers para administrar usuarios, productos y pedidos.




## Componentes de la Base de Datos

### Vistas

#### 1. user_orders
- **Propósito**: Recupera los detalles de pedidos del usuario actual
- **Columnas**:
  - `order_id`: Identificador único del pedido
  - `product_name`: Nombre del producto comprado
  - `total_price`: Precio total del pedido
  - `order_date`: Fecha de creación del pedido

#### 2. products_by_company
- **Propósito**: Lista los productos con su empresa correspondiente y precio
- **Columnas**:
  - `Product`: Nombre del producto
  - `Company`: Nombre de la empresa que vende el producto
  - `Price`: Precio del producto

### Procedimientos Almacenados

#### 1. sp_GetUserDetails
- **Propósito**: Recuperar información completa del usuario, incluyendo detalles personales y de dirección
- **Entrada**: `user_id` (INT)
- **Devuelve**:
  - ID de Identificación
  - Nombre
  - Apellido
  - Correo Electrónico
  - Dirección
  - Número de Calle
  - Ciudad
  - Estado/Provincia

#### 2. sp_GetOrderDetails
- **Propósito**: Obtener información detallada de un pedido específico
- **Entrada**: `order_id` (INT)
- **Devuelve**:
  - ID de Pedido
  - Precio Total del Pedido
  - Fecha de Creación del Pedido
  - Nombre del Usuario
  - Apellido del Usuario
  - Correo Electrónico del Usuario
  - Nombre del Producto
  - ID de Empresa de Entrega

#### 3. sp_UpdateProductPrice
- **Propósito**: Actualizar el precio de un producto específico
- **Entradas**:
  - `product_id` (INT)
  - `new_price` (DECIMAL)

#### 4. sp_CreateUser
- **Propósito**: Crear un nuevo usuario en el sistema
- **Entradas**:
  - `id_user` (INT)
  - `name` (VARCHAR)
  - `last_name` (VARCHAR)
  - `identification_id` (VARCHAR)
  - `email` (VARCHAR)
  - `password` (VARCHAR)
  - `address_id` (INT)
  - `payment_id` (INT)

### Funciones

#### 1. fx_GetNameCompany
- **Propósito**: Recuperar el nombre completo de una empresa con su ID fiscal
- **Entrada**: `company_id` (INT)
- **Devuelve**: Nombre de la empresa con el ID fiscal entre paréntesis

### Triggers

#### 1. check_user_exists
- **Propósito**: Prevenir el registro de usuarios con ID o correo electrónico duplicados
- **Puntos de Activación**:
  - Antes de insertar un nuevo usuario
- **Validaciones**:
  - Verifica si el ID de usuario ya existe
  - Verifica si el correo electrónico ya está registrado
- **Acción**: Genera un error con un mensaje descriptivo si se encuentran duplicados

## Ejemplos de Uso

### Uso de Vistas

```sql
-- Obtener productos por empresa
SELECT * FROM products_by_company;

-- Obtener pedidos del usuario actual
SELECT * FROM user_orders;
