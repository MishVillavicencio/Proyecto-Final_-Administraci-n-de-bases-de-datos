--Procedimiento Almacenado SelectAll Tabla Production.Product
Alter PROCEDURE production.product_Delete
(
	@v_ProductID int	
)
AS
begin

	Delete FROM
		production.Product
	Where 
		@v_ProductID=ProductID
end;

