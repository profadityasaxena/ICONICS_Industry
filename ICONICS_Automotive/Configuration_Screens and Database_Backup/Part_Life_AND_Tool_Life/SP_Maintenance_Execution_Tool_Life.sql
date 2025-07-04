USE [BajajMEA]
GO
/****** Object:  StoredProcedure [dbo].[SP_Maintenance_Execution_Tool_Life]    Script Date: 23-08-2022 12:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
ALTER    PROCEDURE [dbo].[SP_Maintenance_Execution_Tool_Life]
-- Add the parameters for the stored procedure here


@plant_name						varchar(50),
@shop_name						varchar(50),
@line_name						varchar(50),
@stage_name						varchar(50),
@equipment_name					varchar(50),
@sub_unit_name					varchar(50),
@tool_id						varchar(50),
@tool_name						varchar(50),
@tool_life_value_estimated		int,
@tool_life_value_actual			int,
@change_reason					varchar(50),
@remarks						varchar(50),
@created_by						varchar(50), --This value is that of the logged_in_user
@updated_by						varchar(50),
@ActionOp						varchar(10)


AS
BEGIN

DECLARE @sub_unit_id as int =(SELECT sub_unit_id FROM Config_Sub_Unit WHERE sub_unit_name=@sub_unit_name)

DECLARE @isExist int    = (select count(1) from [dbo].[Maintenance_tool_Life]  WHERE [tool_name] = @tool_name)

-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;
IF(@created_by = '')
		BEGIN
			SELECT '[ERROR] User must be logged in' as Response;
		END
	ELSE IF(@created_by != '')
		BEGIN

    

IF (@ActionOp = 'Change')
	BEGIN
		  if(@isExist > 0)
			 BEGIN
				UPDATE [dbo].[Maintenance_Tool_Life] SET
				[tool_life_value_actual]	= 0,
				[change_reason]             = @change_reason,
				[remarks]                   = @remarks,
				[updated_by]				= @updated_by,
				[updated_on]                = getdate()
				WHERE [tool_name]= @tool_name;
				select ' Changed successfully.' AS Response
			  END
		   else
			  BEGIN
					select '[Error]-There is no such value in the database. Hence changing is not possible. Please pick a value that already exists in the database. Please try again. Thank you. (Detail - The primary or unique key to identify the corresponding row does not exist).' AS Response
			  END
	END
 END
END