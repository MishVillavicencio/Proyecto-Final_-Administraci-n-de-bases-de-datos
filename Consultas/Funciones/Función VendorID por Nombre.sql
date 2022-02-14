--Crear la función para encontrar el VendorID por el nombre
CREATE FUNCTION Purchasing.Vendor_VendorID_by_Name
	(@p_Name char(100))
returns int 
AS
begin
		declare @v_VendorID int
	SELECT
		@v_VendorID = BusinessEntityID
	FROM
		Purchasing.Vendor
	WHERE
		Name = @p_Name
	return @v_VendorID
end;

---Añadir una característica Constraint UNIQUE
ALTER TABLE Purchasing.Vendor
ADD CONSTRAINT unique_Name UNIQUE (Name);

--Consulta para comprobar la función 
SELECT
	Status,
	Purchasing.Vendor_VendorID_by_Name ('Cycling Master') AS VendorID,
	OrderDate,
	SubTotal, 
	TotalDue
FROM Purchasing.PurchaseOrderHeader
