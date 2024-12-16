-- VIEW --
USE supercerca;

--  Esta View nos muestra los nmbres de los productos junto a su empresa fabricante y el precio del mismo

DROP VIEW IF EXISTS  vw_Productsbycompany;
CREATE 
  OR REPLACE
  VIEW vw_Productsbycompany 
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

DROP VIEW IF EXISTS  vw_QuantityProductByUsers;
CREATE 
  OR REPLACE 
  VIEW vw_QuantityProductByUsers 
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

DROP VIEW IF EXISTS  vw_ListMostSaleProduct;
CREATE 
  OR REPLACE 
  VIEW vw_ListMostSaleProduct 
  AS   
    SELECT 
        p.name_product
    ,   COUNT(p.name_product) AS Cant_Productos_Mas_vendidos
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
        Cant_Productos_Mas_vendidos DESC;
        
--  Esta View mostrara el listado de compras detalladas con sus usuarios 

DROP VIEW IF EXISTS vw_list_history_orders;
CREATE
 OR REPLACE
 VIEW vw_list_history_orders
 AS
  SELECT
    o.id_order AS N°_de_Orden
  , concat(u.last_name_user,', ',u.name_user) AS Nombre_y_Apellido
  , u.email AS Correo_electronico
  , o.order_created AS Fecha_pedido
  , fx_GetTotalPriceCart(c.id_cart) AS Valor_Total_Pedido
  FROM supercerca.order_purchase AS o
  INNER JOIN supercerca.cart AS c
    USING(id_cart)
  INNER JOIN supercerca.users AS u
    USING(id_user)
  ORDER BY o.id_order;
  
DROP VIEW IF EXISTS  vw_sales_by_company;
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
