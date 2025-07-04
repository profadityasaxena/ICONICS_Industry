USE [BajajMEA]
GO
/****** Object:  StoredProcedure [dbo].[SP_Config_Alarm]    Script Date: 30-04-2022 04:16:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Config_Alarm]
-- Add the parameters for the stored procedure here
@alarm_id				int,
@alarm_code				varchar(50),
@alarm_group_name		varchar(50),
@alarm_type_description varchar(50),
@stage_name				varchar(50),
@shop_name				varchar(50),
@line_name				varchar(50),
@equipment_name			varchar(50),
@display_number			int,
@created_by				varchar(50), --This value is that of the logged_in_user
@ActionOp				varchar(10)

AS
BEGIN
DECLARE @alarm_group_id as int = (SELECT distinct alarm_group_id from Alarm_Group where alarm_group_name = @alarm_group_name);
DECLARE @alarm_type_id as int = (SELECT distinct alarm_type_id from Alarm_Type where alarm_type_description = @alarm_type_description);
DECLARE @stage_id as int = (SELECT distinct stage_id from Config_Stage where stage_name = @stage_name);
DECLARE @isExist int    = (select count(1) from [dbo].[Alarm_Configuration]  WHERE [alarm_id] = @alarm_id)
 
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

    -- Building the Create Statement
IF (@ActionOp= 'Create')
 BEGIN
 	BEGIN TRY
		INSERT INTO [dbo].[Alarm_Configuration] (
		--[user_id] field is not needed since this is an auto-increment column. Rest fields have been added.
		[alarm_id],[alarm_code],[alarm_group_id],[alarm_type_id],[stage_id],[display_number],[created_by]
		) VALUES (
		--@user_id field is not needed since this is an auto-increment column. Rest fields have been added
		 @alarm_id,@alarm_code,@alarm_group_id,@alarm_type_id,@stage_id,@display_number, @created_by
		);

		SELECT 'Inserted Successfully' AS Response
 
	END TRY
	BEGIN CATCH
-- statement to handle errors
        IF  ERROR_NUMBER()=2627
		SELECT '[Error]-You cannot insert this value into the table as there is a primary key violation or one of the inputs is incorrect.' AS Response
	END CATCH
END
-- Read statement is not required as the SCADA is already reading the data.

-- Building the Update Statement
ELSE IF (@ActionOp = 'Update')
BEGIN
 if(@isExist > 0)
         BEGIN
			UPDATE [dbo].[Alarm_Configuration] SET
			[alarm_code]	= @alarm_code,
			[display_number]= @display_number
			WHERE [alarm_id]	= @alarm_id
			SELECT ' Modified successfully.' AS Response
          END
       else
          BEGIN
                SELECT '[Error]-You cannot modified this value. The key does not exist. Please try again. Thank You.' AS Response
          END
    END

-- Building the Delete Statement
ELSE IF (@ActionOp = 'Delete')
BEGIN
      if(@isExist>0)
        BEGIN
			DELETE FROM [dbo].[Alarm_Configuration]
			WHERE [alarm_id]	= @alarm_id
			SELECT ' Deleted successfully.' AS Response
		END
    END
END