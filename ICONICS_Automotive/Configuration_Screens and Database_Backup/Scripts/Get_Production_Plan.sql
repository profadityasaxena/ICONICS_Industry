USE [Bajaj_MEA_ProdData]
GO
/****** Object:  StoredProcedure [dbo].[SP_Get_ProductionPlan]    Script Date: 21-04-2022 14:07:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER   PROCEDURE [dbo].[SP_Get_ProductionPlan]
	-- Add the parameters for the stored procedure here
	@source_table  as nvarchar(50)
AS
BEGIN
	
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @model_family		as nvarchar(50);
	Declare @model				as nvarchar(50);
	Declare @production_date	as Date
    -- Insert statements for procedure here
	IF (@source_table = 'Manual')
		BEGIN 
			-- Get the values from the table
			INSERT INTO [dbo].[Line_Production_Plan] (
			   [WorkOrder]
			  ,[Prod_Date]
			  ,[Shift_ID]
			  ,[Line_No]
			  ,[SEQ_No]
			  ,[Model_Family]
			  ,[Model]
			  ,[SKU]
			  ,[Plan_Qyt]
			  ,[SG1_WIP]
			  ,[SG2_WIP]
			  ,[SG3_WIP]
			  ,[Manual_Line_WIP]
			  ,[Completed_Qty]
			  ,[Status]
			  ,[Transfer_Status])
			SELECT 
				[WorkOrder],
				[Prod_Date],
				[IShift],
				1,
				[SEQ_No],
				(Select distinct [model_family_id] from [BajajMEA].[dbo].[View_Config_SKU] where [sku_code] = [SKU]),
				(Select distinct [model_id] from [BajajMEA].[dbo].[View_Config_SKU] where [sku_code] = [SKU]),
				[SKU],
				[Plan_Qyt], 
				0,
				0,
				0,
				0,
				0,
				[Status],
				0
			from [dbo].[ManualEntry_ProductionPlan] 
			where  [Prod_Date] = (GETDATE());
		-- Update the line production plan table
		END
	ELSE IF (@source_table = 'Excel')
		BEGIN 
			-- Get the values from the table
			INSERT INTO [dbo].[Line_Production_Plan] (
			   [WorkOrder]
			  ,[Prod_Date]
			  ,[Shift_ID]
			  ,[Line_No]
			  ,[SEQ_No]
			  ,[Model_Family]
			  ,[Model]
			  ,[SKU]
			  ,[Plan_Qyt]
			  ,[SG1_WIP]
			  ,[SG2_WIP]
			  ,[SG3_WIP]
			  ,[Manual_Line_WIP]
			  ,[Completed_Qty]
			  ,[Status]
			  ,[Transfer_Status])
			SELECT 
				[WorkOrder],
				[Prod_Date],
				[IShift],
				1,  -- this has been hardcoded, need to check what to enter here
				[SEQ_No],
				(Select distinct [model_family_id] from [BajajMEA].[dbo].[View_Config_SKU] where [sku_code] = [SKU]),
				(Select distinct [model_id] from [BajajMEA].[dbo].[View_Config_SKU] where [sku_code] = [SKU]),
				[SKU], -- Only SKU is received
				[Plan_Qyt], 
				0,
				0,
				0,
				0,
				0,
				'New Plan',
				0
			from [dbo].[Excel_ProductionPlan] 
			where  [Prod_Date] = (GETDATE());

		-- Update the line production plan table
		UPDATE [dbo].[Line_Production_Plan] 
		SET [Execution_Priority] = @@IDENTITY
		WHERE [PLC_WO] = @@IDENTITY 

		END
	ELSE IF (@source_table = 'SAP')
		BEGIN 
			-- Get the values from the table
			INSERT INTO [dbo].[Line_Production_Plan] (
			   [WorkOrder]
			  ,[Prod_Date]
			  ,[Shift_ID]
			  ,[Line_No]
			  ,[SEQ_No]
			  ,[Model_Family]
			  ,[Model]
			  ,[SKU]
			  ,[Plan_Qyt]
			  ,[SG1_WIP]
			  ,[SG2_WIP]
			  ,[SG3_WIP]
			  ,[Manual_Line_WIP]
			  ,[Completed_Qty]
			  ,[Status]
			  ,[Transfer_Status])
			SELECT 
				[WorkOrder],
				CAST(CAST(CAST ([ZDate] as int) as varchar(8)) as Date),
				[IShift],
				1,
				[SEQ_No],
				(Select distinct [model_family_id] from [BajajMEA].[dbo].[View_Config_SKU] where [sku_code] = [SKU]),
				(Select distinct [model_id] from [BajajMEA].[dbo].[View_Config_SKU] where [sku_code] = [SKU]),
				[SKU], -- Only SKU is received
				[Plan_Qyt], 
				0,
				0,
				0,
				0,
				0,
				'New Plan',
				0
			from [dbo].[SAP_ProductionPlan] 
			where CAST(CAST(CAST ([ZDate] as int) as varchar(8)) as Date) = (GETDATE());
		-- Update the line production plan table
		END
	
END
