USE [BajajMEA]
GO
/****** Object:  StoredProcedure [dbo].[SP_Config_Model]    Script Date: 16-04-2022 13:25:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
ALTER      PROCEDURE [dbo].[SP_Config_Model]
-- Add the parameters for the stored procedure here
@model_id              int,
@model_family	       varchar(50),
@model_description     text,
@created_by            varchar(50), --This value is that of the logged_in_user
@ActionOp              varchar(10)

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

DECLARE @model_family_id as int = (SELECT [model_family_id] from [dbo].[Config_Model_Family] WHERE [model_family_code] = @model_family);

-- Building the Create Statement
IF (@ActionOp= 'Create')
BEGIN
	BEGIN TRY
		INSERT INTO [dbo].[Config_Model] (
	    [model_id],[model_family_id],[model_description],[created_by]
        ) VALUES (
	    @model_id,@model_family_id,	@model_description, @created_by
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
	UPDATE [dbo].[Config_Model] SET
	[model_family_id]=@model_family_id,
	[model_description]=@model_description
	WHERE [model_id] = @model_id
	SELECT 'Success!' AS Response
END
-- Building the Delete Statement
ELSE IF (@ActionOp = 'Delete')
BEGIN
	BEGIN TRY
		DELETE FROM [dbo].[Config_Model]
	    WHERE [model_id]=@model_id
		SELECT 'Success!' AS Response
	END TRY
	BEGIN CATCH
		IF ERROR_NUMBER()=547
		SELECT '[Error]-You cannot remove this value from the table as there is a Foreign key violation or one of the inputs is incorrect.' AS Response
    END CATCH
END
END