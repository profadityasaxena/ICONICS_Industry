USE [BajajMEA]
GO
/****** Object:  StoredProcedure [dbo].[SP_Config_SKU]    Script Date: 16-04-2022 12:28:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
ALTER       PROCEDURE [dbo].[SP_Config_SKU]
-- Add the parameters for the stored procedure here
@sku_id                int,
@sku_code              varchar(50),
@sku_description       text,
@model_family_code     varchar(50),
@model_description     varchar(50),
@created_by            varchar(50), --This value is that of the logged_in_user
@ActionOp              varchar(10)


AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;
Declare @model_id AS int = (SELECT model_id FROM Config_Model WHERE model_description = @model_description  );

    -- Building the Create Statement
IF (@ActionOp= 'Create')

BEGIN
	BEGIN TRY
		INSERT INTO [dbo].[Config_SKU]  (
		[sku_id],[sku_code],[sku_description],[model_id],[created_by]
		) VALUES (
		@sku_id,@sku_code,@sku_description, @model_id, @created_by
		);
		SELECT 'Success!' AS Response
		

	END TRY
	BEGIN CATCH
-- statement to handle errors
        IF  ERROR_NUMBER()=2627
		SELECT '[Error]-You cannot insert this value into the table as there is a primary key violation or one of the inputs is incorrect.' AS Response
	END CATCH
END
-- Read statement i


-- Read statement is not required as the SCADA is already reading the data.

-- Building the Update Statement
ELSE IF (@ActionOp = 'Update')
BEGIN
	UPDATE [dbo].[Config_SKU] SET
	[sku_code]=@sku_code,
	[sku_description]=@sku_description
	WHERE [sku_id] = @sku_id
    SELECT 'Success!' AS Response
END
-- Building the Delete Statement
ELSE IF (@ActionOp = 'Delete')
BEGIN
	BEGIN TRY
		DELETE FROM [dbo].[Config_SKU]
		WHERE [sku_id]=@sku_id
		SELECT 'Success!' AS Response
	END TRY
	BEGIN CATCH
		IF ERROR_NUMBER()=547
		SELECT '[Error]-You cannot remove this value from the table as there is a Foreign key violation or one of the inputs is incorrect.' AS Response
    END CATCH
END
END
