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
CREATE or ALTER PROCEDURE SP_Get_ProductionPlan
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
				[Model],
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
				[Model],
				[SKU],
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
				[SKU],
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
GO
