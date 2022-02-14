--Crear 2 vistas y una subconsulta para obtener el mejor Cliente POR MES
--Crear vista para para obtener el numero de compras por Mes
ALTER VIEW dbo.vCustomers_TopCustomerXMes_parte1 as
(
	Select
	Orders.CustomerID,
	CompanyName,
	ContactName,
	year (Orders.Orderdate) as año,
	month (Orders.Orderdate) as mes,
	count (OrderID) AS TotalCompras
	FROM dbo.Customers
	JOIN dbo.Orders ON Customers.CustomerID = Orders.CustomerID
	GROUP BY 
	Orders.CustomerID,
	CompanyName,
	ContactName,
	year (Orders.Orderdate),
	month (Orders.Orderdate)
);

--Crear la segunda vista para encontrar los valores máximos de compras
ALTER VIEW dbo.vCustomers_TopCustomerXMes_parte2 as
(
	SELECT
		max(TotalCompras) as MayorNumCompras,
		año,
		mes
	FROM dbo.vCustomers_TopCustomerXMes_parte1
	Group by 
		año,
		mes
);

--Hacemos una subconsulta a las dos vistas
SELECT
	CustomerID,
	CompanyName,
	ContactName,
	dbo.vCustomers_TopCustomerXMes_parte1.año,
	dbo.vCustomers_TopCustomerXMes_parte1.mes,
	MayorNumCompras
From dbo.vCustomers_TopCustomerXMes_parte1
JOIN dbo.vCustomers_TopCustomerXMes_parte2
	ON dbo.vCustomers_TopCustomerXMes_parte1.TotalCompras =
	   dbo.vCustomers_TopCustomerXMes_parte2.MayorNumCompras
ORDER BY
	dbo.vCustomers_TopCustomerXMes_parte1.año,
	dbo.vCustomers_TopCustomerXMes_parte1.mes,
	MayorNumCompras

