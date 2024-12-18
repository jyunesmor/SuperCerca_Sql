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

![DER Final](https://github.com/user-attachments/assets/68cd53c6-8832-49a5-b7aa-f5689fb2d9ec)

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

## 1. Vista de Ventas Totales por Empresa (vw_list_total_sale_by_company)

Esta vista agrega y muestra estadísticas de ventas para cada empresa, mostrando:
- Nombre de la empresa
- Número total de productos vendidos
- Valor total de ventas

La vista une múltiples tablas:
- `users` → `cart` → `cart_items` → `products` → `company`

Los resultados se agrupan por nombre de empresa y se ordenan por cantidad de productos vendidos en orden descendente.

## 2. Vista de Historial de Pedidos (vw_list_history_orders)

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

## 3. Vista Resumen de Ventas por Empresa (vw_sales_by_company)

Esta vista proporciona un resumen simplificado de ventas por empresa:
- Nombre de la empresa
- Número total de ventas por empresa

La vista conecta:
- `users` → `cart` → `cart_items` → `products` → `company`

Los resultados se agrupan por nombre de empresa.



## 4. Vista de Productos por Empresa (vw_products_by_company)

Esta vista muestra el catálogo de productos organizados por empresa, incluyendo:
- Nombre del producto
- Nombre de la empresa
- Precio del producto

La vista conecta:
- `products` → `company`

Los resultados se ordenan alfabéticamente por nombre de empresa.

## 5. Vista de Cantidad de Productos por Usuario (vw_quantity_product_by_users)

Esta vista proporciona un análisis del comportamiento de compra de los usuarios, mostrando:
- Nombre del usuario
- Cantidad total de productos adquiridos por cada usuario

La vista conecta:
- `users` → `cart` → `cart_items`

Los resultados se agrupan por carrito de compra (cart_id), permitiendo ver el volumen de compras por usuario.

## 6. Vista de Productos Más Vendidos (vw_List_Most_Sale_Product)

Esta vista genera un ranking de productos según su popularidad, mostrando:
- Nombre del producto
- Cantidad de ventas de cada producto

La vista conecta:
- `users` → `cart` → `cart_items` → `products`

Los resultados se:
- Agrupan por nombre de producto
- Ordenan por cantidad de ventas en orden descendente

## 7. Vista de Ventas Totales por Empresa (vw_list_total_sale_by_company)

Esta vista proporciona métricas comerciales clave por empresa:
- Nombre de la empresa
- Cantidad de productos vendidos
- Valor total de ventas

La vista conecta:
- `users` → `cart` → `cart_items` → `products` → `company`

Los resultados se:
- Agrupan por nombre de empresa
- Ordenan por cantidad de productos vendidos en orden descendente

## Detalles Técnicos

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

# Documentación de Procedimientos Almacenados (Stored Procedures)

## 1. Obtención de Datos de Usuario (sp_GetUserDetails)

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

## 2. Procedimientos de Actualización (UPDATE)

### 2.1. Actualizar Precio de Producto (sp_UpdateProductPrice)
- **Parámetros**:
  - `product_id` (INT): ID del producto
  - `new_price` (DECIMAL): Nuevo precio
- **Función**: Actualiza el precio de un producto específico
- Utiliza transacción para garantizar la integridad

### 2.2. Actualizar Usuario (sp_updateUser)
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

## 3. Procedimientos de Creación (CREATE)

### 3.1. Crear Usuario Nuevo (sp_createUser)
- **Parámetros**: Mismos que sp_updateUser (excepto _id_user)
- **Función**: Inserta un nuevo registro en la tabla users
- Utiliza transacción para garantizar la integridad

### 3.2. Crear Productos Nuevos (sp_createProducts)
- **Parámetros**:
  - `_name_product` (VARCHAR)
  - `_price_product` (DECIMAL)
  - `_description_product` (VARCHAR)
  - `_id_company` (INT)
- **Función**: Inserta un nuevo producto en la base de datos

### 3.3. Crear Orden (sp_create_order)
- **Parámetros**:
  - `_id_cart` (INT)
  - `_id_user` (INT)
  - `_id_delivery` (INT)
- **Funcionalidad**:
  - Utiliza función `fx_get_date_random()` para fecha
  - Calcula precio total con `fx_get_total_price_cart()`
  - Crea nueva orden de compra

## 4. Procedimientos de Eliminación (DELETE)

### 4.1. Eliminar Usuario (sp_deleteUserById)
- **Parámetros**: 
  - `user_id` (INT)
- **Características**:
  - Desactiva verificación de claves foráneas
  - Utiliza transacción
  - Elimina usuario del esquema supercerca

### 4.2. Eliminar Producto (sp_deleteProductsById)
- **Parámetros**: 
  - `product_id` (INT)
- **Características**:
  - Similar a eliminación de usuario
  - Desactiva verificación de claves foráneas
  - Opera dentro de una transacción

## Detalles Técnicos

Todos los procedimientos:
- Utilizan el esquema `supercerca`
- Implementan transacciones para garantizar la integridad de datos
- Incluyen manejo de DELIMITER para su correcta definición
- Los procedimientos de eliminación desactivan temporalmente la verificación de claves foráneas

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
