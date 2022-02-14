--Crear 2 vistas para obtener el mejor Empleado POR MES
--Crear vista para para obtener el numero de ventas por Mes
ALTER VIEW dbo.vEmployees_TopEmployeeXMes_parte1 as
(
	Select
	Orders.EmployeeID,
	FirstName + ' ' + LastName AS NombreEmpleado,
	year (Orders.Orderdate) as a�o,
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

-- Crear vista para obtener el max�mo de ventas
CREATE VIEW dbo.vEmployees_TopEmployeeXMes_parte2 as
(
	Select
		EmployeeID,
		NombreEmpleado,
		dbo.vEmployees_TopEmployeeXMes_parte1.a�o,
		dbo.vEmployees_TopEmployeeXMes_parte1.mes,
		TotalVentas
	from dbo.vEmployees_TopEmployeeXMes_parte1 
	JOIN 
	(
		SELECT
			max(TotalVentas) as MayorNumVentas,
			a�o,
			mes
		FROM dbo.vEmployees_TopEmployeeXMes_parte1
		Group by 
			a�o,
			mes

	) AS Total ON Total.a�o = dbo.vEmployees_TopEmployeeXMes_parte1.a�o
	AND
		Total.mes = dbo.vEmployees_TopEmployeeXMes_parte1.mes 
	AND 
		Total.MayorNumVentas= dbo.vEmployees_TopEmployeeXMes_parte1.TotalVentas
);

-- Consulta del mejor empleado
SELECT
	EmployeeID,
	NombreEmpleado,
	a�o,
	mes,
	TotalVentas
FROM dbo.vEmployees_TopEmployeeXMes_parte2 
Order By 
	a�o, mes 