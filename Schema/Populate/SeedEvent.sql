-- =================================================
-- Author:		Maroof Haque
-- Description:	Populates table based on data in
-- Events Excel file
-- =================================================

CREATE PROCEDURE sp_seedevents
AS
BEGIN

  INSERT INTO Events(title, region, eventDate, eventYear, city) VALUES ('SQLSaturday #626 - Budapest 2017', 'Europe/Middle East/Africa', '5/6/2017', 2017, 'Budapest')
  INSERT INTO Events(title, region, eventDate, eventYear, city) VALUES ('SQLSaturday #615 - Baltimore 2017', 'Canada/US', '5/6/2017', 2017, 'Baltimore')
  INSERT INTO Events(title, region, eventDate, eventYear, city) VALUES ('SQLSaturday #608 - Bogota 2017', 'Latin America', '5/13/2017', 2017, 'Bogota')
  INSERT INTO Events(title, region, eventDate, eventYear, city) VALUES ('SQLSaturday #616 - Kyiv 2017', 'Europe/Middle East/Africa', '5/20/2017', 2017, 'Kyiv')
  INSERT INTO Events(title, region, eventDate, eventYear, city) VALUES ('SQLSaturday #588 - New York City 2017', 'Canada/US', '5/20/2017', 2017, 'New York City')
  INSERT INTO Events(title, region, eventDate, eventYear, city) VALUES ('SQLSaturday #630 - Brisbane 2017', 'Asia Pacific', '5/27/2017', 2017, 'Brisbane')
  INSERT INTO Events(title, region, eventDate, eventYear, city) VALUES ('SQLSaturday #599 - Plovdiv 2017', 'Europe/Middle East/Africa', '5/27/2017', 2017, 'Plovdiv')
  INSERT INTO Events(title, region, eventDate, eventYear, city) VALUES ('SQLSaturday #638 - Philadelphia 2017', 'Canada/US', '6/3/2017', 2017, 'Philadelphia')

END
go
