--Procedimiento Almacenado INSERT Tabla Production.Product
CREATE PROCEDURE production.product_INSERT
(
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
--Primer SELECT
	SELECT 
		@v_SizeUnitMeasureCode = UnitMeasureCode
	From 
		production.UnitMeasure
	Where
		Name = @v_NameUnitMeasure

-- Segundo SELECT
		SELECT 
				@v_WeightUnitMeasureCode = UnitMeasureCode
			From 
				production.UnitMeasure
			Where
				Name = @v_NameWeightUnitMeasure 
	
--Tercer SELECT
			SELECT 
				@v_ProductSubcategoryID = ProductSubcategoryID
			From 
				production.ProductSubcategory
			Where
				Name = @v_NameSubcategory;

--Cuarto SELECT	
				SELECT 
					@v_ProductModelID = ProductModelID
				From 
					production.ProductModel
				Where
					Name = @v_NameProductModel;
	
	Insert into production.Product
	(
		Name, 
		ProductNumber,
		MakeFlag,
		FinishedGoodsFlag,
		Color,
		SafetyStockLevel,
		ReorderPoint,
		StandardCost,
		ListPrice,
		Size,
		SizeUnitMeasureCode,
		WeightUnitMeasureCode,
		Weight,
		DaysToManufacture,
		ProductLine,
		Class,
		Style,
		ProductSubcategoryID,
		ProductModelID,
		SellStartDate,
		ModifiedDate
	)

	VALUES
	(
		@v_Name, 
		@v_ProductNumber,
		@v_MakeFlag,
		@v_FinishedGoodsFlag,
		@v_Color,
		@v_SafetyStockLevel,
		@v_ReorderPoint,
		@v_StandardCost,
		@v_ListPrice,
		@v_Size,
		@v_SizeUnitMeasureCode,
		@v_WeightUnitMeasureCode,
		@v_Weight,
		@v_DaysToManufacture,
		@v_ProductLine,
		@v_Class,
		@v_Style,
		@v_ProductSubcategoryID,
		@v_ProductModelID,
		@v_SellStartDate,
		@v_ModifiedDate
	)
end;
