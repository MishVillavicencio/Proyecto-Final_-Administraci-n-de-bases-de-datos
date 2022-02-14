--Crear vista para obtener el mejor Producto acompa�ado de una Subconsulta para complementar a la vista 
--POR MES
--Crear vista para para obtener el numero de productos vendidos por Mes
CREATE VIEW Sales.SalesOrderDetail_VTop_Producto_parte1 as
(
	Select
	Product.ProductID, 
	Name,
	ListPrice,
	year (SalesOrderHeader.Orderdate) as a�o,
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
--Sino estar�a imcompleta
Select
	ProductID, 
	Name,
	Sales.SalesOrderDetail_VTop_Producto_parte1.a�o,
	Sales.SalesOrderDetail_VTop_Producto_parte1.mes,
	TotalOrdenes,
	(TotalOrdenes*ListPrice) AS PrecioTotal
from Sales.SalesOrderDetail_VTop_Producto_parte1 
JOIN 
(
	SELECT
	max(TotalOrdenes) as NumOrdenes,
	a�o,
	mes
	FROM Sales.SalesOrderDetail_VTop_Producto_parte1
	Group by a�o,mes

) AS Cantidad ON Cantidad.a�o = Sales.SalesOrderDetail_VTop_Producto_parte1.a�o
AND
	Cantidad.mes = Sales.SalesOrderDetail_VTop_Producto_parte1.mes 
AND 
	Cantidad.NumOrdenes = Sales.SalesOrderDetail_VTop_Producto_parte1.TotalOrdenes
ORDER BY 
Cantidad.a�o, 
Cantidad.mes





