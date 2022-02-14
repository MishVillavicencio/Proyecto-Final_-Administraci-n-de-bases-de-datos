--Elaborar una lista de productos con el número de ordenes que contengan cada producto 
-- Y la suma del valor total de cada producto
-- COUNT, SUM, GROUP BY
SELECT
	Products.ProductID,
	ProductName,
	CategoryID,
	COUNT(OrderID) AS NumOrdenes,
	SUM (Products.UnitPrice) AS TotalVentasProduct
From dbo.Products
Join dbo.OrderDetails ON Products.ProductID = OrderDetails.ProductID
GROUP BY
	Products.ProductID,
	ProductName,
	CategoryID