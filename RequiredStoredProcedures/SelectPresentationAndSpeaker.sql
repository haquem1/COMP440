-- =================================================
-- Author:		Maroof Haque
-- Description:	Selects presentations and their
-- associated speakers based from database
-- =================================================

CREATE PROCEDURE [dbo].[selectPresAndSpeak]
AS
BEGIN TRY
  SELECT Presentation.idPresentation, Presentation.title, People.firstName, People.lastName
    FROM Presentation
      INNER JOIN People ON People.idPeople = Presentation.speaker
      ORDER BY Presentation.idPresentation ASC
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
