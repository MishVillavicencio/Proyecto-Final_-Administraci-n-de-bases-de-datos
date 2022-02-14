--Vista para conocer el Nombre del Cliente y Nombre del Empleado de una Orden
--Enlazando 3 tablas
CREATE VIEW VOrders_Customer_Employee AS
(
	SELECT
		OrderID,
		ContactName as NombreCliente,
		FirstName + LastName as NombreEmpleado,
		OrderDate,
		RequiredDate,
		ShippedDate,
		ShipName,
		ShipCity,
		ShipCountry
	FROM dbo.Customers
	JOIN dbo.Orders ON Customers.CustomerID = Orders.CustomerID
	JOIN dbo.Employees ON Employees.EmployeeID = Orders.EmployeeID
);