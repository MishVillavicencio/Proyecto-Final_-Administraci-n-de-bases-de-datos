--Simulación de conflicto de concurrecia
--Primer Usuario
Declare 
	@v_PurchaseOrderID int = 5, 
	@v_SubTotal1 money = 22101.20,
	@v_SubTotal2 money = 21458.15,
	@v_LastUpdate timestamp 

	DECLARE	@return_value int

	EXEC	@return_value = [Purchasing].[PurchaseOrderHeader_Consultar_Subtotal]
			@p_PurchaseOrderID = @v_PurchaseOrderID

	Select
			@v_LastUpdate = LastUpdate
	FROM
			Purchasing.PurchaseOrderHeader
	Where 
			PurchaseOrderID = @v_PurchaseOrderID
--Copiamos y guardamos el LastUpdate = 0x00000000000036F4

-- Despues de realizar la consulta de arriba hacemos una pausa y ejecutamos el script del segundo cliente
-- Y luego regresamos a este script y ejecutamos este bloque de código que nos sobra

Declare 
	@v_PurchaseOrderID int = 5, 
	@v_SubTotal1 money = 22101.20,
	@v_SubTotal2 money = 21458.15,
	@v_LastUpdate timestamp 

	Set @v_LastUpdate = 0x00000000000036F4

	DECLARE	@return_value1 int

	EXEC	@return_value1 = [Purchasing].[PurchaseOrderHeader_UPDATE_SubTotal_by_PurchaseOrderID]
			@p_PurchaseOrderID = @v_PurchaseOrderID,
			@p_SubTotal = @v_SubTotal1,
			@p_LastUpdate = @v_LastUpdate


	EXEC	@return_value1 = [Purchasing].[PurchaseOrderHeader_Consultar_Subtotal]
			@p_PurchaseOrderID = @v_PurchaseOrderID