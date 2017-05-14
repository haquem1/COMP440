CREATE PROCEDURE [dbo].[selectPresTrackBudapest]
AS
BEGIN TRY
  SELECT Presentation.idPresentation, Presentation.title, Tracks.idTrack, Tracks.topic, Zip.city
    FROM Presentation
      INNER JOIN Events ON Events.idEvent = Presentation.idEvent
      INNER JOIN Venues ON Venues.idVenue = Events.idVenue
      INNER JOIN Address ON Address.idAddress = Venues.idAddress
      INNER JOIN Zip ON Zip.city = 'Budapest'
      INNER JOIN Classes ON Classes.idPresentation = Presentation.idPresentation
      INNER JOIN Tracks ON Tracks.idTrack = Classes.idTrack
      ORDER BY Tracks.idTrack ASC
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
