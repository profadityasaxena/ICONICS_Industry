USE [BajajMEA]
GO
/****** Object:  StoredProcedure [dbo].[SP_Downtime]    Script Date: 16-04-2022 12:35:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
ALTER    PROCEDURE [dbo].[SP_Downtime]
-- Add the parameters for the stored procedure here
@reason_id            varchar(50),
@reason_code          varchar(50),
@reason_description   varchar(50),
@sub_unit_name        varchar(50),
@equipment_name       varchar(50),
@equipment_type       varchar(50),
@stage_name           varchar(50),
@line_name            varchar(50),
@created_by           varchar(50), --This value is that of the logged_in_user
@ActionOp             varchar(10)


AS
BEGIN
DECLARE @sub_unit_id as int=(SELECT sub_unit_id FROM Config_Sub_Unit WHERE sub_unit_name=@sub_unit_name)
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

    -- Building the Create Statement

IF (@ActionOp= 'Create')
BEGIN
BEGIN TRY
INSERT INTO [dbo].[Downtime_Reason] (
--[user_id] field is not needed since this is an auto-increment column. Rest fields have been added.[
[reason_id],[reason_code],[reason_description],[sub_unit_id],[created_by]
) VALUES (
--@user_id field is not needed since this is an auto-increment column. Rest fields have been added
@reason_id,@reason_code,@reason_description,@sub_unit_id, @created_by
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
UPDATE [dbo].[Downtime_Reason] SET
[reason_code]=@reason_code,
[reason_description]=@reason_description
WHERE [reason_id] = @reason_id
SELECT 'Success!' AS Response
END
-- Building the Delete Statement


ELSE IF (@ActionOp = 'Delete')
	BEGIN
	BEGIN TRY
		DELETE FROM [dbo].[Downtime_Reason]
		WHERE [reason_id]=@reason_id
		SELECT 'Success!' AS Response
	END TRY
	BEGIN CATCH
		IF ERROR_NUMBER()=547
		SELECT '[Error]-You cannot remove this value from the table as there is a Foreign key violation or one of the inputs is incorrect.' AS Response
    END CATCH
	END
END
