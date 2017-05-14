CREATE PROCEDURE sp_initschema
AS
BEGIN

	create table Zip
	(
		zip varchar(20) not null,
		city varchar(128) not null,
		state varchar(50) not null
	)

	create unique index Zip_zip_uindex
		on Zip (zip)

	create table Address
	(
		idAddress int not null identity
			primary key,
		addressLine varchar(128) not null,
		zip varchar(20) not null
			constraint Address_Zip_zip_fk
				references Zip (zip)
	)

	create unique index Address_idAddress_uindex
		on Address (idAddress)

	create table Venues
	(
		idVenue int not null identity
			primary key,
		userGroup varchar(128) not null,
		idAddress int
			constraint Venues_Address_idAddress_fk
				references Address (idAddress)
	)

	create unique index Venue_idVenue_uindex
		on Venues (idVenue)

	create table Rooms
	(
		roomNo int not null,
		idVenue int not null
			constraint Rooms_Venue_idVenue_fk
				references Venues (idVenue),
		capacity int default 0 not null,
		primary key (roomNo, idVenue)
	)

	create table Events
	(
		idEvent int not null identity
			constraint Events_idEvent_pk
				primary key,
		idVenue int
			constraint Event_Venue_idVenue_fk
				references Venues (idVenue),
		title varchar(128),
		region varchar(128),
		eventDate datetime,
		eventYear int,
		city varchar(50)
	)

	create unique index Event_idEvent_uindex
		on Events (idEvent)

	create table People
	(
		idPeople int not null identity
			primary key,
		firstName nvarchar(60) not null,
		lastName nvarchar(60) not null,
		email varchar(128),
		idAddress int
	)

	create unique index People_idPeople_uindex
		on People (idPeople)

	create table Attendees
	(
		idEvent int
			constraint Attendees_Events_idEvent_fk
				references Events (idEvent),
		idPeople int not null
			constraint Attendees_idPeople_pk
				primary key
			constraint Attendees_People_idPeople_fk
				references People (idPeople)
	)

	create table VendorAssociations
	(
		idVendor int not null identity,
		companyName varchar(128),
		idPeople int not null
			constraint VendorAssociation_People_idPeople_fk
				references People (idPeople),
		primary key (idVendor, idPeople)
	)

	create unique index VendorAssociation_idVendor_uindex
		on VendorAssociations (idVendor)

	create table Tables
	(
		tableNo int not null identity,
		idVenue int not null,
		idPeople int not null
			constraint Tables_People_idPeople_fk
				references People (idPeople),
		idEvent int not null
			constraint Tables_Events_idEvent_fk
				references Events (idEvent),
		idVendor int not null
			constraint Tables_VendorAssociations_idVendor_fk
				references VendorAssociations (idVendor),
		primary key (tableNo, idVenue)
	)

	create table Tracks
	(
		idTrack int not null identity
			primary key,
		topic varchar(128)
	)

	create unique index Tracks_idTrack_uindex
		on Tracks (idTrack)

	create table Classes
	(
		idClass int not null
			constraint Classes_idClass_pk
				primary key,
		idPresentation int not null identity,
		idTrack int not null
			constraint Classes_Tracks_idTrack_fk
				references Tracks (idTrack),
		description text not null
	)

	create unique index Presentations_idPresentation_uindex
		on Classes (idPresentation)

	create table Grades
	(
		idPresentation int not null,
		idPeople int not null
			constraint Grades_People_idPeople_fk
				references People (idPeople),
		grade varchar(50) not null,
		primary key (idPresentation, idPeople)
	)

	create table Schedule
	(
		idPresentation int not null
			constraint Schedule_idPresentation_pk
				primary key,
		roomNo int not null,
		startTime datetime not null,
		duration int default 60 not null
	)

	create table Sponsors
	(
		idSponsor int not null identity
			primary key,
		sponsorName varchar(50),
		sponsorType varchar(50)
	)

	create unique index Sponsors_idSponsor_uindex
		on Sponsors (idSponsor)

	create table Presentation
	(
		idPresentation int not null identity
			primary key,
		speaker int,
		title varchar(128),
		complexity varchar(50),
		idEvent int
			constraint Presentation_Events_idEvent_fk
				references Events (idEvent)
	)

	create unique index Presentation_idPresentation_uindex
		on Presentation (idPresentation)

	alter table Classes
		add constraint Classes_Presentation_idPresentation_fk
			foreign key (idPresentation) references Presentation (idPresentation)

	alter table Classes
		add constraint Presentations_ClassDetails_idClass_fk
			foreign key (idPresentation) references Presentation (idPresentation)

	alter table Grades
		add constraint Grades_Presentation_idPresentation_fk
			foreign key (idPresentation) references Presentation (idPresentation)

	alter table Schedule
		add constraint Schedule_Presentations_idPresentation_fk
			foreign key (idPresentation) references Presentation (idPresentation)

	create table Organizers
	(
		idPeople int not null
			primary key
			constraint Organizers_People_idPeople_fk
				references People (idPeople),
		idEvent int
			constraint Organizers_Events_idEvent_fk
				references Events (idEvent)
	)

	create table Volunteers
	(
		idPeople int not null
			primary key
			constraint Volunteers_People_idPeople_fk
				references People (idPeople),
		idEvent int
			constraint Volunteers_Events_idEvent_fk
				references Events (idEvent)
	)

END
go
