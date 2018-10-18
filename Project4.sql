--Project 4
--database queries 10/18/2018

USE disk_inventory
GO
--3.
SELECT CD_Name, CAST(Release_Date AS DATE) AS ReleaseDate, Artist_First_Name AS FirstName, Artist_Last_Name AS LastName --CD Name, Release, First, Last
FROM CD, Artist, Artist_CD --Line up on tables
WHERE CD.CD_ID = Artist_CD.CD_ID -- with matching ID
AND Artist_CD.Artist_ID = Artist.Artist_ID -- Then Matching Artist
AND Artist.ArtistType_ID = 1 --Having a value of 1 which is a solo artist
ORDER BY FirstName, LastName, CD_Name
GO


--4.
CREATE VIEW View_Individual_Artists AS --Create a view
SELECT Artist_First_Name AS FirstName, Artist_Last_Name AS LastName -- First, Last
FROM Artist 
WHERE ArtistType_ID = 1 --Where Value is solo artist
GO

SELECT * FROM View_Individual_Artists


--5.
SELECT CD_Name, CAST(Release_Date AS DATE) AS ReleaseDate, Artist_First_Name AS GroupName --Select CD Name, ReleaseDate, Group Name
FROM CD, Artist_CD, Artist --Line Up tables
WHERE CD.CD_ID = Artist_CD.CD_ID --With Matching CD_ID
AND Artist.Artist_ID = Artist_CD.Artist_ID --Matching Artist_ID
AND NOT EXISTS(SELECT * FROM View_Individual_Artists --But does not exist in Previous View
WHERE Artist.Artist_First_Name = FirstName) -- Where the FirstName Matches
GO

--6.
SELECT Borrower_First_Name AS FirstName, Borrower_Last_Name AS LastName, CD_Name -- Select First Name, Last Name, CD Name
FROM CD, Borrowers_History BH, Borrower B, CD_Status -- Line up tables
WHERE CD.CD_ID = BH.CD_ID --With Matching CD_ID
AND BH.Borrower_ID = B.Borrower_ID --With Matching Borrwer_ID
AND CD_Status.Loc_status = 2 -- And a Location Status of 2 (which means Loaned)
ORDER BY LastName
GO

--7.
SELECT CD.CD_ID AS DiskID, CD_Name AS DiskName, COUNT(Borrowers_History.CD_ID)AS TimesBorrowed -- Select CD ID, Name, and count borrows
FROM CD, Borrowers_History --Line up tables
WHERE CD.CD_ID = Borrowers_History.CD_ID --Withc Matching CD_ID
GROUP BY CD.CD_ID, CD_Name --Collapse into groups by name and ID
GO
