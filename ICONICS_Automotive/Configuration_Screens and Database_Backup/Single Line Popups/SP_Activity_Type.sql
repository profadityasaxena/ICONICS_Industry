USE [BajajMEA]
GO
/****** Object:  StoredProcedure [dbo].[SP_Config_Model_Family]    Script Date: 06-05-2022 11:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>


CREATE OR ALTER     PROCEDURE [dbo].[SP_Config_Acitvity_Type]
-- Add the parameters for the stored procedure here
@activity_type_id             int,
@activity_type_name           varchar(50),
@activity_type_description    text,
@created_by                   varchar(50), --This value is that of the logged_in_user
@ActionOp                     varchar(10)

AS
BEGIN
DECLARE @isExist int    = (select count(1) from [dbo].[Config_Activity_Type] WHERE[activity_type_id]  = @activity_type_id)

-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;


-- Building the Create Statement
IF (@ActionOp= 'Create')
BEGIN
  BEGIN TRY
    INSERT INTO [dbo].[Config_Activity_Type] (
     [activity_type_id] ,[activity_type_name],[activity_type_description],[created_by]
        ) VALUES (
      @activity_type_id,@activity_type_name, @activity_type_description,@created_by
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
        if(@isExist > 0)
            BEGIN
        UPDATE [dbo].[Config_Activity_Type] SET
        [activity_type_description]=@activity_type_description,
        [activity_type_name]  = @activity_type_name
        WHERE [activity_type_id]  = @activity_type_id
        select ' Modified successfully.' AS Response
            END
        else
            BEGIN
                select '[Error]-You cannot modified this value. The key does not exist. Please try again. Thank You.' AS Response
            END
    END
-- Building the Delete Statement
ELSE IF (@ActionOp = 'Delete')
   BEGIN
      if(@isExist>0)
    BEGIN
      DELETE FROM [dbo].[Config_Activity_Type]
      WHERE [activity_type_id]  = @activity_type_id
      select ' Deleted successfully.' AS Response
    END
    END
END
