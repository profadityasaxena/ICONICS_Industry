USE [BajajMEA]
GO
/****** Object:  StoredProcedure [dbo].[SP_Config_User]    Script Date: 31-05-2022 11:41:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE or ALTER  PROCEDURE [dbo].[SP_Alerts_User_Config]
-- Add the parameters for the stored procedure here

@first_name			varchar(50),
@last_name		    varchar(50),
@email				varchar(50),
@mobile				varchar(50),
@department			varchar(50),
@role				varchar(50),
@created_by			varchar(50), --This value is that of the logged_in_user
@ActionOp			varchar(10)


AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

    -- Building the Create Statement
IF (@ActionOp= 'Create')
 BEGIN
 
	INSERT INTO [dbo].[Alerts_User_Config] 
    (--[user_id] field is not needed since this is an auto-increment column. Rest fields have been added.
	[first_name],[last_name],[email],[phone],[department],[role],[created_by])
    VALUES
	(--@user_id field is not needed since this is an auto-increment column. Rest fields have been added
	@first_name, @last_name, @email, @mobile, @department, @role, @created_by
	);
	SELECT 'Success!' AS Response
		 
 END
-- Read statement is not required as the SCADA is already reading the data.

-- Building the Update Statement
ELSE IF (@ActionOp = 'Update')

BEGIN
	--SELECT @user_name_temp = user_name from [dbo].[Config_User] where user_name= @user_name
		--if @user_name= @user_name_temp
          --begin
				UPDATE [dbo].[Alerts_User_Config] SET
						[first_name]		= @first_name,
						[last_name]			= @last_name,
						[department]        = @department,
						[phone]             = @mobile,
						[role]              = @role
				WHERE [email]=  @email
				SELECT 'Success!' AS Response
	     -- END
      --// else 
	  --// SELECT 'DUPLICATE USER FOUND !' AS Response
END
-- Building the Delete Statement
ELSE IF (@ActionOp = 'Delete')
BEGIN
DELETE FROM [dbo].[Alerts_User_Config]
WHERE [email]=  @email

SELECT 'Success!' AS Response
END
END