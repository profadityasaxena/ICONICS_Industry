USE [BajajMEA]
GO
/****** Object:  StoredProcedure [dbo].[SP_PM_Checksheet]    Script Date: 05-05-2022 19:04:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER     PROCEDURE [dbo].[SP_PM_Checksheet]
	-- Add the parameters for the stored procedure here
	
	@checksheet_id              int,
	@checksheet_name            nvarchar(50),
	@checklist_name             nvarchar(50),
	--@checklist_type             nvarchar(50),
	@inspection_by              nvarchar(50),
	@worksheet_generated        bit,
	@ActionOp				    varchar(10)
AS
BEGIN
DECLARE @checklist_id as int=(SELECT checklist_id FROM PM_Config_Checklist WHERE checklist_name=@checklist_name );

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF (@ActionOp = 'Create')
		BEGIN
		BEGIN TRY
			INSERT INTO [dbo].[PM_Checksheet](
					[checksheet_id], [checksheet_name],[inspection_by],[checklist_id],[worksheet_generated]
				) VALUES (
					@checksheet_id, @checksheet_name,@inspection_by,@checklist_id,'TRUE'
				);
          SELECT 'Success!' AS Response
	END TRY
	BEGIN CATCH
-- statement to handle errors
        IF  ERROR_NUMBER()=2627
		SELECT '[Error]-You cannot insert this value into the table as there is a primary key violation or one of the inputs is incorrect.' AS Response
	END CATCH
		END
	ELSE IF (@ActionOp = 'Update')
		BEGIN
			UPDATE [dbo].[PM_Checksheet] SET 
						[checksheet_name]               = @checksheet_name,
						[inspection_by]                 =@inspection_by
					
			WHERE [checksheet_id] = @checksheet_id
		END
	ELSE IF (@ActionOp = 'Delete')
		BEGIN
			DELETE FROM [dbo].[PM_Checksheet]
			WHERE [checksheet_id] = @checksheet_id
		END
END
