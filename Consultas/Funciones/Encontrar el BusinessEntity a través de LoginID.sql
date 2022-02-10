--2. Conseguir el BusinessEntityID a trav�s de LoginID
CREATE FUNCTION HumanResources.Employee_BusinessEntityID_by_LoginID
(@p_LoginID char(100))
returns int 
AS
begin
declare @v_BusinessEntityID int
SELECT
@v_BusinessEntityID = BusinessEntityID
FROM
HumanResources.Employee
WHERE
LoginID = @p_LoginID
return @v_BusinessEntityID
end;

---A�adir una caracter�stica Constraint UNIQUE
ALTER TABLE HumanResources.Employee
ADD CONSTRAINT unique_Login UNIQUE (LoginID);

