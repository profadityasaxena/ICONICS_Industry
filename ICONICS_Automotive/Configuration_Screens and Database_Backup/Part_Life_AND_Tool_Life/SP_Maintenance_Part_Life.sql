USE [BajajMEA]
GO
/****** Object:  StoredProcedure [dbo].[SP_Maintenance_Part_Life]    Script Date: 22-08-2022 17:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
ALTER      PROCEDURE [dbo].[SP_Maintenance_Part_Life]
-- Add the parameters for the stored procedure here

@plant_name						varchar(50),
@shop_name						varchar(50),
@line_name						varchar(50),
@stage_name						varchar(50),
@equipment_name					varchar(50),
@sub_unit_name					varchar(50),
@part_id						varchar(50),
@part_name						varchar(50),
@part_life_value_estimated		int,		
@part_life_units				varchar(50),
@alert_value_1					int,
@alert_value_2					int,
@line_stop                      int,
@sms                            int,
@email							int,
@alert_user_1					varchar(50),
@alert_user_2					varchar(50),
@created_by						varchar(50), --This value is that of the logged_in_user
@updated_by						varchar(50),
@ActionOp						varchar(10)


AS
BEGIN

DECLARE @sub_unit_id as int =(SELECT sub_unit_id FROM Config_Sub_Unit WHERE sub_unit_name=@sub_unit_name)

DECLARE @isExist int    = (select count(1) from [dbo].[Maintenance_Part_Life]  WHERE [part_name] = @part_name)

-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;
IF(@created_by = '')
		BEGIN
			SELECT '[ERROR] User must be logged in' as Response;
		END
	ELSE IF(@created_by != '')
		BEGIN
    -- Building the Create Statement
IF (@ActionOp= 'Create')
BEGIN
	BEGIN TRY
		INSERT INTO [dbo].[Maintenance_Part_Life] (
		--[user_id] field is not needed since this is an auto-increment column. Rest fields have been added.[
			[sub_unit_id],
			[part_id],
			[part_name],
			[part_life_value_estimated],
			[part_life_units],
			[alert_value_1],
			[alert_value_2],
			[line_stop],
			[sms],
			[email],
			[alert_user_1],
			[alert_user_2],
			[created_by],
			[updated_by],
			[updated_on]
		) VALUES (
		--@user_id field is not needed since this is an auto-increment column. Rest fields have been added
			@sub_unit_id,
			@part_id,					
			@part_name,						
			@part_life_value_estimated,				
			@part_life_units,										
			@alert_value_1,	
			@alert_value_2,
			@line_stop,
			@sms,
			@email,
			@alert_user_1,					
			@alert_user_2,	
			@created_by,
			@updated_by,
			getdate()
		);

		SELECT 'Success!' AS Response
	END TRY
	BEGIN CATCH
-- statement to handle errors
        IF  ERROR_NUMBER()=2627
		SELECT '[Error]-Part Name needs to be unique. This Part Name already Exists. Please try a different and Part Name. (Detail - You cannot insert this value into the table as there is a primary key/unique key violation or one of the inputs is incorrect).' AS Response
	END CATCH
END

-- Read statement is not required as the SCADA is already reading the data.

-- Building the Update Statement
ELSE IF (@ActionOp = 'Update')
   BEGIN
      if(@isExist > 0)
         BEGIN
			UPDATE [dbo].[Maintenance_Part_Life] SET
			[part_id]					= @part_id,
			[part_life_value_estimated]	= @part_life_value_estimated,
			[part_life_units]			= @part_life_units,
			[alert_value_1]				= @alert_value_1,
			[alert_value_2]				= @alert_value_2,
			[line_stop]			     	= @line_stop,
			[sms]			     	    = @sms,
			[email]			     		= @email,
			[alert_user_1]				= @alert_user_1,
			[alert_user_2]				= @alert_user_2,
			[updated_by]				= @updated_by,
			[updated_on]                = getdate()
			WHERE [part_name]= @part_name;
			select ' Modified successfully.' AS Response
          END
       else
          BEGIN
                select '[Error]-There is no such value in the database. Hence modification is not possible. Please pick a value that already exists in the database. Please try again. Thank you. (Detail - The primary or unique key to identify the corresponding row does not exist).' AS Response
          END
    END



-- Building the Delete Statement
ELSE IF (@ActionOp = 'Delete')
   BEGIN
      if(@isExist>0)
        BEGIN
			DELETE FROM [dbo].[Maintenance_Part_Life]
			WHERE [part_name]= @part_name;
			select ' Deleted successfully.' AS Response
		END
    END
END
END