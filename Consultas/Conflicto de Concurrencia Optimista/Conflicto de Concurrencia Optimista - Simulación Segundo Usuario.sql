--Simulación de conflicto de concurrecia
--Segundo Usuario
--Lo ejecuto completo
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

Declare @return_value1 int

	EXEC	@return_value1 = [Purchasing].[PurchaseOrderHeader_UPDATE_SubTotal_by_PurchaseOrderID]
			@p_PurchaseOrderID = @v_PurchaseOrderID,
			@p_SubTotal = @v_SubTotal2,
			@p_LastUpdate = @v_LastUpdate


	EXEC	@return_value = [Purchasing].[PurchaseOrderHeader_Consultar_Subtotal]
			@p_PurchaseOrderID = @v_PurchaseOrderID