-- Practice Transactions
USE [A01-School]
GO

/*
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_TYPE = N'PROCEDURE' AND ROUTINE_NAME = 'SprocName')
    DROP PROCEDURE SprocName
GO
CREATE PROCEDURE SprocName
    -- Parameters here
AS
    -- Body of procedure here
RETURN
GO
*/

-- 1. Create a stored procedure called DissolveClub that will accept a club id as its parameter. Ensure that the club exists before attempting to dissolve the club. You are to dissolve the club by first removing all the members of the club and then removing the club itself.
--  - Delete of rows in the Activity table
--  - Delete of rows in the Club table



IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_TYPE = N'PROCEDURE' AND ROUTINE_NAME = 'DissolveClub')
    DROP PROCEDURE DissolveClub
GO
CREATE PROCEDURE DissolveClub
    @ClubId          varchar(10)
AS
    IF @ClubId IS NULL
    BEGIN
        RAISERROR('ClubId is required', 16, 1)
    END 
	ELSE
	BEGIN
	    If NOT EXISTS(SELECT ClubId FROM Club WHERE ClubId = @ClubId)
		BEGIN
		    RAISERROR('That club does not exist', 16, 1)
		END
		ELSE
		BEGIN
		    BEGIN TRANSACTION
			DELETE FROM Activity WHERE ClubId = @ClubId
			IF @@ERROR <> 0
			BEGIN
			    ROLLBACK TRANSACTION
			    RAISERROR('Unable to remove members from the club', 16, 1)
			END
			ELSE 
			BEGIN
			    DELETE FROM Club WHERE ClubId = @ClubId
				IF @@ERROR <> 0 OR @@ROWCOUNT = 0
				BEGIN
				    ROLLBACK TRANSACTION
			        RAISERROR('Unable to delete the club', 16, 1)
				END
				ELSE
				BEGIN
				    COMMIT TRANSACTION
				END
			END
		END
	END
RETURN
GO

-- SELECT * FROM Club	
-- SELECT * FROM Activity
EXEC DissolveClub 'CSS'
EXEC DissolveClub 'NASA1'
EXEC DissolveClub 'WHA?'