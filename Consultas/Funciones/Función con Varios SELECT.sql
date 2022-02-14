--Función conm Varios SELECT
CREATE FUNCTION dbo.Categories_ProductosVendidos_by_CategoryName
(@p_CategoryName varchar(50))
returns int
AS
begin
	declare @v_CategoryID int
	declare @v_ProductID int
	declare @v_ProductosVendidos int
	-- Primer SELECT
		SELECT
		@v_CategoryID = Products.CategoryID
		FROM
		dbo.Categories
		JOIN dbo.Products ON Categories.CategoryID = Products.CategoryID
		WHERE
		CategoryName = @p_CategoryName
	-- Segundo SELECT
		SELECT
		@v_ProductID = OrderDetails.ProductID
		FROM
		DBO.Products
		JOIN dbo.OrderDetails ON OrderDetails.ProductID = Products.ProductID
		WHERE
		CategoryID = @v_CategoryID
	-- Tercer SELECT
		SELECT
		@v_ProductosVendidos = count(OrderID)
		FROM
		dbo.OrderDetails
		JOIN dbo.Products ON OrderDetails.ProductID = @v_ProductID
		Where CategoryID = @v_CategoryID
	return @v_ProductosVendidos
end;

--Consulta a la tabla categorías (categories) usando la función que acabé de crear
SELECT
CategoryName,
dbo.Categories_ProductosVendidos_by_CategoryName (CategoryName) as ProductosVendidos
FROM dbo.Categories
