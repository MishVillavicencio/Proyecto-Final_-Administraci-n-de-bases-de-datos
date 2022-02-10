--         Funciones
--1. Conseguir el CategoryID a trav�s de CategoryName
CREATE FUNCTION dbo.Products_CategoryID_by_CategoryName
(@p_CategoryName nvarchar(100))
returns int
AS
begin
declare @v_CategoryID int
SELECT
	 @v_CategoryID = CategoryID
FROM
dbo.Categories
WHERE
	CategoryName = @p_CategoryName
return @v_CategoryID
end;

---A�adir una caracter�stica Constraint UNIQUE
ALTER TABLE dbo.Categories
ADD CONSTRAINT unique_Name UNIQUE (CategoryName);
