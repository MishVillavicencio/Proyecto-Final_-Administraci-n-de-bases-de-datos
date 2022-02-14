--Crear vista para obtener el mejor Producto acompañado de una Subconsulta para complementar a la vista 
--POR MES
--Crear vista para para obtener el numero de productos vendidos por Mes
CREATE VIEW Sales.SalesOrderDetail_VTop_Producto_parte1 as
(
	Select
	Product.ProductID, 
	Name,
	ListPrice,
	year (SalesOrderHeader.Orderdate) as año,
	month (SalesOrderHeader.Orderdate) as mes,
	count (SalesOrderDetail.SalesOrderID) AS TotalOrdenes
	FROM Sales.SalesOrderHeader
	JOIN sales.SalesOrderDetail ON SalesOrderDetail.SalesOrderID = SalesOrderHeader.SalesOrderID
	JOIN Production.Product ON Product.ProductID = SalesOrderDetail.ProductID
	GROUP BY 
	Product.ProductID,
	Name,
	ListPrice,
	year (SalesOrderHeader.Orderdate),
	month (SalesOrderHeader.Orderdate)
);

--Subconsulta
--Despues de realizar la vista hay que ejecutar esta conculta para obtener el producto mas vendido x Mes 
--Sino estaría imcompleta
Select
	ProductID, 
	Name,
	Sales.SalesOrderDetail_VTop_Producto_parte1.año,
	Sales.SalesOrderDetail_VTop_Producto_parte1.mes,
	TotalOrdenes,
	(TotalOrdenes*ListPrice) AS PrecioTotal
from Sales.SalesOrderDetail_VTop_Producto_parte1 
JOIN 
(
	SELECT
	max(TotalOrdenes) as NumOrdenes,
	año,
	mes
	FROM Sales.SalesOrderDetail_VTop_Producto_parte1
	Group by año,mes

) AS Cantidad ON Cantidad.año = Sales.SalesOrderDetail_VTop_Producto_parte1.año
AND
	Cantidad.mes = Sales.SalesOrderDetail_VTop_Producto_parte1.mes 
AND 
	Cantidad.NumOrdenes = Sales.SalesOrderDetail_VTop_Producto_parte1.TotalOrdenes
ORDER BY 
Cantidad.año, 
Cantidad.mes





