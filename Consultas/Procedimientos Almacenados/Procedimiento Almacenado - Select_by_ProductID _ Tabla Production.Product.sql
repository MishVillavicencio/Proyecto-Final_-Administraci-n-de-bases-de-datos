--Procedimiento Almacenado Select_by_ProductID Tabla Production.Product
CREATE PROCEDURE production.product_Select_by_ProductID
(
	@p_ProductID int
)
AS
begin
	SELECT*FROM Production.Product 
	WHERE ProductID = @p_ProductID
end;
