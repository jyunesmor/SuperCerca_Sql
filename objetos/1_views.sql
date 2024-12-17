-- VIEW --
USE supercerca;

--  Esta View nos muestra los nombres de los productos junto a su empresa fabricante y el precio del mismo


CREATE 
  OR REPLACE
  VIEW vw_products_by_company 
  AS
    SELECT 
      p.name_product AS Product,
      c.name_company AS Company,
      p.price_product AS Price
    FROM products AS p
    INNER JOIN company AS c
      USING(id_company)
    ORDER BY name_company;

--  Esta View nos muestra la cantidad Productos adquiridos por cada Usuario

CREATE 
  OR REPLACE 
  VIEW vw_quantity_product_by_users 
  AS
    SELECT 
        u.name_user
    ,   COUNT(u.id_user)
    FROM supercerca.users AS u
    INNER JOIN supercerca.cart AS c
        ON u.id_user = c.users_id    
    INNER JOIN supercerca.cart_items AS ci
        ON c.id_cart = ci.cart_id
    GROUP BY      
       ci.cart_id; 

--  Esta View nos muestra los Productos mas Vendidos de manera Descendente


CREATE 
  OR REPLACE 
  VIEW vw_List_Most_Sale_Product 
  AS   
    SELECT 
        p.name_product
    ,   COUNT(p.id_product) AS Cant_ventas
    FROM supercerca.users AS u
    INNER JOIN supercerca.cart AS c
        ON u.id_user = c.users_id    
    INNER JOIN supercerca.cart_items AS ci
        ON c.id_cart = ci.cart_id
    INNER JOIN supercerca.products AS p 
        ON  ci.products_id = p.id_product 
    GROUP BY
       p.name_product
    ORDER BY
       Cant_ventas DESC;
        

CREATE 
  OR REPLACE 
  VIEW vw_list_total_sale_by_company 
  AS   
    SELECT 
        co.name_company
    ,   COUNT(p.id_product) As Cant_de_Productos_Vendidos
    ,   SUM(p.price_product) AS Valor_Total_de_Ventas
    FROM supercerca.users AS u
    INNER JOIN supercerca.cart AS c
        ON u.id_user = c.users_id    
    INNER JOIN supercerca.cart_items AS ci
        ON c.id_cart = ci.cart_id
    INNER JOIN supercerca.products AS p 
        ON  ci.products_id = p.id_product 
    INNER JOIN supercerca.company AS co
        ON co.id_company = p.id_company
    GROUP BY
       co.name_company
    ORDER BY
       Cant_de_Productos_Vendidos DESC;


--  Esta View mostrara el listado de compras detalladas con sus usuarios 

CREATE
 OR REPLACE
 VIEW vw_list_history_orders
 AS
  SELECT
    o.id_order AS N°_de_Orden
  , concat(u.last_name_user,', ',u.name_user) AS Nombre_y_Apellido
  , u.email AS Correo_electronico
  , pm.payment_type AS Metodo_Pago
  , p.phone_number
  , o.order_created AS Fecha_pedido
  , supercerca.fx_get_total_price_cart(c.id_cart) AS Valor_Total_Pedido
  , co.name_company
  FROM supercerca.order_purchase AS o
  INNER JOIN supercerca.cart AS c
    USING(id_cart)
  INNER JOIN supercerca.users AS u
    USING(id_user)
  INNER JOIN supercerca.payment_methods AS pm
    USING(id_payment)
  INNER JOIN supercerca.address AS a
    USING(id_address)
  INNER JOIN supercerca.phone AS p
    USING(id_phone)
  INNER JOIN supercerca.delivery AS d
    USING(id_delivery)
  INNER JOIN supercerca.company AS co
    ON co.id_company = d.id_company
  ORDER BY o.id_order;
  
CREATE 
  OR REPLACE 
  VIEW vw_sales_by_company 
  AS   
    SELECT 
        co.name_company AS Nombre_Empresa
    ,   count(co.id_company) AS Cantidad_Ventas_por_Empresa
    FROM supercerca.users AS u
    INNER JOIN supercerca.cart AS c
        ON u.id_user = c.users_id    
    INNER JOIN supercerca.cart_items AS ci
        ON c.id_cart = ci.cart_id
    INNER JOIN supercerca.products AS p 
        ON  ci.products_id = p.id_product 
   INNER JOIN supercerca.company AS co
      USING(id_company)
  GROUP BY Nombre_Empresa;
