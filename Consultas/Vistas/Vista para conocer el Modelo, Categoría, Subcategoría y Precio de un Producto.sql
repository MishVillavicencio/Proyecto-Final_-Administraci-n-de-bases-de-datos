--Vista para conocer el Color, Modelo, Categoría, Subcategoría y Precio de un Producto
--Enlazando 4 tablas
CREATE VIEW VProduct_Category_Subcategory_Model AS
(
	SELECT
		ProductID,
		Product.Name AS NombreProducto,
		ProductModel.Name AS Modelo,
		Color,
		ProductCategory.Name AS Categoria,
		ProductSubcategory.Name AS Subcategoria,
		ListPrice
	FROM Production.Product
	JOIN Production.ProductSubcategory ON ProductSubcategory.ProductSubcategoryID = Product.ProductSubcategoryID
	JOIN Production.ProductCategory ON ProductCategory.ProductCategoryID = ProductSubcategory.ProductCategoryID
	JOIN Production.ProductModel ON ProductModel.ProductModelID = Product.ProductModelID
);