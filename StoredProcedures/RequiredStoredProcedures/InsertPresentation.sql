CREATE PROCEDURE [dbo].[insertPresentation]
     @speaker NVARCHAR(80),
     @presentation VARCHAR(128)
AS

BEGIN TRY
	IF NOT EXISTS
    (   SELECT  1
        FROM    People
        WHERE   firstName = SUBSTRING(@speaker, 1, CHARINDEX(' ', @speaker) - 1)
        AND     lastName = SUBSTRING(@speaker, CHARINDEX(' ', @speaker) + 1, LEN(@speaker) - CHARINDEX(' ', @speaker))
    )
	BEGIN
			IF NOT EXISTS
			(		SELECT 1
					FROM Presentation
					WHERE title = @presentation
			)
		BEGIN
			INSERT INTO People (firstName, lastName) VALUES (SUBSTRING(@speaker, 1, CHARINDEX(' ', @speaker) - 1),
					 SUBSTRING(@speaker, CHARINDEX(' ', @speaker) + 1, LEN(@speaker) - CHARINDEX(' ', @speaker)))

			INSERT INTO Presentation (speaker, title) VALUES ((SELECT idPeople from People WHERE
																																firstName = SUBSTRING(@speaker, 1, CHARINDEX(' ', @speaker) - 1) AND
																																lastName = SUBSTRING(@speaker, CHARINDEX(' ', @speaker) + 1, LEN(@speaker) - CHARINDEX(' ', @speaker))), @presentation)
		END
	END

END TRY

BEGIN CATCH

DECLARE @ErrorMessage NVARCHAR(4000);
DECLARE @ErrorSeverity INT;
DECLARE @ErrorState INT;

SELECT
	@ErrorMessage = ERROR_MESSAGE(),
	@ErrorSeverity = ERROR_SEVERITY(),
	@ErrorState = ERROR_STATE();

RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState);

END CATCH
go
