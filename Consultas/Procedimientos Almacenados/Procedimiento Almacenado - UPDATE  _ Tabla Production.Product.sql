--Procedimiento Almacenado UPDATE Tabla Production.Product
CREATE PROCEDURE production.product_UPDATE
(
	@p_ProductID int,
	@v_Name varchar(100), 
	@v_ProductNumber varchar(100),
	@v_MakeFlag bit,
	@v_FinishedGoodsFlag bit,
	@v_Color varchar(50),
	@v_SafetyStockLevel smallint,
	@v_ReorderPoint smallint,
	@v_StandardCost money,
	@v_ListPrice money,
	@v_Size varchar (50),
	@v_SizeUnitMeasureCode char (10),
	@v_NameUnitMeasure Varchar (50),
	@v_WeightUnitMeasureCode char (10),
	@v_NameWeightUnitMeasure Varchar (50),
	@v_Weight decimal(8,2),
	@v_DaysToManufacture int,
	@v_ProductLine char(10),
	@v_Class char(10),
	@v_Style char(10),
	@v_ProductSubcategoryID int,
	@v_NameSubcategory varchar (50),
	@v_ProductModelID int,
	@v_NameProductModel varchar (50),
	@v_SellStartDate datetime,
	@v_ModifiedDate datetime	
)
AS
begin
	Update production.Product
	SET
		Name=@v_Name , 
		ProductNumber =@v_ProductNumber,
		MakeFlag = @v_MakeFlag,
		FinishedGoodsFlag = @v_FinishedGoodsFlag,
		Color = @v_Color,
		SafetyStockLevel = @v_SafetyStockLevel,
		ReorderPoint = @v_ReorderPoint,
		StandardCost = @v_StandardCost,
		ListPrice = @v_ListPrice,
		Size = @v_Size,
		SizeUnitMeasureCode = @v_SizeUnitMeasureCode,
		WeightUnitMeasureCode = @v_WeightUnitMeasureCode,
		Weight = @v_Weight,
		DaysToManufacture = @v_DaysToManufacture,
		ProductLine = @v_ProductLine,
		Class = @v_Class,
		Style = @v_Style ,
		ProductSubcategoryID = @v_ProductSubcategoryID,
		ProductModelID = @v_ProductModelID,
		SellStartDate = @v_SellStartDate,
		ModifiedDate = @v_ModifiedDate
	Where 
		@p_ProductID=ProductID

end;
