--         7 Figuras del JOIN
--INSERTO 2 REGISTRO EN LA TABLA sales.Store para hacerlo posible
  INSERT INTO Sales.Store (BusinessEntityID, Name, SalesPersonID, Demographics,ModifiedDate )
  VALUES (2010, 'The Champion', null, null, '2014-09-12 11:15:07.497')
INSERT INTO Sales.Store (BusinessEntityID, Name, SalesPersonID, Demographics,ModifiedDate )
  VALUES (2020, 'Mountain Store', null, null, '2014-09-12 11:15:07.497')

--Todos los ID de clientes, vendedores,tiendas y nombre de las tiendas
-- INNER JOIN
SELECT
CustomerID,
PersonID,
BusinessEntityID,
Name
FROM sales.Customer
INNER JOIN Sales.Store ON Customer.StoreID = Store.BusinessEntityID

-- LEFT JOIN Todos los clientes con o sin tienda
SELECT 
CustomerID,
StoreID,
Name
FROM sales.Customer 
LEFT JOIN Sales.Store ON Customer.StoreID = Store.BusinessEntityID;

-- LEFT JOIN Todos los clientes sin tienda (NULL)
SELECT 
CustomerID,
StoreID
FROM 
sales.Customer  
LEFT JOIN Sales.Store ON Customer.StoreID = Store.BusinessEntityID 
where Store.BusinessEntityID is null;


-- RIGHT JOIN Todas las tiendas con o sin clientes
SELECT 
CustomerID,
StoreID,
Name
FROM 
sales.Customer 
RIGHT JOIN Sales.Store ON Customer.StoreID = Store.BusinessEntityID;


-- RIGHT JOIN Todas las tiendas sin clientes (NULL)
SELECT 
CustomerID,
StoreID,
Name
FROM sales.Customer 
RIGHT JOIN Sales.Store ON Customer.StoreID = Store.BusinessEntityID 
where Customer.StoreID is null;

-- FULL JOIN Clientes con tienda, clientes sin tienda y tienda y sin clientes
SELECT
CustomerID,
StoreID,
Name
FROM sales.Customer  
FULL JOIN Sales.Store ON Customer.StoreID = Store.BusinessEntityID;

-- FULL OUTER JOIN Cliente sin tienda y tienda sin clientes
SELECT 
CustomerID,
StoreID,
Name
FROM sales.Customer  
FULL OUTER JOIN Sales.Store ON Customer.StoreID = Store.BusinessEntityID
where Customer.StoreID is null OR Store.BusinessEntityID is null;
