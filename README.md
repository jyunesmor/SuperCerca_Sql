  <div align="center">
   <img src="./img/logo700.png" style="width:500px"  />
  <h1>SuperCerca_Sql</h1>
  <h2>Modelo de Base de Datos para E-commerce</h2>
  <i>SuperCerca_Coder_MySql - Yunes Mor, Juan Manuel Comision 59430</i>
  </div>
  <hr>

# Base de Datos SupercCerca

- [`Introducción`](#intro)
- [`Objetivos`](#obje)
- [`Situación Problemática`](#sit-pro)
- [`Modelo de Negocio`](#mod)
- [`Diagrama Entidad Relacion`](#der)
- [`Tables`](#tb)
- [`Objets`](#ob)
- [`Creacion y Completado Base de Datos`](#scripts)

<a name="mod"></a>

## Modelo de Negocio

### Sistema de Gestión de Base de Datos de E-Commerce

### Descripción General

Este proyecto implementa un sistema de gestión de base de datos integral para una plataforma de comercio electrónico, que incluye vistas, procedimientos almacenados, funciones y triggers para administrar usuarios, productos y pedidos.

Este modelo de base de datos soporta una aplicación de comercio electrónico donde los usuarios pueden realizar pedidos de productos ofrecidos por diferentes empresas. Cada pedido genera una factura y admite varios métodos de pago. El sistema también gestiona información de direcciones, entregas y detalles sobre las empresas que ofrecen los productos.

### Solución que Proporciona

Este modelo de datos proporciona una estructura completa para gestionar un sistema de comercio electrónico con múltiples funcionalidades, incluyendo la administración de productos, usuarios, pedidos, facturación y logística. También asegura flexibilidad para agregar distintos métodos de pago, tipos de entrega y clasificaciones de empresas. Además, cuenta con una estructura geográfica detallada para las direcciones, facilitando futuras expansiones del sistema a nivel regional o internacional.

Con esta base de datos, un equipo de desarrollo puede crear una aplicación de comercio electrónico que gestione todas las operaciones mencionadas, ofreciendo una experiencia de compra y entrega fluida para los usuarios.

---

<a name="der"></a>

## Diagrama Entidad Relacion

### Modelo DER Ontologico de ideas para E-commerce

![SuperCerca DER](https://github.com/user-attachments/assets/46b7309a-c19d-4c2c-ac1a-d68221be4aca)

### Modelo DER Final en Mysql para E-commerc

![DER Final](https://github.com/user-attachments/assets/68cd53c6-8832-49a5-b7aa-f5689fb2d9ec)

---

<a name="tb"></a>

## Tablas y Relaciones

### 1. Usuarios (`users`)

- Almacena los datos de los usuarios, incluyendo identificación, nombre, apellido, dni, correo electrónico, paswword. y cada usuario tendra la vinculacion de 1 a M con las tablas address y payment.
- #### Atributos
  | Atributo          | Tipo         | Descripción                                              |
  | ----------------- | ------------ | -------------------------------------------------------- |
  | id_user           | INT          | Identificador único del usuario (AUTO_INCREMENT)         |
  | name_user         | VARCHAR(256) | Nombre del usuario                                       |
  | last_name_user    | VARCHAR(256) | Apellido del usuario                                     |
  | identification_id | VARCHAR(15)  | Número de identificación del usuario                     |
  | email             | VARCHAR(256) | Correo electrónico del usuario                           |
  | user_password     | VARCHAR(10)  | Contraseña del usuario                                   |
  | id_address        | INT          | Clave foránea que relaciona con la tabla address         |
  | id_payment        | INT          | Clave foránea que relaciona con la tabla payment_methods |

### 2. Ordenes de Pedidos (`order_purchase`)

- Registra los pedidos de los usuarios, con detalles como el precio total, la fecha de creación y el usuario asociado, como tambien la informacion del delivery asignado.
- #### Atributos
  | Atributo          | Tipo | Descripción                                               |
  | ----------------- | ---- | --------------------------------------------------------- |
  | id_order          | INT  | Identificador único de la orden (AUTO_INCREMENT)          |
  | total_order_price | INT  | Precio total de la orden                                  |
  | order_created     | DATE | Fecha de creación de la orden (DEFAULT CURRENT_TIMESTAMP) |
  | id_cart           | INT  | Clave foránea que relaciona con la tabla cart             |
  | id_user           | INT  | Clave foránea que relaciona con la tabla users            |
  | id_delivery       | INT  | Clave foránea que relaciona con la tabla delivery         |

### 3. Productos (`products`)

- Contiene los datos de cada producto disponible, como nombre, precio y una breve descripción, relacionandose con la compañia a travez de una llave foranea.
- #### Atributos
  | Atributo            | Tipo          | Descripción                                       |
  | ------------------- | ------------- | ------------------------------------------------- |
  | id_product          | INT           | Identificador único del producto (AUTO_INCREMENT) |
  | name_product        | VARCHAR(256)  | Nombre del producto                               |
  | price_product       | DECIMAL(10,2) | Precio del producto                               |
  | description_product | VARCHAR(256)  | Descripción del producto                          |
  | id_company          | INT           | Clave foránea que relaciona con la tabla company  |

### 4. Facturas (`invoice`)

- Registra las facturas generadas para cada pedido donde se vinculara con los datos de la compañia y de la orden.
- #### Atributos

| Atributo   | Tipo | Descripción                                             |
| ---------- | ---- | ------------------------------------------------------- |
| id_invoice | INT  | Identificador único de la factura (AUTO_INCREMENT)      |
| id_company | INT  | Clave foránea que relaciona con la tabla company        |
| id_order   | INT  | Clave foránea que relaciona con la tabla order_purchase |

### 5. Entrega (`delivery`)

- Describe las opciones de entrega disponibles para los pedidos gracias a su vinculo foraneo con la tabla compañia.
  #### Atributos
  | Atributo    | Tipo | Descripción                                        |
  | ----------- | ---- | -------------------------------------------------- |
  | id_delivery | INT  | Identificador único de la entrega (AUTO_INCREMENT) |
  | id_company  | INT  | Clave foránea que relaciona con la tabla company   |

### 6. Compañia (`company`)

- Almacena la información de las empresas que venden productos en el sistema, relacionandose con las tablas de identificación fiscal y dirección.
  #### Atributos
  | Atributo        | Tipo         | Descripción                                           |
  | --------------- | ------------ | ----------------------------------------------------- |
  | id_company      | INT          | Identificador único de la empresa (AUTO_INCREMENT)    |
  | name_company    | VARCHAR(256) | Nombre de la empresa                                  |
  | tax_id_number   | VARCHAR(15)  | Número de identificación fiscal                       |
  | id_company_type | INT          | Clave foránea que relaciona con la tabla company_type |
  | id_address      | INT          | Clave foránea que relaciona con la tabla address      |

### 7. Dirección (`address`)

- Guarda las direcciones de los usuarios y las empresas, incluyendo calle, número, código postal, y referencias a las tablas de país(COUNTRY), estado(STATE) y ciudad(CITY), tanto como a la tabla telefono(PHONE).
  #### Atributos
  | Atributo       | Tipo         | Descripción                                          |
  | -------------- | ------------ | ---------------------------------------------------- |
  | id_address     | INT          | Identificador único de la dirección (AUTO_INCREMENT) |
  | street_address | VARCHAR(256) | Nombre de la calle                                   |
  | number_street  | VARCHAR(256) | Número de la calle                                   |
  | postal_code    | VARCHAR(256) | Código postal                                        |
  | id_phone       | INT          | Clave foránea que relaciona con la tabla phone       |
  | id_city        | INT          | Clave foránea que relaciona con la tabla city        |

### 8. Métodos de Pago (`payment_methods`)

- Contiene los tipos de métodos de pago disponibles en el sistema (por ejemplo, tarjeta de crédito, PayPal).
- #### Atributos
  | Atributo     | Tipo         | Descripción                                             |
  | ------------ | ------------ | ------------------------------------------------------- |
  | id_payment   | INT          | Identificador único del método de pago (AUTO_INCREMENT) |
  | payment_type | VARCHAR(256) | Tipo de método de pago                                  |

### 9. `company_type` (tipo de empresa)

- Define el tipo de empresa (por ejemplo, fabricante, distribuidor).

#### Atributos

| Atributo        | Tipo         | Descripción                                              |
| --------------- | ------------ | -------------------------------------------------------- |
| id_company_type | INT          | Identificador único del tipo de empresa (AUTO_INCREMENT) |
| name_co_type    | VARCHAR(256) | Nombre del tipo de empresa                               |

### 10. Telefono (`phone`)

- Guarda los números de teléfono relacionados con `address`.

- #### Atributos

| Atributo     | Tipo         | Descripción                                       |
| ------------ | ------------ | ------------------------------------------------- |
| id_phone     | INT          | Identificador único del teléfono (AUTO_INCREMENT) |
| phone_number | VARCHAR(256) | Número de teléfono                                |

- Estas tablas almacenan información geográfica de los países, estados y ciudades, relacionadas con `address`.

### 11. País (`country`)

#### Atributos

| Atributo     | Tipo         | Descripción                                   |
| ------------ | ------------ | --------------------------------------------- |
| id_country   | INT          | Identificador único del país (AUTO_INCREMENT) |
| country_name | VARCHAR(100) | Nombre del país                               |

### 12. Estados (`state`)

#### Atributos

| Atributo   | Tipo         | Descripción                                      |
| ---------- | ------------ | ------------------------------------------------ |
| id_state   | INT          | Identificador único del estado (AUTO_INCREMENT)  |
| state_name | VARCHAR(100) | Nombre del estado                                |
| id_country | INT          | Clave foránea que relaciona con la tabla country |

### 13. Ciudad (`city`)

- #### Atributos

| Atributo  | Tipo         | Descripción                                       |
| --------- | ------------ | ------------------------------------------------- |
| id_city   | INT          | Identificador único de la ciudad (AUTO_INCREMENT) |
| city_name | VARCHAR(100) | Nombre de la ciudad                               |
| id_state  | INT          | Clave foránea que relaciona con la tabla state    |

### 14. Elementos del Carrito (`cart_items`)

Elementos individuales en el carrito de compras.

- #### Atributos
  | Atributo      | Tipo | Descripción                                                 |
  | ------------- | ---- | ----------------------------------------------------------- |
  | id_cart_Items | INT  | Identificador único del item en el carrito (AUTO_INCREMENT) |
  | cart_id       | INT  | Clave foránea que relaciona con la tabla cart               |
  | products_id   | INT  | Clave foránea que relaciona con la tabla products           |

### 15. Carrito (`cart`)

Carrito de compras de los usuarios.

- #### Atributos
  | Atributo | Tipo | Descripción                                      |
  | -------- | ---- | ------------------------------------------------ |
  | id_cart  | INT  | Identificador único del carrito (AUTO_INCREMENT) |
  | users_id | INT  | Clave foránea que relaciona con la tabla users   |

---

<a name="ob"></a>

# Database Objects

## Views

- [`vw_list_total_sale_by_company`](#vw_list_total_sale_by_company)
- [`vw_list_history_orders`](#vw_list_history_orders)
- [`vw_list_most_sale_product`](#vw_list_most_sale_product)
- [`vw_quantity_product_by_users`](#vw_quantity_product_by_users)

## Stored Procedures

- [`sp_UpdateProductPrice`](#sp_UpdateProductPrice)
- [`sp_updateUser`](#sp_updateUser)
- [`sp_createUser`](#sp_createUser)
- [`sp_createProducts`](#sp_createProducts)
- [`sp_deleteUserById`](#sp_deleteUserById)
- [`sp_deleteProductsById`](#sp_deleteProductsById)
- [`sp_create_order`](#sp_create_order)

## Functions

- [`fx_get_name_company`](#fx_get_name_company)
- [`fx_get_total_price_cart`](#fx_get_total_price_cart)
- [`fx_get_date_random`](#fx_get_date_random)

## Triggers

- [`tr.check_user_exists`](#check_user_exists)
- [`tr.before_user_insert_password_check`](#before_user_insert_password_check)
- [`tr.before_user_insert_id_check`](#before_user_insert_id_check)

## Views

#### 1. Vista de Ventas Totales por Empresa (<a name="vw_list_total_sale_by_company"></a>`vw_list_total_sale_by_company`)

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

#### 2. Vista de Historial de Pedidos (<a name="vw_list_history_orders"></a>`vw_list_history_orders`)

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

#### 3. Vista de Productos por Empresa (<a name="vw_products_by_company"></a>`vw_products_by_company`)

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

#### 5. Vista de Productos Más Vendidos (<a name="vw_List_Most_Sale_Product"></a>`vw_List_Most_Sale_Product`)

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

<a name="sp"></a>

### Stored Procedures

### 1. Obtención de Datos de Usuario (<a name="sp_GetUserDetails"></a>`sp_GetUserDetails`)

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

#### 3.1. Crear Usuario Nuevo (<a name="sp_createUser"></a>`sp_createUser`)

- **Parámetros**: Mismos que sp_updateUser (excepto \_id_user)
- **Función**: Inserta un nuevo registro en la tabla users
- Utiliza transacción para garantizar la integridad

#### 3.2. Crear Productos Nuevos (<a name="sp_createProducts"></a>`sp_createProducts`)

- **Parámetros**:
  - `_name_product` (VARCHAR)
  - `_price_product` (DECIMAL)
  - `_description_product` (VARCHAR)
  - `_id_company` (INT)
- **Función**: Inserta un nuevo producto en la base de datos

#### 3.3. Crear Orden (<a name="sp_create_order"></a>`sp_create_order`)

- **Parámetros**:
  - `_id_cart` (INT)
  - `_id_user` (INT)
  - `_id_delivery` (INT)
- **Funcionalidad**:
  - Utiliza función `fx_get_date_random()` para fecha
  - Calcula precio total con `fx_get_total_price_cart()`
  - Crea nueva orden de compra

### 4. Procedimientos de Eliminación (DELETE)

#### 4.1. Eliminar Usuario (<a name="sp_deleteUserById"></a>`sp_deleteUserById`)

- **Parámetros**:
  - `user_id` (INT)
- **Características**:
  - Desactiva verificación de claves foráneas
  - Utiliza transacción
  - Elimina usuario del esquema supercerca

#### 4.2. Eliminar Producto (<a name="sp_deleteProductsById"></a>`sp_deleteProductsById`)

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

<a name="fx"></a>

# Functions

## 1. Obtener Nombre de Empresa (<a name="fx_get_name_company"></a>`fx_get_name_company`)

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

## 2. Calcular Valor Total del Carrito (<a name="fx_get_total_price_cart"></a>`fx_get_total_price_cart`)

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

## 3. Generar Fecha Aleatoria (<a name="fx_get_date_random"></a>`fx_get_date_random`)

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

# Triggers

## 1. Verificación de Usuario Existente (<a name="tr.check_user_exists"></a>`tr.check_user_exists`)

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

## 2. Validación de Contraseña (<a name="tr.before_user_insert_password_check"></a>`tr.before_user_insert_password_check`)

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

## 3. Validación de Número de Identificación (<a name="tr.before_user_insert_id_check"></a>`tr.before_user_insert_id_check`)

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

### Propósito en el Sistema

Estos triggers aseguran:

1. La unicidad de usuarios en el sistema
2. La seguridad de las contraseñas
3. La validez de los documentos de identidad
4. La integridad de los datos de usuario

### Recomendaciones de Uso

- Asegurar que las aplicaciones cliente manejen apropiadamente los mensajes de error
- Considerar estos requisitos al diseñar formularios de registro
- Documentar los formatos requeridos en la interfaz de usuario

<a name="scripts"></a>

## Listados Scripts

- Para la creacion de la base de datos y completado de la misma, se utilizaron dos Scripts abajo vinculados para su observación y control:
