-- Last Edit 10/23/2018

--project 5
--Stored Procedures

USE disk_inventory
GO
--Creating the SP to insert a new Artist
CREATE PROC sp_InsertArtist
       @Artist_ID    int,
       @Artist_First_Name  varchar(225),
       @Artist_Last_Name varchar(225),
       @ArtistType_ID   int
       
AS
IF NOT EXISTS(SELECT * FROM Artist WHERE Artist_ID = @Artist_ID) --check to make sure it doesn't already exist
    INSERT Artist
    VALUES (@Artist_ID, @Artist_First_Name,
            @Artist_Last_Name, @ArtistType_ID);
ELSE 
    THROW 50001, 'ArtistID already used!', 1; --Error message
GO
--Begin an Insert
USE disk_inventory
GO
BEGIN TRY
    EXEC sp_InsertArtist 
         50,'Hurp and','Derp',1;
END TRY
BEGIN CATCH
    PRINT 'An error occurred.';
    PRINT 'Message: ' + CONVERT(varchar, ERROR_MESSAGE());    
        PRINT 'Something exploded in here. It smells funny.';
END CATCH;
GO

--Creating the SP to Update artist item
CREATE PROC sp_UpdateArtist
       @Artist_ID    int,
       @Artist_First_Name  varchar(225),
       @Artist_Last_Name varchar(225),
       @ArtistType_ID   int
       
AS
IF EXISTS(SELECT * FROM Artist WHERE Artist_ID = @Artist_ID)
    UPDATE Artist
    SET Artist_ID = @Artist_ID, Artist_First_Name = @Artist_First_Name,
            Artist_Last_Name = @Artist_Last_Name, ArtistType_ID = @ArtistType_ID
	WHERE @artist_ID = Artist_ID
ELSE 
    THROW 50001, 'ArtistID Doesnt exist', 1; --Error message
GO
--Try to Update
USE disk_inventory
GO
BEGIN TRY
    EXEC sp_UpdateArtist 
         50,'Master','Yoda',1;
END TRY
BEGIN CATCH
    PRINT 'An error occurred.';
    PRINT 'Message: ' + CONVERT(varchar, ERROR_MESSAGE());    
        PRINT 'Clear your mind... and check your lost ID, we will.';
END CATCH;
GO

--Creating the SP to Delete artist item
CREATE PROC sp_DeleteArtist
       @Artist_ID    int       
AS
IF EXISTS(SELECT * FROM Artist WHERE Artist_ID = @Artist_ID)
    DELETE FROM Artist    
	WHERE @artist_ID = Artist_ID
ELSE 
    THROW 50001, 'ArtistID Doesnt exist', 1; --Error message
GO
--Try to delete
USE disk_inventory
GO
BEGIN TRY
    EXEC sp_DeleteArtist 51
END TRY
BEGIN CATCH
    PRINT 'An error occurred.';
    PRINT 'Message: ' + CONVERT(varchar, ERROR_MESSAGE());    
        PRINT 'We appear to have encountered a black hole!';
END CATCH;
GO


--Creating the SP to insert a new Borrower
CREATE PROC sp_InsertBorrower       
       @Borrower_First_Name  varchar(225),
       @Borrower_Last_Name varchar(225),
       @Borrower_Phone varchar(225),
	   @Borrower_Email varchar(225) = NULL       
AS
IF NOT EXISTS(SELECT * FROM Borrower WHERE Borrower_Phone = @Borrower_Phone) --check to make sure it doesn't already exist
    INSERT Borrower
    VALUES (@Borrower_First_Name, @Borrower_Last_Name, @Borrower_Phone, @Borrower_Email);
ELSE 
    THROW 50001, 'BorrowerID already used!', 1; --Error message
GO
--Begin an Insert
USE disk_inventory
GO
BEGIN TRY
    EXEC sp_InsertBorrower
         'Hurp and','Derp','TestPhoneNumber';
END TRY
BEGIN CATCH
    PRINT 'An error occurred.';
    PRINT 'Message: ' + CONVERT(varchar, ERROR_MESSAGE());    
        PRINT 'Something exploded in here. It smells funny.';
END CATCH;
GO

--Creating the SP to Update Borrower
CREATE PROC sp_UpdateBorrower
	   @Borrower_ID int,
       @Borrower_First_Name  varchar(225),
       @Borrower_Last_Name varchar(225),
       @Borrower_Phone varchar(225),
	   @Borrower_Email varchar(225) = NULL        
AS
IF EXISTS(SELECT * FROM Borrower WHERE Borrower_ID = @Borrower_ID)
    UPDATE Borrower
    SET  Borrower_First_Name = @Borrower_First_Name,
         Borrower_Last_Name = @Borrower_Last_Name, 
	     Borrower_Phone = @Borrower_Phone,
		 Borrower_Email = @Borrower_Email
	WHERE @Borrower_ID = Borrower_ID
ELSE 
    THROW 50001, 'Borrower Phone # Doesnt exist', 1; --Error message
GO
--Try to Update
USE disk_inventory
GO
BEGIN TRY
    EXEC sp_UpdateBorrower
         43,'Master','Yoda', 'Testing phone', 'NewEmail';
END TRY
BEGIN CATCH
    PRINT 'An error occurred.';
    PRINT 'Message: ' + CONVERT(varchar, ERROR_MESSAGE());    
        PRINT 'Clear your mind... and find your lost borrower, we will.';
END CATCH;
GO

--Creating the SP to Delete Borrower
CREATE PROC sp_DeleteBorrower
       @Borrower_ID    int       
AS
IF EXISTS(SELECT * FROM Borrower WHERE Borrower_ID = @Borrower_ID)
    DELETE FROM Borrower    
	WHERE @Borrower_ID = Borrower_ID
ELSE 
    THROW 50001, 'Borrower Doesnt exist', 1; --Error message
GO
--Try to delete
USE disk_inventory
GO
BEGIN TRY
    EXEC sp_DeleteBorrower 43
END TRY
BEGIN CATCH
    PRINT 'An error occurred.';
    PRINT 'Message: ' + CONVERT(varchar, ERROR_MESSAGE());    
        PRINT 'We appear to have encountered a black hole!';
END CATCH;
GO

--Creating the SP to insert a new Disk
CREATE PROC sp_InsertDisk 
       @CD_ID  int,
       @Loc_Status Int,
       @CD_Name varchar(50),
	   @Release_Date datetime = NULL       
AS
IF NOT EXISTS(SELECT * FROM CD WHERE CD_ID = @CD_ID) --check to make sure it doesn't already exist
    INSERT CD
    VALUES (@CD_ID, @Loc_status, @CD_Name, @Release_Date);
ELSE 
    THROW 50001, 'Disk ID already used!', 1; --Error message
GO
--Begin an Insert
USE disk_inventory
GO
BEGIN TRY
    EXEC sp_InsertDisk
         50,1,'disk', '2012-04-01';
END TRY
BEGIN CATCH
    PRINT 'An error occurred.';
    PRINT 'Message: ' + CONVERT(varchar, ERROR_MESSAGE());    
        PRINT 'Something exploded in here. It smells funny.';
END CATCH;
GO

--Creating the SP to Update Disk
CREATE PROC sp_UpdateDisk
	   @CD_ID  int,
       @Loc_Status Int,
       @CD_Name varchar(50),
	   @Release_Date datetime = NULL        
AS
IF EXISTS(SELECT * FROM CD WHERE CD_ID = @CD_ID)
    UPDATE CD
    SET  CD_ID = @CD_ID,
         Loc_Status = @Loc_Status, 
	     CD_Name = @CD_Name,
		 Release_Date = @Release_Date
	WHERE @CD_ID = CD_ID
ELSE 
    THROW 50001, 'Disk ID Doesnt exist', 1; --Error message
GO
--Try to Update
USE disk_inventory
GO
BEGIN TRY
    EXEC sp_UpdateDisk
         50, 2,'disk', '2012-04-01';
END TRY
BEGIN CATCH
    PRINT 'An error occurred.';
    PRINT 'Message: ' + CONVERT(varchar, ERROR_MESSAGE());    
        PRINT 'Clear your mind... and find your lost borrower, we will.';
END CATCH;
GO

--Creating the SP to Delete Disk
CREATE PROC sp_DeleteDisk
       @CD_ID    int       
AS
IF EXISTS(SELECT * FROM CD WHERE CD_ID = @CD_ID)
    DELETE FROM CD   
	WHERE @CD_ID = CD_ID
ELSE 
    THROW 50001, 'Borrower Doesnt exist', 1; --Error message
GO
--Try to delete
USE disk_inventory
GO
BEGIN TRY
    EXEC sp_DeleteDisk 50
END TRY
BEGIN CATCH
    PRINT 'An error occurred.';
    PRINT 'Message: ' + CONVERT(varchar, ERROR_MESSAGE());    
        PRINT 'We appear to have encountered a black hole!';
END CATCH;
GO


