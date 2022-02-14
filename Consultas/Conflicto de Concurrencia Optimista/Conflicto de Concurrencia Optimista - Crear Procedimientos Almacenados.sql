--Simulación de gestión de concurrencia Optimista 
--Crear dos procedimientos Almacenados

-- Primero Añadimos una columna TimeStamp para realizar la simulación
ALTER TABLE Purchasing.PurchaseOrderHeader
ADD	LastUpdate TimeStamp

--1. Consultar el precio y timestamp
CREATE PROCEDURE Purchasing.PurchaseOrderHeader_Consultar_Subtotal
(
	@p_PurchaseOrderID int
) 
as
Begin
	Select
		PurchaseOrderID,
		SubTotal,
		LastUpdate
	FROM
		Purchasing.PurchaseOrderHeader
	Where 
		PurchaseOrderID= @p_PurchaseOrderID
end;

--2. Actualizar el precio y timestamp
CREATE PROCEDURE Purchasing.PurchaseOrderHeader_UPDATE_SubTotal_by_PurchaseOrderID
(
	@p_PurchaseOrderID int,
	@p_SubTotal money,
	@p_LastUpdate timestamp
) 
as
Begin 
	UPDATE 
		Purchasing.PurchaseOrderHeader
	set 
		SubTotal = @p_SubTotal
	where
		PurchaseOrderID = @p_PurchaseOrderID
	and
		LastUpdate = @p_LastUpdate
end;
