--Procedimiento Almacenado SelectAll Tabla Production.Product
CREATE PROCEDURE production.product_SelectAll
(
	@p_ProductID int	
)
AS
begin
	SELECT * FROM Production.Product
end;