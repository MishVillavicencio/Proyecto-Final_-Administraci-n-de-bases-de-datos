--Crear la función para encontrar el VendorID por el nombre
CREATE FUNCTION dbo.Customers_CustomerID_by_CompanyName
	(@p_CompanyName char(100))
returns char(5) 
AS
begin
		declare @v_CustomerID char(5)
	SELECT
		@v_CustomerID = CustomerID
	FROM
		dbo.Customers
	WHERE 
		CompanyName = @p_CompanyName
	return @v_CustomerID
end;

---Añadir una característica Constraint UNIQUE
ALTER TABLE dbo.Customers
ADD CONSTRAINT unique_CompanyName UNIQUE (CompanyName);

--Consulta para comprobar la función 
SELECT
	OrderID,
	dbo.Customers_CustomerID_by_CompanyName ('Around the Horn') AS CustomerID,
	OrderDate,
	ShipCity, 
	ShipCountry
FROM dbo.Orders
