use master
IF DB_ID('disk_inventory') IS NOT NULL
	DROP DATABASE disk_inventory
GO

CREATE DATABASE disk_inventory
GO

use disk_inventory;

CREATE TABLE CD_Status
(Loc_status		       INT			NOT NULL,
description            VARCHAR(255) NULL,
PRIMARY KEY (Loc_status))
GO

CREATE TABLE CD
(CD_ID                 INT          NOT NULL,
Loc_status             INT			NOT NULL,
CD_Name 			   VARCHAR(50)  NOT NULL,
Release_Date		   DATETIME     NULL,
PRIMARY KEY (CD_ID),
FOREIGN KEY (Loc_status) REFERENCES CD_Status(Loc_status));
GO

CREATE TABLE Artist_type
(ArtistType_ID		   INT			NOT NULL,
description			   VARCHAR(255) NULL,
PRIMARY KEY (ArtistType_ID))
GO

CREATE TABLE Artist
(Artist_ID			   INT			NOT NULL,
Artist_First_Name	   VARCHAR(255) NOT NULL,
Artist_Last_Name	   VARCHAR(255) NOT NULL,
ArtistType_ID		   INT			NOT NULL,
PRIMARY KEY (Artist_ID),
FOREIGN KEY (ArtistType_ID) REFERENCES Artist_Type(ArtistType_ID)) 
GO

CREATE TABLE Artist_CD
(Artist_ID			   INT			NOT NULL,
CD_ID				   INT			NOT NULL,
PRIMARY KEY (Artist_ID, CD_ID),
FOREIGN KEY (Artist_ID) REFERENCES Artist(Artist_ID),
FOREIGN KEY (CD_ID) REFERENCES CD(CD_ID))
GO

CREATE TABLE Genere
(CD_ID				   INT			NOT NULL,
Genere				   VARCHAR(255) NOT NULL,
description			   VARCHAR(255) NULL,
PRIMARY KEY (CD_ID),
FOREIGN KEY (CD_ID) REFERENCES CD(CD_ID))
GO

CREATE TABLE Borrower
(Borrower_ID		   INT			NOT NULL IDENTITY,
Borrower_First_Name	   VARCHAR(255) NOT NULL,
Borrower_Last_Name	   VARCHAR(255) NOT NULL,
Borrower_Phone		   VARCHAR(255) NOT NULL,
Borrower_Email		   VARCHAR(255) NULL,
PRIMARY KEY (Borrower_ID))
GO

CREATE TABLE Borrowers_History
(Borrower_ID		   INT			NOT NULL,
CD_ID				   INT			NOT NULL,
Borrowed_date		   DATETIME		NOT NULL,
Returned_date		   DATETIME		NULL,
PRIMARY KEY (Borrower_ID, CD_ID),
FOREIGN KEY (CD_ID) REFERENCES CD(CD_ID),
FOREIGN KEY (Borrower_ID) REFERENCES Borrower(Borrower_ID))
GO

