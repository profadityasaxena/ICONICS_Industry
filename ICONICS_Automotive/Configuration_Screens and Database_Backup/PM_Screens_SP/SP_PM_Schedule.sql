USE [BajajMEA]
GO
/****** Object:  StoredProcedure [dbo].[SP_PM_Schedule]    Script Date: 05-05-2022 07:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
ALTER     PROCEDURE [dbo].[SP_PM_Schedule]
-- Add the parameters for the stored procedure here
@schedule_id			int,
@schedule_name			nvarchar(50),
@schedule_description	text,
@start_date				date,
@frequency				int,
@checklist_type			nvarchar(50),
@checklist_name			nvarchar(50),
@created_by				varchar(50), --This value is that of the logged_in_user
@ActionOp				varchar(10)


AS
BEGIN
DECLARE @checklist_id as int  = (SELECT distinct checklist_id from PM_Config_Checklist where checklist_name = @checklist_name);
DECLARE @isExist int          = (select count(1) from [dbo].[PM_Schedule] WHERE [schedule_id] = @schedule_id)

-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

    -- Building the Create Statement
IF (@ActionOp= 'Create')
	BEGIN
		BEGIN TRY
		INSERT INTO [dbo].[PM_Schedule]  (
		--[user_id] field is not needed since this is an auto-increment column. Rest fields have been added.
        [schedule_id],[schedule_name],[schedule_description],[checklist_id],[start_date],[frequency],[created_by]
        ) VALUES (
        --@user_id field is not needed since this is an auto-increment column. Rest fields have been added
        @schedule_id, @schedule_name, @schedule_description, @checklist_id, @start_date, @frequency, @created_by
        );
		SELECT ' Inserted successfully.' AS Response
    END TRY
	BEGIN CATCH
	-- statement to handle errors
    IF  ERROR_NUMBER()=2627
	SELECT '[Error]-You cannot insert this value into the table as there is a primary key violation (in the Line ID field) or one of the inputs is incorrect.' AS Response
	END CATCH
END
-- Read statement is not required as the SCADA is already reading the data.

-- Building the Update Statement
ELSE IF (@ActionOp = 'Update')
    BEGIN
        if(@isExist > 0)
                BEGIN
                UPDATE [dbo].[PM_Schedule] SET
                [schedule_name] = @schedule_name,
				[schedule_description] = @schedule_description,
				[frequency] = @frequency
                WHERE [schedule_id] = @schedule_id
                select ' Modified successfully.' AS Response
            END
        else
            BEGIN
                select '[Error]-You cannot modified this value. The key does not exist. Please try again. Thank You.' AS Response
            END
	END
-- Building the Delete Statement

ELSE IF (@ActionOp = 'Delete')
   BEGIN
      if(@isExist>0)
		BEGIN
			DELETE FROM [dbo].[PM_Schedule]
                WHERE [schedule_id] = @schedule_id
			select ' Deleted successfully.' AS Response 
		 END
	 END
END