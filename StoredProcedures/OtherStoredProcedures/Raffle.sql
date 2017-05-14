CREATE PROCEDURE sp_raffle
AS
  BEGIN
    SELECT TOP 1 firstName, lastName FROM People WHERE idPeople =
                                                       (SELECT idPeople FROM RoleAssociation WHERE roleTitle= 'student')
      AND email IS NOT NULL
        ORDER BY NEWID()
  END
go
