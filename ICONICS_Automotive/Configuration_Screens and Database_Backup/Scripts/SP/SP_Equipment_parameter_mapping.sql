USE [BajajMEA]
GO
/****** Object:  StoredProcedure [dbo].[SP_Equipment_Parameter_Mapping]    Script Date: 16-04-2022 12:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
ALTER       PROCEDURE [dbo].[SP_Equipment_Parameter_Mapping]
-- Add the parameters for the stored procedure here

@equipment_name  varchar(50),
@stage_name      varchar(50),
@line_name       varchar(50),
@shop_name       varchar(50),
@position        float,
@speed           float,
@acceleration    float,
@deceleration    float,
@created_by      varchar(50), --This value is that of the logged_in_user
@ActionOp        varchar(10)


AS
BEGIN
	DECLARE @equipment_id as int=(SELECT equipment_id FROM Config_Equipment WHERE equipment_name=@equipment_name)
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

    -- Building the Create Statement
IF (@ActionOp= 'Create')
BEGIN
 BEGIN TRY
	INSERT INTO [dbo].[Config_Equipment_Parameter_Mapping] (
	--[user_id] field is not needed since this is an auto-increment column. Rest fields have been added.[
	[equipment_id],[speed],[position],[acceleration],[deceleration],[created_by]
	) VALUES (
	--@user_id field is not needed since this is an auto-increment column. Rest fields have been added
	@equipment_id,@speed,@position,@acceleration,@deceleration, @created_by
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
UPDATE [dbo].[Config_Equipment_Parameter_Mapping] SET
	[speed]=@speed,
	[position]=@position,
	[acceleration]=@acceleration,
	[deceleration]=@deceleration
	WHERE [equipment_id] = @equipment_id
	SELECT 'Success!' AS Response
END

-- Building the Delete Statement
ELSE IF (@ActionOp = 'Delete')
	BEGIN
	BEGIN TRY
		DELETE FROM [dbo].[Config_Equipment_Parameter_Mapping]
		WHERE [equipment_id]=@equipment_id
		SELECT 'Success!' AS Response
	END TRY
	BEGIN CATCH
		IF ERROR_NUMBER()=547
		SELECT '[Error]-You cannot remove this value from the table as there is a Foreign key violation or one of the inputs is incorrect.' AS Response
    END CATCH
	END
END