USE [BajajMEA]
GO
/****** Object:  StoredProcedure [dbo].[SP_Config_Stage]    Script Date: 16-04-2022 12:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
ALTER     PROCEDURE [dbo].[SP_Config_Stage]
-- Add the parameters for the stored procedure here
@stage_id   int,
@stage_name varchar(50),
@line_name  varchar(50),
@shop_name  varchar(50),
@created_by varchar(50), --This value is that of the logged_in_user
@ActionOp   varchar(10)

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

DECLARE @line_id as int = (SELECT line_id from [dbo].[Config_Line] WHERE line_name = @line_name);

    -- Building the Create Statement
IF (@ActionOp= 'Create')
BEGIN
	BEGIN TRY
		INSERT INTO [dbo].[Config_Stage]  (
		--[user_id] field is not needed since this is an auto-increment column. Rest fields have been added.[
			[stage_id],[stage_name],[line_id],[created_by]
		) VALUES (
			--@user_id field is not needed since this is an auto-increment column. Rest fields have been added
			@stage_id,@stage_name,@line_id, @created_by
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
		UPDATE [dbo].[Config_Stage] SET
		[stage_name]= @stage_name
		WHERE [stage_id] = @stage_id

		SELECT 'Success!' AS Response
	END
-- Building the Delete Statement
ELSE IF (@ActionOp = 'Delete')
BEGIN
	BEGIN TRY
		DELETE FROM [dbo].[Config_Stage]
		WHERE [stage_id] = @stage_id
		SELECT 'Success!' AS Response
	END TRY
	BEGIN CATCH
		IF ERROR_NUMBER()=547
		SELECT '[Error]-You cannot remove this value from the table as there is a Foreign key violation or one of the inputs is incorrect.' AS Response
    END CATCH
END
END