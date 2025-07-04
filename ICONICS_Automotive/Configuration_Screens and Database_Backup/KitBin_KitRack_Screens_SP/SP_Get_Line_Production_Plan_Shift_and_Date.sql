USE [BajajMEA]
GO
/****** Object:  StoredProcedure [dbo].[SP_Get_Line_Production_Plan_Shift_and_Date]    Script Date: 25-08-2022 15:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER     PROCEDURE [dbo].[SP_Get_Line_Production_Plan_Shift_and_Date]
	-- Add the parameters for the stored procedure here
    -- [Passing Shift ID as the Parameter]
       @shift_id  int,
	-- [Current Date] We are not passing the date as the current date will be taken from the system
       @current_date date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- [DECLARING VARIABLES]
    -- [Getting the Current System date as the Production Date]
    Declare @production_date as date = @current_date;
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
				/*
			     * [SAP Orders Upload] This block of code facilitates the upload of orders from the SAP Orders Table - ie - [dbo].[OrderManagement_01_SAPOrders]
			     */
				IF @source_table_name = 'SAP'
					BEGIN
						--
							BEGIN TRY
							--SELECT 'Order Transfer from Manual Order''s Table has begun' as Response;	
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
                                    [SG1_WIP],          -- Default 0
									[SG1_Reject],       -- Default 0
									[SG1_Repair],       -- Default 0
									[SG1_Complete],     -- Default 0
                                    [SG2_WIP],          -- Default 0
									[SG2_Reject],       -- Default 0
									[SG2_Repair],       -- Default 0
									[SG2_Complete],     -- Default 0
                                    [SG3_WIP],          -- Default 0
									[SG3_Reject],       -- Default 0
									[SG3_Repair],       -- Default 0
									[SG3_Complete],     -- Default 0
                                    [Manual_Line_WIP],  -- Default 0
									[Manual_Line_Reject],       -- Default 0
									[Manual_Line_Repair],       -- Default 0
									[Manual_Line_Complete],     -- Default 0
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
                                    '0',
                                    '0',
                                    '0',
									'0',
                                    '0',
                                    '0',
                                    '0',
                                    '0',
									'0',
                                    '0',
                                    '0',
                                    '1',
                                    '1',
                                    '0'
                                FROM [dbo].[OrderManagement_01_SAPOrders]
                                WHERE [shift_id] = @shift_id
                                AND [production_date] = @production_date
                                AND [transfer_status] = 0

								BEGIN TRY
									UPDATE [dbo].[OrderManagement_Production_Plan]
									SET [Execution_Priority] = [PLC_WO]
									WHERE [Execution_Priority] IS NULL
									AND [PLC_WO] IS NOT NULL
									SELECT 'Success : Execution Priority Updated' as Response;
								END TRY
								BEGIN CATCH
									SELECT 'Failure : Update Execution Priority Failed' as Response;
								END CATCH


								BEGIN TRY
									UPDATE [dbo].[OrderManagement_01_SAPOrders]
									SET [transfer_status]= '1'
									WHERE  [shift_id] = @shift_id
									AND [production_date] = @production_date
									SELECT 'Success : Transfer Status Updated in SAP Table' as Response;
								END TRY
								BEGIN CATCH
									SELECT 'Failure : Transfer Status Update failed in SAP Table' as Response;
								END CATCH

                                SELECT 'Success : Insert Success in : Order Management - Production Plan Table' as Response;
								SELECT 'Order Transfer from SAP Order''s Table is now complete' as Response;
								
							END TRY
                            BEGIN CATCH
                                SELECT 'Failure : Insert Failed in : Order Management - Production Plan Table from SAP' as Response;
                            END CATCH
						--
					END

				/*
			     * [Manual Orders Upload] This block of code facilitates the upload of orders from the Manual Orders Table - ie - [dbo].[OrderManagement_02_ManualOrders]
			     */
				IF @source_table_name = 'Manual Entry'
					BEGIN
						--
							BEGIN TRY
							--SELECT 'Order Transfer from Manual Order''s Table has begun' as Response;	
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
                                    [SG1_WIP],          -- Default 0
									[SG1_Reject],       -- Default 0
									[SG1_Repair],       -- Default 0
									[SG1_Complete],     -- Default 0
                                    [SG2_WIP],          -- Default 0
									[SG2_Reject],       -- Default 0
									[SG2_Repair],       -- Default 0
									[SG2_Complete],     -- Default 0
                                    [SG3_WIP],          -- Default 0
									[SG3_Reject],       -- Default 0
									[SG3_Repair],       -- Default 0
									[SG3_Complete],     -- Default 0
                                    [Manual_Line_WIP],  -- Default 0
									[Manual_Line_Reject],       -- Default 0
									[Manual_Line_Repair],       -- Default 0
									[Manual_Line_Complete],     -- Default 0
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
                                    '0',
                                    '0',
                                    '0',
									'0',
                                    '0',
                                    '0',
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

								BEGIN TRY
									UPDATE [dbo].[OrderManagement_Production_Plan]
									SET [Execution_Priority] = [PLC_WO]
									WHERE [Execution_Priority] IS NULL
									AND [PLC_WO] IS NOT NULL
									SELECT 'Success : Execution Priority Updated' as Response;
								END TRY
								BEGIN CATCH
									SELECT 'Failure : Update Execution Priority Failed' as Response;
								END CATCH


								BEGIN TRY
									UPDATE [dbo].[OrderManagement_02_ManualOrders]
									SET [transfer_status]= '1'
									WHERE  [shift_id] = @shift_id
									AND [production_date] = @production_date
									SELECT 'Success : Transfer Status Updated in Manual Table' as Response;
								END TRY
								BEGIN CATCH
									SELECT 'Failure : Transfer Status Update failed in Manual Table' as Response;
								END CATCH

                                SELECT 'Success : Insert Success in : Order Management - Production Plan Table' as Response;
								SELECT 'Order Transfer from Manual Order''s Table is now complete' as Response;
								
							END TRY
                            BEGIN CATCH
                                SELECT 'Failure : Insert Failed in : Order Management - Production Plan Table from MANUAL' as Response;
                            END CATCH
						--
					END

					/*
					 * [Excel Orders Upload] This block of code facilitates the upload of orders from the Excel Orders Table - ie - [dbo].[OrderManagement_03_ExcelOrders]
					 */
					IF @source_table_name = 'Excel Upload'
					BEGIN
						--
							BEGIN TRY
							--SELECT 'Order Transfer from Manual Order''s Table has begun' as Response;	
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
                                    [SG1_WIP],          -- Default 0
									[SG1_Reject],       -- Default 0
									[SG1_Repair],       -- Default 0
									[SG1_Complete],     -- Default 0
                                    [SG2_WIP],          -- Default 0
									[SG2_Reject],       -- Default 0
									[SG2_Repair],       -- Default 0
									[SG2_Complete],     -- Default 0
                                    [SG3_WIP],          -- Default 0
									[SG3_Reject],       -- Default 0
									[SG3_Repair],       -- Default 0
									[SG3_Complete],     -- Default 0
									[Manual_Line_WIP],  -- Default 0
                                    [Manual_Line_Reject],       -- Default 0
									[Manual_Line_Repair],       -- Default 0
									[Manual_Line_Complete],     -- Default 0
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
                                    '0',
                                    '0',
                                    '0',
									'0',
                                    '0',
                                    '0',
                                    '0',
                                    '0',
									'0',
                                    '0',
                                    '0',
                                    '1',
                                    '1',
                                    '0'
                                FROM [dbo].[OrderManagement_03_ExcelOrders]
                                WHERE [shift_id] = @shift_id
                                AND [production_date] = @production_date
                                AND [transfer_status] = 0

								BEGIN TRY
									UPDATE [dbo].[OrderManagement_Production_Plan]
									SET [Execution_Priority] = [PLC_WO]
									WHERE [Execution_Priority] IS NULL
									AND [PLC_WO] IS NOT NULL
									SELECT 'Success : Execution Priority Updated' as Response;
								END TRY
								BEGIN CATCH
									SELECT 'Failure : Update Execution Priority Failed' as Response;
								END CATCH


								BEGIN TRY
									UPDATE [dbo].[OrderManagement_03_ExcelOrders]
									SET [transfer_status]= '1'
									WHERE  [shift_id] = @shift_id
									AND [production_date] = @production_date
									SELECT 'Success : Transfer Status Updated in Excel Table' as Response;
								END TRY
								BEGIN CATCH
									SELECT 'Failure : Transfer Status Update failed in Excel Table' as Response;
								END CATCH

                                SELECT 'Success : Insert Success in : Order Management - Production Plan Table' as Response;
								SELECT 'Order Transfer from Excel Order''s Table is now complete' as Response;
								
							END TRY
                            BEGIN CATCH
                                SELECT 'Failure : Insert Failed in : Order Management - Production Plan Table from EXCEL' as Response;
                            END CATCH
						--
					END
					
                FETCH NEXT FROM @cursor_source_table INTO 
                    @source_table_name;
            END;

        CLOSE @cursor_source_table;

        DEALLOCATE @cursor_source_table;

		--SELECT '[Notification] - Order Download is now complete!' AS Response;
END
