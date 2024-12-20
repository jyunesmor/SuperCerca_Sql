<div align="center">
 <img src="./img/logo700.png" style="width:500px"  />
<h1>SuperCerca_Sql</h1>
<h2>Modelo de Base de Datos para E-commerce</h2>
<i>SuperCerca_Coder_MySql - Yunes Mor, Juan Manuel Comision 59430</i>
</div>
<hr>P
Modelo de Base de Datos para E-commerce

Este modelo de base de datos soporta una aplicación de comercio electrónico donde los usuarios pueden realizar pedidos de productos ofrecidos por diferentes empresas. Cada pedido genera una factura y admite varios métodos de pago. El sistema también gestiona información de direcciones, entregas y detalles sobre las empresas que ofrecen los productos.

 <center><h2>Modelo DER Ontologico de ideas para E-commerce</h2></center>

![SuperCerca DER](https://github.com/user-attachments/assets/46b7309a-c19d-4c2c-ac1a-d68221be4aca)

<center><h2>Modelo DER Final en Mysql para E-commerce</h2></center>

![DER Final](https://github.com/user-attachments/assets/68cd53c6-8832-49a5-b7aa-f5689fb2d9ec)

# Database Objects

## [Views](#views)

- `vw_list_total_sale_by_company`
- `vw_list_history_orders`
- `vw_list_most_sale_product`
- `vw_quantity_product_by_users`

## [Stored Procedure](#stored-procedure)

- `sp_UpdateProductPrice`
- `sp_updateUser`
- `sp_createUser`
- `sp_createProducts`
- `sp_deleteUserById`
- `sp_deleteProductsById`
- `sp_create_order`

## [Functions](#function)

- `fx_get_name_company`
- `fx_get_total_price_cart`
- `fx_get_date_random`

## [Triggers](#triggers)

- `check_user_exists`
- `before_user_insert_password_check`
- `before_user_insert_id_check`

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

# Componentes de la Base de Datos

<p id:'views'></p>
## Views

#### 1. Vista de Ventas Totales por Empresa (vw_list_total_sale_by_company)

Esta vista agrega y muestra estadísticas de ventas para cada empresa, mostrando:

- Nombre de la empresa
- Número total de productos vendidos
- Valor total de ventas

La vista une múltiples tablas:

- `users` → `cart` → `cart_items` → `products` → `company`

Los resultados se agrupan por nombre de empresa y se ordenan por cantidad de productos vendidos en orden descendente.

```sql
-- Obtener Listado de Ventas por Compañia en Volúmen e Importe

SELECT * FROM supercerca.vw_list_sale_by_company;
```

Resultado de la consulta

<p align="center">
  <img src="image-5.png" alt="alt text">
</p>

#### 2. Vista de Historial de Pedidos (vw_list_history_orders)

Esta vista crea un informe completo del historial de pedidos que muestra:

- Número de orden
- Nombre completo del cliente (formateado como "apellido, nombre")
- Correo electrónico del cliente
- Método de pago
- Número de teléfono
- Fecha del pedido
- Valor total del pedido (calculado usando la función personalizada `fx_get_total_price_cart`)
- Nombre de la empresa

La vista combina datos de múltiples tablas:

- `order_purchase`
- `cart`
- `users`
- `payment_methods`
- `address`
- `phone`
- `delivery`
- `company`

Los resultados se ordenan por ID de orden.

```sql
-- Obtener Listado Hitstorial de Ordenes

SELECT * FROM supercerca.vw_list_history_orders;
```

Resultado de la consulta

<p align="center">
  <img src="image-1.png" alt="alt text">
</p>

#### 3. Vista de Productos por Empresa (vw_products_by_company)

Esta vista muestra el catálogo de productos organizados por empresa, incluyendo:

- Nombre del producto
- Nombre de la empresa
- Precio del producto

La vista conecta:

- `products` → `company`

Los resultados se ordenan alfabéticamente por nombre de empresa.

```sql
-- Obtener Listado Hitstorial de Ordenes

SELECT * FROM supercerca.vw_products_by_company;
```

Resultado de la consulta

<p align="center">
  <img src="image-2.png" alt="alt text">
</p>

#### 4. Vista de Cantidad de Productos por Usuario (vw_quantity_product_by_users)

Esta vista proporciona un análisis del comportamiento de compra de los usuarios, mostrando:

- Nombre del usuario
- Cantidad total de productos adquiridos por cada usuario

La vista conecta:

- `users` → `cart` → `cart_items`

Los resultados se agrupan por carrito de compra (cart_id), permitiendo ver el volumen de compras por usuario.

```sql
-- Obtener Listado Hitstorial de Ordenes

SELECT * FROM supercerca.vw_quantity_product_by_users;
```

Resultado de la consulta

<p align="center">
  <img src="image-3.png" alt="alt text">
</p>

#### 5. Vista de Productos Más Vendidos (vw_List_Most_Sale_Product)

Esta vista genera un ranking de productos según su popularidad, mostrando:

- Nombre del producto
- Cantidad de ventas de cada producto

La vista conecta:

- `users` → `cart` → `cart_items` → `products`

Los resultados se:

- Agrupan por nombre de producto
- Ordenan por cantidad de ventas en orden descendente

```sql
-- Obtener Listado Hitstorial de Ordenes

SELECT * FROM supercerca.vw_List_Most_Sale_Product;
```

Resultado de la consulta

<p align="center">
  <img src="image-4.png" alt="alt text">
</p>

Todas las vistas:

- Utilizan el esquema `supercerca` (excepto la primera vista que usa el esquema por defecto)
- Implementan `INNER JOIN` para garantizar la integridad referencial
- Usan alias de tabla para mejorar la legibilidad
- Proporcionan nombres de columnas descriptivos en español

Estas vistas están diseñadas para:

- Análisis de ventas
- Seguimiento de productos
- Métricas de rendimiento empresarial
- Comportamiento de usuarios

---

### Stored Procedure

### 1. Obtención de Datos de Usuario (sp_GetUserDetails)

Este procedimiento obtiene los datos detallados de un usuario específico:

- **Parámetros de entrada**:
  - `user_id` (INT): ID del usuario
- **Datos que retorna**:
  - Documento de identidad
  - Nombre
  - Apellido
  - Correo electrónico
  - Dirección (calle, número)
  - Ciudad
  - Provincia

Realiza joins con las tablas:

- `users` → `address` → `city` → `state`

### 2. Procedimientos de Actualización (UPDATE)

#### 2.1. Actualizar Precio de Producto (sp_UpdateProductPrice)

- **Parámetros**:
  - `product_id` (INT): ID del producto
  - `new_price` (DECIMAL): Nuevo precio
- **Función**: Actualiza el precio de un producto específico
- Utiliza transacción para garantizar la integridad

#### 2.2. Actualizar Usuario (sp_updateUser)

- **Parámetros**:
  - `_id_user` (INT)
  - `_name` (VARCHAR)
  - `_last_name` (VARCHAR)
  - `_identification_id` (VARCHAR)
  - `_email` (VARCHAR)
  - `_password` (VARCHAR)
  - `_address_id` (INT)
  - `_payment_id` (INT)
- **Función**: Actualiza todos los campos de un usuario existente
- Implementa transacción para seguridad de datos

### 3. Procedimientos de Creación (CREATE)

#### 3.1. Crear Usuario Nuevo (sp_createUser)

- **Parámetros**: Mismos que sp_updateUser (excepto \_id_user)
- **Función**: Inserta un nuevo registro en la tabla users
- Utiliza transacción para garantizar la integridad

#### 3.2. Crear Productos Nuevos (sp_createProducts)

- **Parámetros**:
  - `_name_product` (VARCHAR)
  - `_price_product` (DECIMAL)
  - `_description_product` (VARCHAR)
  - `_id_company` (INT)
- **Función**: Inserta un nuevo producto en la base de datos

#### 3.3. Crear Orden (sp_create_order)

- **Parámetros**:
  - `_id_cart` (INT)
  - `_id_user` (INT)
  - `_id_delivery` (INT)
- **Funcionalidad**:
  - Utiliza función `fx_get_date_random()` para fecha
  - Calcula precio total con `fx_get_total_price_cart()`
  - Crea nueva orden de compra

### 4. Procedimientos de Eliminación (DELETE)

#### 4.1. Eliminar Usuario (sp_deleteUserById)

- **Parámetros**:
  - `user_id` (INT)
- **Características**:
  - Desactiva verificación de claves foráneas
  - Utiliza transacción
  - Elimina usuario del esquema supercerca

#### 4.2. Eliminar Producto (sp_deleteProductsById)

- **Parámetros**:
  - `product_id` (INT)
- **Características**:
  - Similar a eliminación de usuario
  - Desactiva verificación de claves foráneas
  - Opera dentro de una transacción

### Detalles Técnicos

Todos los procedimientos:

- Utilizan el esquema `supercerca`
- Implementan transacciones para garantizar la integridad de datos
- Incluyen manejo de DELIMITER para su correcta definición
- Los procedimientos de eliminación desactivan temporalmente la verificación de claves foráneas

# Documentación de Funciones

## 1. Obtener Nombre de Empresa (fx_get_name_company)

### Descripción

Función que retorna el nombre completo de una empresa incluyendo su número de identificación fiscal.

### Detalles Técnicos

- **Tipo**: `READS SQL DATA`
- **Parámetros de entrada**:
  - `company_id` (INT): ID de la empresa
- **Retorna**: VARCHAR(512)
- **Formato de retorno**: "Nombre Empresa (Número Fiscal)"

### Funcionamiento

- Realiza una consulta a la tabla `company`
- Concatena el nombre de la empresa con su número de identificación fiscal
- Retorna el string formateado

## 2. Calcular Valor Total del Carrito (fx_get_total_price_cart)

### Descripción

Función que calcula el valor total de los productos en un carrito de compras específico.

### Detalles Técnicos

- **Tipo**: `DETERMINISTIC`
- **Parámetros de entrada**:
  - `_id_cart` (INT): ID del carrito
- **Retorna**: DECIMAL(10,2)

### Funcionamiento

- Realiza joins entre las tablas:
  - `users` → `cart` → `cart_items` → `products`
- Calcula la suma total de los precios de productos
- Filtra por el ID de carrito específico
- Retorna el valor total calculado

## 3. Generar Fecha Aleatoria (fx_get_date_random)

### Descripción

Función que genera una fecha aleatoria entre el 1 de enero de 2020 y el 13 de diciembre de 2024.

### Detalles Técnicos

- **Tipo**: `NO SQL`
- **Parámetros de entrada**: Ninguno
- **Retorna**: DATE

### Funcionamiento

- Utiliza `DATE_ADD` y `RAND()` para generar una fecha aleatoria
- Rango de fechas:
  - Fecha inicial: '2020-01-01'
  - Fecha final: '2024-12-13'
- Calcula un intervalo aleatorio de días dentro de este rango

## Características Comunes

Todas las funciones:

- Incluyen manejo de DELIMITER
- Tienen declaración DROP FUNCTION IF EXISTS para evitar errores
- Especifican claramente el tipo de datos de retorno
- Incluyen características de determinismo apropiadas
- Utilizan declaraciones de variables locales cuando es necesario

## Uso en el Sistema

Estas funciones se utilizan principalmente para:

1. Formatear información de empresas
2. Calcular totales de carritos de compra
3. Generar fechas aleatorias para órdenes de prueba o simulación

Las funciones están diseñadas para ser reutilizables y mantener la consistencia en el formato y cálculos a través de toda la aplicación.

# Documentación de Triggers de Base de Datos

## 1. Verificación de Usuario Existente (check_user_exists)

### Descripción

Trigger que verifica la duplicidad de usuarios antes de realizar una inserción en la tabla `users`.

### Detalles Técnicos

- **Momento de Ejecución**: BEFORE INSERT
- **Nivel**: FOR EACH ROW
- **Tabla**: users

### Verificaciones

1. **ID de Usuario**:

   - Verifica si el ID ya existe en la tabla
   - Lanza error si encuentra duplicado
   - Mensaje: "El usuario con el ID ingresado ya existe."

2. **Correo Electrónico**:
   - Verifica si el email ya está registrado
   - Lanza error si encuentra duplicado
   - Mensaje: "El correo electrónico ya está registrado."

## 2. Validación de Contraseña (before_user_insert_password_check)

### Descripción

Trigger que verifica la longitud mínima de la contraseña antes de insertar un nuevo usuario.

### Detalles Técnicos

- **Momento de Ejecución**: BEFORE INSERT
- **Nivel**: FOR EACH ROW
- **Tabla**: users

### Validación

- Verifica que la contraseña tenga al menos 6 caracteres
- Lanza error si la longitud es menor
- Mensaje: "Password must be at least 6 characters long"

## 3. Validación de Número de Identificación (before_user_insert_id_check)

### Descripción

Trigger que valida el formato del número de identificación del usuario.

### Detalles Técnicos

- **Momento de Ejecución**: BEFORE INSERT
- **Nivel**: FOR EACH ROW
- **Tabla**: users

### Validación

- Utiliza expresión regular: `^[0-9]{5,15}$`
- Verifica que:
  - Solo contenga números
  - Tenga entre 5 y 15 dígitos
- Lanza error si el formato es inválido
- Mensaje: "Invalid identification number format"

## Características Comunes

Todos los triggers:

- Utilizan la sintaxis DELIMITER para su definición
- Incluyen manejo de errores con SIGNAL SQLSTATE
- Se ejecutan antes de la inserción (BEFORE INSERT)
- Validan datos críticos del usuario
- Previenen la inserción de datos inválidos

## Propósito en el Sistema

Estos triggers aseguran:

1. La unicidad de usuarios en el sistema
2. La seguridad de las contraseñas
3. La validez de los documentos de identidad
4. La integridad de los datos de usuario

## Recomendaciones de Uso

- Asegurar que las aplicaciones cliente manejen apropiadamente los mensajes de error
- Considerar estos requisitos al diseñar formularios de registro
- Documentar los formatos requeridos en la interfaz de usuario

## Ejemplos de Uso

### Uso de Vistas

```sql
-- Obtener productos por empresa
SELECT * FROM products_by_company;

-- Obtener pedidos del usuario actual
SELECT * FROM user_orders;
```
