USE [DTPL Employee Managment Sysytem]
GO

/****** Object:  StoredProcedure [dbo].[SP_OrderManagement_Kitbin]    Script Date: 24-08-2022 17:48:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE    PROCEDURE [dbo].[SP_OrderManagement_Kitbin]
-- Add the parameters for the stored procedure here
@kit_bin_id int,
@kit_bin_code varchar(50),
@ActionOp   varchar(10)


AS
BEGIN
DECLARE @isExist int    = (select count(1) from [dbo].[OrderManagement_Kitbin] WHERE [kit_bin_id] = @kit_bin_id)

-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;


    -- Building the Create Statement
IF (@ActionOp= 'Create')
BEGIN
BEGIN TRY
INSERT INTO [dbo].[OrderManagement_Kitbin]  (
--[user_id] field is not needed since this is an auto-increment column. Rest fields have been added.
        [kit_bin_id],[kit_bin_code]
        ) VALUES (
        --@user_id field is not needed since this is an auto-increment column. Rest fields have been added
        @kit_bin_id,@kit_bin_code
        );
SELECT ' Inserted successfully.' AS Response
    END TRY
BEGIN CATCH
-- statement to handle errors
    IF  ERROR_NUMBER()=2627
SELECT '[Error]-Line ID needs to be unique. This Line ID already Exists. Please try a different and unique ID. (Detail - You cannot insert this value into the table as there is a primary key/unique key violation or one of the inputs is incorrect).' AS Response
END CATCH
END
-- Read statement is not required as the SCADA is already reading the data.

-- Building the Update Statement
ELSE IF (@ActionOp = 'Update')
    BEGIN
        if(@isExist > 0)
                BEGIN
                UPDATE [dbo].[OrderManagement_Kitbin] SET
                [kit_bin_code] = @kit_bin_code
                WHERE [kit_bin_id] = @kit_bin_id
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
DELETE FROM [dbo].[OrderManagement_Kitbin]
WHERE [kit_bin_id] = @kit_bin_id
select ' Deleted successfully.' AS Response
END
END
END
GO


