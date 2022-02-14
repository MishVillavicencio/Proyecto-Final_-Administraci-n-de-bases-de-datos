--Crear 2 vistas para obtener el mejor Empleado POR MES
--Crear vista para para obtener el numero de ventas por Mes
ALTER VIEW dbo.vEmployees_TopEmployeeXMes_parte1 as
(
	Select
	Orders.EmployeeID,
	FirstName + ' ' + LastName AS NombreEmpleado,
	year (Orders.Orderdate) as año,
	month (Orders.Orderdate) as mes,
	count (OrderID) AS TotalVentas
	FROM dbo.Employees
	JOIN dbo.Orders ON Employees.EmployeeID = Orders.EmployeeID
	GROUP BY 
	Orders.EmployeeID,
	FirstName + ' ' + LastName,
	year (Orders.Orderdate),
	month (Orders.Orderdate)
);

-- Crear vista para obtener el maxímo de ventas
CREATE VIEW dbo.vEmployees_TopEmployeeXMes_parte2 as
(
	Select
		EmployeeID,
		NombreEmpleado,
		dbo.vEmployees_TopEmployeeXMes_parte1.año,
		dbo.vEmployees_TopEmployeeXMes_parte1.mes,
		TotalVentas
	from dbo.vEmployees_TopEmployeeXMes_parte1 
	JOIN 
	(
		SELECT
			max(TotalVentas) as MayorNumVentas,
			año,
			mes
		FROM dbo.vEmployees_TopEmployeeXMes_parte1
		Group by 
			año,
			mes

	) AS Total ON Total.año = dbo.vEmployees_TopEmployeeXMes_parte1.año
	AND
		Total.mes = dbo.vEmployees_TopEmployeeXMes_parte1.mes 
	AND 
		Total.MayorNumVentas= dbo.vEmployees_TopEmployeeXMes_parte1.TotalVentas
);

-- Consulta del mejor empleado
SELECT
	EmployeeID,
	NombreEmpleado,
	año,
	mes,
	TotalVentas
FROM dbo.vEmployees_TopEmployeeXMes_parte2 
Order By 
	año, mes 