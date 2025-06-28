USE [BajajMEA]
GO
/****** Object:  StoredProcedure [dbo].[SP_Dw_Order_to_PLC]    Script Date: 28-04-2022 15:45:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[SP_Get_SB1_ST1_AlarmGroup]    Script Date: 02-12-2021 18:08:33 ******/

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER     PROCEDURE [dbo].[SP_Dw_Order_to_PLC]
	-- [Declaring Parameters to be passed to the Stored Procedure]
    @PLC_WO     int = null,       --
    @Shift_ID   Int,              --
    --@I_DD       int,              --
	--@I_MM       int,              --
	--@I_YYYY     int,              --
    
    -- [Declaring Parameters to be returned from the Stored Procedure]
    @O_PLC_WO                   Int output,
    @O_SKU_ID                   Int output,
    @O_Model_ID                 Int output,
    @O_Model_Family_ID          Int output,
    @O_SEQ_No                   Int output,
    @O_Execution_Priority       Int output,
    @O_Plan_Qyt                 Int output,
    @O_Status                   Int output,
    @O_YYYY                     Int output,
	@O_MM                       Int output,
	@O_DD                       Int output,
	@O_QueryComplete            Int output
    

AS
BEGIN
    -- [Declaring Variables for Internal Use]
    Declare @Record int;
    Declare @Current_PLC_Work_Order as int;
    Declare @Current_Prod_Date  as Date = CONVERT(DATE, GETDATE());

    -- [Counting Number of "New Plan Records" for Current Shift]
    Select @Record = COUNT(*) 
	From [BajajMEA].[dbo].[OrderManagement_Production_Plan]
	where Prod_Date = @Current_Prod_Date 
    and Shift_ID = @Shift_ID 
    and Status='New Plan' 

    --
    if (@Record > 0) 
    BEGIN
        IF (@PLC_WO = 0) -- [Indicates Null PLC WO]
            SELECT top(1) 
                @O_PLC_WO                   = PLC_WO,
                @O_SKU_ID                   = SKU_ID,
                @O_Model_ID                 = Model_ID,
                @O_Model_Family_ID          = Model_Family_ID,
                @O_SEQ_No                   = SEQ_No,
                @O_Execution_Priority       = Execution_Priority,
                @O_Plan_Qyt                 = Plan_Qty,
                @O_Status                   = 1,
                @O_YYYY                     = Year(Prod_Date),
                @O_MM                       = Month(Prod_Date),
                @O_DD                       = Day(Prod_Date),
                From [BajajMEA].[dbo].[OrderManagement_Production_Plan]
                WHERE Prod_Date             = @Current_Prod_Date
                AND Shift_ID                = @Shift_ID
                AND Transfer_Status         = 0
                ORDER BY Execution_Priority
        ELSE
            SELECT top(1) 
                @O_PLC_WO                   = PLC_WO,
                @O_SKU_ID                   = SKU_ID,
                @O_Model_ID                 = Model_ID,
                @O_Model_Family_ID          = Model_Family_ID,
                @O_SEQ_No                   = SEQ_No,
                @O_Execution_Priority       = Execution_Priority,
                @O_Plan_Qyt                 = Plan_Qty,
                @O_Status                   = 1,
                @O_YYYY                     = Year(Prod_Date),
                @O_MM                       = Month(Prod_Date),
                @O_DD                       = Day(Prod_Date),
                From [BajajMEA].[dbo].[OrderManagement_Production_Plan]
                WHERE Prod_Date             = @Current_Prod_Date
                AND Shift_ID                = @Shift_ID
                AND PLC_WO                  = @PLC_WO
                ORDER BY Execution_Priority

        --[Setting Work Order Value as Current Downloaded Order Number]
        SET @Current_PLC_Work_Order  = @O_PLC_WO; 

        -- [Updating Order Table to Indicate Downloaded to PLC Status]
        UPDATE [BajajMEA].[dbo].[OrderManagement_Production_Plan]
        SET Transfer_Status = 1 
        WHERE PLC_WO = @Current_PLC_Work_Order
        and Prod_Date = @Prod_Date
        and Shift_ID = @Shift_ID

        Set @O_QueryComplete = 1


    END
	

