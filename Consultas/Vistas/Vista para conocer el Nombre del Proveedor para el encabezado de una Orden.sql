--Vista para conocer el Nombre del Proveedor para el encabezado de una Orden de compra
--Enlazando 2 tablas
CREATE VIEW VOrders_Customer_Employee AS
(
	SELECT
		PurchaseOrderID,
		RevisionNumber,
		Status,
		EmployeeID,
		Name as NombreProveedor,
		OrderDate,
		ShipDate,
		SubTotal,
		TaxAmt,
		PurchaseOrderHeader.ModifiedDate
	FROM Purchasing.Vendor
	JOIN Purchasing.PurchaseOrderHeader ON PurchaseOrderHeader.VendorID = Vendor.BusinessEntityID
);

