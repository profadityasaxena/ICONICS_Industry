-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE or ALTER PROCEDURE SP_Get_Line_Production_Plan_All
	-- Add the parameters for the stored procedure here
    -- [Passing Shift ID as the Parameter]
       @shift_id  int
	-- [Current Date] We are not passing the date as the current date will be taken from the system
    -- @current_date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- [DECLARING VARIABLES]
    -- [Getting the Current System date as the Production Date]
    Declare @production_date as date = getdate();
    -- [Calculating the Number of Source Tables set for the  Production Plan Method]
    Declare @source_count as int = (SELECT COUNT(ProductionMethod) FROM [dbo].[OrderManagement_04_PlanMethod] WHERE iProd_Shift=@shift_id and Prod_Date = @production_date);
    -- [INLINE TEST STATEMENT] Check the number of source tables.
    SELECT @source_count as Number_of_Sources;
    -- [Creating a variable to hold the name of the source table]
    Declare @source_table_name as varchar(50);
    -- [CREATING CURSOR] Creating a cursor to iterate over the source table names and getting orders from the respective source tables one by one.
    Declare @cursor_source_table CURSOR 
    SET @cursor_source_table = CURSOR FOR (SELECT ProductionMethod FROM [dbo].[OrderManagement_04_PlanMethod] WHERE iProd_Shift=@shift_id AND Prod_Date = @production_date);


    -- Insert statements for cursor here

        OPEN @cursor_source_table;

        FETCH NEXT FROM @cursor_source_table INTO 
            @source_table_name;
			
        WHILE @@FETCH_STATUS = 0
            BEGIN
                SELECT @source_table_name as SourceTableName;

				IF @source_table_name = 'Manual Entry'
					BEGIN
						--
                        SELECT 'Order Transfer from Manual Order''s Table has begun' as Response;
							BEGIN TRY
                                INSERT INTO [dbo].[OrderManagement_Production_Plan]
                                (  
                                    [WorkOrder],        -- Not Null
                                    [Prod_Date],        -- Not Null
                                    [PLC_WO],
                                    [Shift_ID],         -- Not Null
                                    [SEQ_No],           -- Null (assigned at first station)
                                    [Model_Family_ID],  -- = int code value
                                    [Model_ID],         -- = int code value
                                    [SKU_ID],           -- = int code value
                                    [Plan_Qyt],         -- Not Null
                                    [SG1_WIP],          -- Default
                                    [SG2_WIP],          -- Default
                                    [SG3_WIP],          -- Default
                                    [Manual_Line_WIP],  -- Default
                                    [Completed_Qty],    -- Default
                                    [Status],           -- Default (1 = New Plan, 2 = Running, 3 = Hold, 4 = Short Closed, 5 = Complete)
                                    [Line_No],          -- Hardcoded (Need to understand)
                                    [Transfer_Status]   -- Default
                                )
                                SELECT
                                    [work_order_number],
                                    [production_date],
                                    NEXT VALUE FOR [dbo].[plc_workorder],
                                    [shift_id],
                                    [sequence_number],
                                    [model_family_id],
                                    [model_id],
                                    [sku_id],
                                    [planned_quantity],
                                    '0',
                                    '0',
                                    '0',
                                    '0',
                                    '0',
                                    '1',
                                    '1',
                                    '0'
                                FROM [dbo].[OrderManagement_02_ManualOrders]
                                WHERE [shift_id] = @shift_id
                                AND [production_date] = @production_date
                                AND [transfer_status] = 0

                                SELECT 'Success : Insert Success in : Order Management - Production Plan Table' as Response;
                            END TRY
                            BEGIN CATCH
                                SELECT 'Failure : Insert Failed in : Order Management - Production Plan Table' as Response;
                            END CATCH
                        SELECT 'Order Transfer from Manual Order''s Table is now complete' as Response;
						--
					END
				IF @source_table_name = 'Excel Entry'
					BEGIN 
						Select 2 as table_name;
					END
				IF @source_table_name = 'SAP Entry'
					BEGIN 
						Select 3 as table_name;
					END

                
                FETCH NEXT FROM @cursor_source_table INTO 
                    @source_table_name;
            END;

        CLOSE @cursor_source_table;

        DEALLOCATE @cursor_source_table;


END
GO
