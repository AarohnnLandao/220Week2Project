--Disk_inventory initial data upload
USE disk_inventory

--TABLE CHANGES!! (Needed a third primary key for Borrowers table. Added date to PKS)
ALTER TABLE Borrowers_History
DROP PK__Borrower__96CEE12AF729D555 --PK Id changes, we talked about this (location in indexes of borrower_history, use rename function to copy paste)
ALTER TABLE Borrowers_History
ADD PRIMARY KEY (Borrower_ID, CD_ID, Borrowed_date);

--Creating Status for Disks (CD_status) 1 for in house, 2 for loaned
INSERT INTO CD_Status (Loc_Status, description)
VALUES (1, 'In House'),
	   (2, 'Loaned')
SELECT * FROM CD_Status
GO

--Inserting into CD (Disk table)
INSERT INTO CD (CD_ID, Loc_status, CD_Name, Release_Date)
VALUES	(1, 2, 'CD1', '2012-04-01'),
		(2, 1, 'CD2', '2012-04-01'),
		(3, 1, 'CD3', '2012-04-01'),
		(4, 1, 'CD4', '2012-04-01'),
		(5, 1, 'CD5', '2012-04-01'),
		(6, 1, 'CD6', '2012-04-01'),
		(7, 2, 'CD7', '2012-04-01'),
		(8, 2, 'CD8', '2012-04-01'),
		(9, 2, 'CD9', '2012-04-01'),
		(10, 2, 'CD10', '2012-04-01'),
		(11, 2, 'CD11', '2012-04-01'),
		(12, 2, 'CD12', '2012-04-01'),
		(13, 2, 'CD13', '2012-04-01'),
		(14, 2, 'CD14', '2012-04-01'),
		(15, 2, 'CD15', '2012-04-01'),
		(16, 2, 'CD16', '2012-04-01'),
		(17, 2, 'CD17', '2012-04-01'),
		(18, 2, 'CD18', '2012-04-01'),
		(19, 2, 'CD19', '2012-04-01'),
		(20, 2, 'CD20', '2012-04-01')
SELECT * FROM CD
GO

--Updating rows to be in house
UPDATE CD
SET Loc_status = 1    
WHERE CD_ID = 1;
SELECT * FROM CD
GO

--Inserting Data to Borrowers
INSERT INTO Borrower (Borrower_First_Name, Borrower_Last_Name, Borrower_Phone)
VALUES ('FN1', 'LN1', '111-111-1111'),
		('FN2', 'LN2', '111-111-1111'),
		('FN3', 'LN3', '111-111-1111'),
		('FN4', 'LN4', '111-111-1111'),
		('FN5', 'LN5', '111-111-1111'),
		('FN6', 'LN6', '111-111-1111'),
		('FN7', 'LN7', '111-111-1111'),
		('FN8', 'LN8', '111-111-1111'),
		('FN9', 'LN9', '111-111-1111'),
		('FN10', 'LN10', '111-111-1111'),
		('FN11', 'LN11', '111-111-1111'),
		('FN12', 'LN12', '111-111-1111'),
		('FN13', 'LN13', '111-111-1111'),
		('FN14', 'LN14', '111-111-1111'),
		('FN15', 'LN15', '111-111-1111'),
		('FN16', 'LN16', '111-111-1111'),
		('FN17', 'LN17', '111-111-1111'),
		('FN18', 'LN18', '111-111-1111'),
		('FN19', 'LN19', '111-111-1111'),
		('FN20', 'LN20', '111-111-1111'),
		('FN21', 'LN21', '111-111-1111')	
SELECT * FROM Borrower
GO
--Deleting one row. for reasons.
DELETE Borrower
WHERE Borrower_ID = 21
SELECT * FROM Borrower
GO

--Inserting Data into ArtistType
INSERT INTO Artist_Type (ArtistType_ID, description)
VALUES (1, 'Solo'),
	   (2, 'Group')
SELECT * FROM Artist_Type
GO

--Inserting Data into Artist
INSERT INTO Artist (Artist_ID, Artist_First_Name, Artist_Last_Name, ArtistType_ID)
VALUES (1, 'Artist1', 'Artist1', 1),
		(2, 'Artist2', 'Artist2', 1),
		(3, 'Artist3', 'Artist3', 1),
		(4, 'Artist4', 'Artist4', 1),
		(5, 'Artist5', 'Artist5', 1),
		(6, 'Artist6', 'Artist6', 1),
		(7, 'Artist7', 'Artist7', 1),
		(8, 'Artist8', 'Artist8', 1),
		(9, 'Artist9', 'Artist9', 1),
		(10, 'Artist10', 'Artist10', 2),
		(11, 'Artist11', 'Artist11', 2),
		(12, 'Artist12', 'Artist12', 2),
		(13, 'Artist13', 'Artist13', 2),
		(14, 'Artist14', 'Artist14', 2),
		(15, 'Artist15', 'Artist15', 2),
		(16, 'Artist16', 'Artist16', 2),
		(17, 'Artist17', 'Artist17', 2),
		(18, 'Artist18', 'Artist18', 2),
		(19, 'Artist19', 'Artist19', 2),
		(20, 'Artist20', 'Artist20', 2)
SELECT * FROM Artist
GO

--Inserting Data Into Borrowers_History (DiskHasBorrower)
INSERT INTO Borrowers_History (Borrower_ID, CD_ID, Borrowed_Date, Returned_Date)
VALUES (1, 1, '2012-04-02', '2012-05-02'),
	   (1, 1, '2012-06-02', null),
	   (2, 3, '2012-04-02', null),
	   (2, 4, '2012-04-02', null),
	   (3, 5, '2012-04-02', null),
	   (4, 6, '2012-04-02', null),
	   (5, 7, '2012-04-02', null),
	   (6, 8, '2012-04-02', null),
	   (7, 9, '2012-04-02', null),
	   (8, 10, '2012-04-02', null),
	   (9, 11, '2012-04-02', null),
	   (10, 12, '2012-04-02', null),
	   (11, 13, '2012-04-02', null),
	   (12, 14, '2012-04-02', null),
	   (13, 15, '2012-04-02', null),
	   (14, 16, '2012-04-02', null),
	   (15, 17, '2012-04-02', null),
	   (16, 18, '2012-04-02', null),
	   (17, 19, '2012-04-02', null),
	   (18, 20, '2012-04-02', null)
SELECT * FROM Borrowers_History
GO

--Inserting Data Into Artist_CD (DiskHasArtist)
INSERT INTO Artist_CD (Artist_ID, CD_ID)
VALUES (1,1),
	   (1,2),
	   (2,2),
	   (3,3),
	   (1,3),
	   (3,1),
	   (4,4),
	   (5,5),
	   (6,6),
	   (7,7),
	   (8,8),
	   (9,9),
	   (10,10),
	   (11,11),
	   (12,12),
	   (13,13),
	   (14,14),
	   (15,15),
	   (16,16),
	   (17,17)
SELECT * FROM Artist_CD
GO

--Query for disks on loan
SELECT Borrower_ID, CD_ID, Borrowed_date, Returned_date
FROM Borrowers_History
WHERE Returned_date IS NULL
GO


--TESTING
SELECT * FROM Artist
GO
SELECT * FROM Artist_CD
GO
SELECT * FROM Artist_type
GO
SELECT * FROM Borrower
GO
SELECT * FROM Borrowers_History
GO
SELECT * FROM CD
GO
SELECT * FROM CD_Status
GO
SELECT * FROM Genere
GO

