USE [BajajMEA]
GO
/****** Object:  StoredProcedure [dbo].[SP_PM_Config_Checklist]    Script Date: 05/05/2022 02:52:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE or ALTER     PROCEDURE [dbo].[SP_PM_Config_Checklist]
-- Add the parameters for the stored procedure here
@checklist_id             int,
@checklist_name        nvarchar(50),
@checklist_type        nvarchar(50),
@route                 nvarchar(50),
@created_by            varchar(50), --This value is that of the logged_in_user
@ActionOp              varchar(10)


AS
BEGIN
DECLARE @isExist int    = (select count(1) from [dbo].[PM_Config_Checklist]  WHERE [checklist_id] = @checklist_id)

-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

    -- Building the Create Statement
IF (@ActionOp= 'Create')
BEGIN
	BEGIN TRY
		INSERT INTO [dbo].[PM_Config_Checklist] (
		--[user_id] field is not needed since this is an auto-increment column. Rest fields have been added.[
		[checklist_id],[checklist_name],[checklist_type],[checklist_route],[created_by]
		) VALUES (
		--@user_id field is not needed since this is an auto-increment column. Rest fields have been added
		@checklist_id,@checklist_name,@checklist_type,@route, @created_by
		);

		SELECT 'Success!' AS Response
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
			UPDATE [dbo].[PM_Config_Checklist] SET
			[checklist_name]	= @checklist_name,
			[checklist_type]	= @checklist_type,
			[checklist_route]	= @route
			WHERE [checklist_id] = @checklist_id
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
			DELETE FROM [dbo].[PM_Config_Checklist]
			WHERE [checklist_id] = @checklist_id
			select ' Deleted successfully.' AS Response
		END
    END
END