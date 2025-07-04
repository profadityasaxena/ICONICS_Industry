USE [BajajMEA]
GO
/****** Object:  StoredProcedure [dbo].[SP_Config_ANDON_Dwell_Time]    Script Date: 8/9/2022 12:30:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
ALTER  PROCEDURE [dbo].[SP_Config_ANDON_Dwell_Time]
-- Add the parameters for the stored procedure here
@screen_name				varchar(50),
@display_name				varchar(50),
@dwell_time	            	int,
 --This value is that of the logged_in_user
@ActionOp			    	varchar(10)

AS
BEGIN
DECLARE @screen_id as int	= (SELECT distinct screen_id from Config_ANDON_Screen where screen_name = @screen_name);
DECLARE @display_id as int	= (SELECT distinct display_id from Config_ANDON_Display where display_name = @display_name); -- We have to pass alarm type code and not description from the screen

DECLARE @isExist int			= (select count(1) from [dbo].[Config_ANDON_Dwell_Time]  WHERE [screen_id] = @screen_id and [display_id] = @display_id )
 
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

    -- Building the Create Statement
IF (@ActionOp= 'Create')
 BEGIN
 	BEGIN TRY
		INSERT INTO [dbo].[Config_ANDON_Dwell_Time] (
		--[user_id] field is not needed since this is an auto-increment column. Rest fields have been added.
		[screen_id],[display_id],[dwell_time]
		) VALUES (
		--@user_id field is not needed since this is an auto-increment column. Rest fields have been added
		 @screen_id, @display_id, @dwell_time 
		);

		SELECT 'Inserted Successfully' AS Response
 
	END TRY
	BEGIN CATCH
-- statement to handle errors
        IF  ERROR_NUMBER()=2627
		SELECT '[Error]-Alarm ID needs to be unique. This Alarm ID already Exists. Please try a different and unique ID. (Detail - You cannot insert this value into the table as there is a primary key/unique key violation or one of the inputs is incorrect).'
 AS Response
	END CATCH
END
-- Read statement is not required as the SCADA is already reading the data.

-- Building the Update Statement
ELSE IF (@ActionOp = 'Update')
BEGIN
 if(@isExist > 0)
         BEGIN
			UPDATE [dbo].[Config_ANDON_Dwell_Time] SET
			[dwell_time]	= @dwell_time
			
			WHERE [screen_id]	= @screen_id and [display_id] = @display_id
			SELECT ' Modified successfully.' AS Response
          END
       else
          BEGIN
                SELECT '[Error]-There is no such value in the database. Hence modification is not possible. Please pick a value that already exists in the database. Please try again. Thank you. (Detail - The primary or unique key to identify the corresponding row does not exist).'
 AS Response
          END
    END

-- Building the Delete Statement
ELSE IF (@ActionOp = 'Delete')
BEGIN
      if(@isExist>0)
        BEGIN
			DELETE FROM [dbo].[Config_ANDON_Dwell_Time]
			WHERE [screen_id]	= @screen_id 
			SELECT ' Deleted successfully.' AS Response
		END
    END
END-- ================================================

