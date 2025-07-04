USE [BajajMEA]
GO
/****** Object:  StoredProcedure [dbo].[SP_Config_Equipment]    Script Date: 16-04-2022 12:26:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
ALTER       PROCEDURE [dbo].[SP_Config_Equipment]
-- Add the parameters for the stored procedure here
@equipment_id    int,
@equipment_name  varchar(50),
@equipment_type  varchar(50),
@equipment_label varchar(50),
@stage_name      varchar(50),
@line_name       varchar(50),
@shop_name       varchar(50),
@created_by      varchar(50), --This value is that of the logged_in_user
@ActionOp        varchar(10)


AS
BEGIN
DECLARE @stage_id as int=(SELECT stage_id FROM Config_Stage WHERE stage_name=@stage_name)
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

    -- Building the Create Statement
IF (@ActionOp= 'Create')
BEGIN
	BEGIN TRY
		INSERT INTO [dbo].[Config_Equipment]  (
		--[user_id] field is not needed since this is an auto-increment column. Rest fields have been added.[
	    [equipment_id],[equipment_name],[equipment_type],[equipment_label],[stage_id],[created_by]
	    ) VALUES (
	    --@user_id field is not needed since this is an auto-increment column. Rest fields have been added
	    @equipment_id,@equipment_name,@equipment_type,@equipment_label, @stage_id, @created_by
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
	UPDATE [dbo].[Config_Equipment] SET
	[equipment_name] = @equipment_name,
	[equipment_type] = @equipment_type,
	[equipment_label] = @equipment_label
	WHERE [equipment_id] = @equipment_id 
	SELECT 'Success!' AS Response
END
-- Building the Delete Statement
ELSE IF (@ActionOp = 'Delete')
BEGIN
	BEGIN TRY
		DELETE FROM [dbo].[Config_Equipment]
	    WHERE [equipment_id]=@equipment_id
		SELECT 'Success!' AS Response
	END TRY
	BEGIN CATCH
		IF ERROR_NUMBER()=547
		SELECT '[Error]-You cannot remove this value from the table as there is a Foreign key violation or one of the inputs is incorrect.' AS Response
    END CATCH
END
END