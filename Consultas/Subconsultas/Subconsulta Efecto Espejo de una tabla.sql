--Crear tabla para aplicar la subconsulta para aplicar una tabla efecto (espejo) 
--Para simular el ejercicio 18 del grupo de 150 consultas que realizamos al prinicipio
CREATE TABLE purchasing.VendorTerritory (
    VendorID integer NOT NULL,
    TerritoryID varchar(20) NOT NULL,
    RegionID integer NOT NULL,
	CONSTRAINT fk_vendor FOREIGN KEY (VendorID)
    REFERENCES Purchasing.Vendor (BusinessEntityID),
	CONSTRAINT fk_territory FOREIGN KEY (TerritoryID)
    REFERENCES dbo.Territories (TerritoryID),
	CONSTRAINT fk_region FOREIGN KEY (RegionID)
    REFERENCES dbo.Region (RegionID)
);

--Insertar Valores en la tabla
INSERT INTO Purchasing.VendorTerritory VALUES (1500,'02903',4);
INSERT INTO Purchasing.VendorTerritory VALUES (1494,'20852',2);
INSERT INTO Purchasing.VendorTerritory VALUES (1506,'31406',1);

--Consultar los vendedores con la region y el territorio con la region 
SELECT 
	Purchasing.VendorTerritory.VendorID,                              -- ProveedorID
	Purchasing.VendorTerritory.RegionID,                              -- RegionID Proveedor
	Region.RegionDescription,                                         -- Región del Proveedor
	Purchasing.VendorTerritory.TerritoryID,                           -- TerritorioID
	RegionTerritory.RegionID TerritoryRegionID,                       -- RegionID Proveedor
	RegionTerritory.RegionDescription as NombreRegionTerritory        -- Región del Territorio
FROM Purchasing.VendorTerritory 
	JOIN Purchasing.Vendor ON Purchasing.Vendor.BusinessEntityID = Purchasing.VendorTerritory.VendorID
	JOIN dbo.Territories ON Territories.TerritoryID = Purchasing.VendorTerritory.TerritoryID
	JOIN dbo.Region ON Region.RegionID = Purchasing.VendorTerritory.RegionID  --Region del Proveedor
	JOIN dbo.Region RegionTerritory ON RegionTerritory.RegionID = Territories.RegionID; --Region del Territorio