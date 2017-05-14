-- =================================================
-- Author:		Maroof Haque
-- Description:	Populates table based on data in
-- Sponsors Excel file
-- =================================================

CREATE PROCEDURE sp_seedsponsor
AS
BEGIN

  INSERT INTO Sponsors VALUES ('Verizon Digital Media Services', 'Platinum Sponsor')
  INSERT INTO Sponsors VALUES ('VMWare', 'Platinum Sponsor')
  INSERT INTO Sponsors VALUES ('Microsoft Corporation (GAP) (GAP Sponsor)', 'Platinum Sponsor')
  INSERT INTO Sponsors VALUES ('Tintri', 'Platinum Sponsor')
  INSERT INTO Sponsors VALUES ('Amazon Web Services, LLC', 'Gold Sponsor')
  INSERT INTO Sponsors VALUES ('Pyramid Analytics (GAP Sponsor)', 'Gold Sponsor')
  INSERT INTO Sponsors VALUES ('Pure Storage', 'Gold Sponsor')
  INSERT INTO Sponsors VALUES ('Profisee', 'Gold Sponsor')
  INSERT INTO Sponsors VALUES ('NetLib Security', 'Silver Sponsor')
  INSERT INTO Sponsors VALUES ('Melissa Data Corp.', 'Silver Sponsor')
  INSERT INTO Sponsors VALUES ('Red Gate Software', 'Silver Sponsor')
  INSERT INTO Sponsors VALUES ('SentryOne', 'Silver Sponsor')
  INSERT INTO Sponsors VALUES ('Hush Hush', 'Bronze Sponsor')
  INSERT INTO Sponsors VALUES ('COZYROC', 'Bronze Sponsor')
  INSERT INTO Sponsors VALUES ('SQLDOCKit by Acceleratio Ltd.', 'Bronze Sponsor')

END
go
