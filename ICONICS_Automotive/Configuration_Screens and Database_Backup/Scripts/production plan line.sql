USE [Bajaj_MEA_ProdData]
GO
/****** Object:  StoredProcedure [dbo].[SP_ProductionPlan_Line]    Script Date: 11-04-2022 11:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create or ALTER PROCEDURE [dbo].[SP_ProductionPlan_Line]
	@I_Shift int,
	@O_ProductionPlanMethod Nvarchar(50)=null Output,
	@O_ProdPlanErrorMsg Nvarchar(100)=null Output,
	@O_Query_Complete int = null output
AS
BEGIN
	SET NOCOUNT ON;
	Declare @ProdPlanMethod nvarchar(100), @ProdDate Date, @Zdate nvarchar(10),@Zdate1 nvarchar(20), @CurrentTime Time, @Shift_Text Nvarchar(10), @RecordCount int,@RecordCount1 int,@RecordCount2 int, @ShiftStart Time, @ShiftEnd Time, @ZeroTIme Time, @ZeroTIme1 Time, @MaxSeqNo int;
	Declare @SEQ_No Int ,@Execution_Priority int ,@SKU Nvarchar(50),@SKU_Code int,@Model Nvarchar(50),@Colour Nvarchar(50),@SKU_Desc Nvarchar(250),@WorkOrder Nvarchar(50), @Plan_Qyt int, @IStatus int;
	Declare @i int;
	Declare @TransferSts bit
	Declare @Status as varchar(15)
	Declare @ManualStatus as varchar(10)
	Set @ZeroTIme = '00:00:00'
	Set @ZeroTIme1 = '23:59:59'
	Set @CurrentTime = GETDATE();
	If @I_Shift = 1
		Set @Shift_Text = 'Shift-1';
	Else If @I_Shift = 2
		Set @Shift_Text = 'Shift-2';
	Else If @I_Shift = 3
		Set @Shift_Text = 'Shift-3';
	 
	If @I_Shift = 1
	Begin
		Set @ProdDate = GETDATE();
	End
	Else If @I_Shift = 2
	Begin
		Select @ShiftStart = Start_B, @ShiftEnd = End_B from Bajaj_MEA_Config.dbo.Shift_Setting where RowID = 1  
		If @CurrentTime >= @ShiftStart and @CurrentTime <= @ZeroTIme1
		Begin
			Set @ProdDate = GETDATE();
		End
		Else If @CurrentTime >= @ZeroTIme and @CurrentTime <= @ShiftEnd
		Begin
			Set @ProdDate = GETDATE()-1;
		End
	End
	Set @Zdate1 = @ProdDate
	Set @Zdate = SUBSTRING(@Zdate1,1,4)+SUBSTRING(@Zdate1,6,2)+SUBSTRING(@Zdate1,9,2)

	Select Top 1 @O_ProductionPlanMethod=ProductionMethod From Bajaj_MEA_ProdData.dbo.ProductionPlanMethod where Prod_Date = @ProdDate and iProd_Shift = @I_Shift order by Prod_Date Desc
	If @O_ProductionPlanMethod = 'SAP'
	Begin
		Select @RecordCount = Count(*) From Bajaj_MEA_ProdData.dbo.SAP_ProductionPlan where ZDate = @Zdate and IShift = @I_Shift and Coveyor = 'D'
		If @RecordCount > 0
		Begin
			Select @MaxSeqNo = max(SEQ_No) FROM Bajaj_MEA_ProdData.dbo.SAP_ProductionPlan where ZDate = @Zdate and IShift = @I_Shift and Coveyor = 'D'
			Set @i = 1;
			WHILE @i <= @MaxSeqNo
			BEGIN
				Select @RecordCount1 = Count(*) from Bajaj_MEA_ProdData.dbo.SAP_ProductionPlan where SEQ_No = @i And ZDate = @Zdate and IShift = @I_Shift and Coveyor = 'D'
				If @RecordCount1 > 0
				Begin
					Select Top 1 @SKU = SKU, @WorkOrder = WorkOrder, @Plan_Qyt = Plan_Qyt  from Bajaj_MEA_ProdData.dbo.SAP_ProductionPlan where SEQ_No = @i And ZDate = @Zdate and IShift = @I_Shift and Coveyor = 'D' Order by TimeStamp Desc
					Select Top 1 @SKU_Code = SKU_No, @SKU_Desc = SKU_Description, @Model = Model, @Colour = Colour from Bajaj_MEA_ProdData.dbo.SKU_Configuration where SKU_Code = @SKU 
					Select @RecordCount2 = Count(*) From Bajaj_MEA_ProdData.dbo.LineProductionPlan where Prod_Date = @ProdDate and IShift = @I_Shift and SEQ_No = @i
					If @RecordCount2 > 0
					Begin			
						Select @IStatus = IStatus From Bajaj_MEA_ProdData.dbo.LineProductionPlan where Prod_Date = @ProdDate and IShift = @I_Shift and SEQ_No = @i
						If @IStatus <> 2 and @IStatus <> 3 and  @IStatus <> 4
						Begin
							Update Bajaj_MEA_ProdData.dbo.LineProductionPlan Set SKU = @SKU, SKU_Code = @SKU_Code, Model = @Model, Colour = @Colour, SKU_Desc = @SKU_Desc, WorkOrder = @WorkOrder, Plan_Qyt = @Plan_Qyt
							where Prod_Date = @ProdDate and IShift = @I_Shift and SEQ_No = @i
						End
					End
					Else 
					Begin
						Insert Into Bajaj_MEA_ProdData.dbo.LineProductionPlan (Prod_Date,IShift,SEQ_No,Execution_Priority,SKU,SKU_Code,Model,Colour,SKU_Desc,WorkOrder,Plan_Qyt,In_Line_Qyt,Completed_Qyt,Hold_Qyt,IStatus,[Status],UserName) Values (@ProdDate,@I_Shift,@i,@i,@SKU,@SKU_Code,@Model,@Colour,@SKU_Desc,@WorkOrder,@Plan_Qyt,0,0,0,1,'New Plan','SAP_Admin');
					End
				End
				Set @i = @i+1;
			End
			Set @O_ProdPlanErrorMsg = ' '
		End
		Else
		Begin
			Set @O_ProdPlanErrorMsg = 'Production Order Not Recieved From SAP For Today' 
		End
	End
	Else If @O_ProductionPlanMethod = 'Manual Entry'
	Begin
		
		Select @RecordCount = Count(*) From Bajaj_MEA_ProdData.dbo.ManualEntry_ProductionPlan where Prod_Date = @ProdDate and IShift = @Shift_Text and (Status='New Plan' OR Status ='Modify') and Coveyor = 'D'
		
		If @RecordCount > 0
		Begin
			DECLARE ProdCursor CURSOR FOR
			Select SKU, WorkOrder, Plan_Qyt  , SEQ_No, Status
			from Bajaj_MEA_ProdData.dbo.ManualEntry_ProductionPlan 
			where Prod_Date = @ProdDate and IShift = @Shift_Text and Coveyor = 'D'and (Status='New Plan' OR Status ='Modify')

			OPEN ProdCursor

			FETCH NEXT FROM ProdCursor
			INTO @SKU, @WorkOrder, @Plan_Qyt, @SEQ_No, @ManualStatus

			WHILE @@FETCH_STATUS = 0
			BEGIN
			
				Select Top 1 @SKU_Code = SKU_No, @SKU_Desc = SKU_Description, @Model = Model, @Colour = Colour
				from Bajaj_MEA_ProdData.dbo.SKU_Configuration 
				where SKU_Code = @SKU 
				if (@ManualStatus='New Plan')
				Begin	

				select @SKU_Code = Model_Family_NO from [Bajaj_MEA_Config].[dbo].[Model_Configuration] where Model_Number=@Model

					Insert Into Bajaj_MEA_ProdData.dbo.LineProductionPlan (Prod_Date,IShift,SEQ_No,Execution_Priority,SKU,SKU_Code,Model,Colour,SKU_Desc,WorkOrder,Plan_Qyt,In_Line_Qyt,Completed_Qyt,Hold_Qyt,IStatus,[Status],UserName,Transfer_Status) 
					Values (@ProdDate,@I_Shift,@SEQ_No,@SEQ_No,@SKU,@SKU_Code,@Model,@Colour,@SKU_Desc,@WorkOrder,@Plan_Qyt,0,0,0,1,'New Plan','ManualEntry_Admin',0);
				End
				Select @IStatus = IStatus , @Status= Status, @TransferSts=Transfer_Status
				From Bajaj_MEA_ProdData.dbo.LineProductionPlan 
				where Prod_Date = @ProdDate and IShift = @I_Shift and WorkOrder = @WorkOrder

				If ((@Status='New Plan' or @Status = 'Modify') and @TransferSts=1)
				Begin

				select @SKU_Code = Model_Family_NO from [Bajaj_MEA_Config].[dbo].[Model_Configuration] where Model_Number=@Model

					Update Bajaj_MEA_ProdData.dbo.LineProductionPlan 
					Set SKU = @SKU, SKU_Code = @SKU_Code, Model = @Model, Colour = @Colour, SKU_Desc = @SKU_Desc, WorkOrder = @WorkOrder, Plan_Qyt = @Plan_Qyt,Transfer_Status=0
					where Prod_Date = @ProdDate and IShift = @I_Shift and WorkOrder = @WorkOrder
				End
				Update Bajaj_MEA_ProdData.dbo.ManualEntry_ProductionPlan 
				set Status = 'Commit'
				where Prod_Date = @ProdDate and IShift = @Shift_Text and WorkOrder = @WorkOrder
				FETCH NEXT FROM ProdCursor
			INTO @SKU, @WorkOrder, @Plan_Qyt, @SEQ_No, @ManualStatus

			END
			CLOSE ProdCursor;
			DEALLOCATE ProdCursor;		
		
			Set @O_ProdPlanErrorMsg = ' '
		
		--Select @RecordCount = Count(*) From Bajaj_MEA_ProdData.dbo.ManualEntry_ProductionPlan where Prod_Date = @ProdDate and IShift = @Shift_Text and (Status='New Plan' OR Status ='Modify') and Coveyor = 'D'
		--If @RecordCount > 0
		--Begin
			
			
		--	Select @MaxSeqNo = max(SEQ_No) FROM Bajaj_MEA_ProdData.dbo.ManualEntry_ProductionPlan where Prod_Date = @ProdDate and IShift = @Shift_Text and Coveyor = 'D'
		--	Set @i = 1;
		--	WHILE @i <= @MaxSeqNo
		--	BEGIN
		--		Select @RecordCount1 = Count(*) from Bajaj_MEA_ProdData.dbo.ManualEntry_ProductionPlan where SEQ_No = @i And Prod_Date = @ProdDate and IShift = @Shift_Text and Coveyor = 'D'
		--		If @RecordCount1 > 0
		--		Begin
		--			Select Top 1 @SKU = SKU, @WorkOrder = WorkOrder, @Plan_Qyt = Plan_Qyt  from Bajaj_MEA_ProdData.dbo.ManualEntry_ProductionPlan where SEQ_No = @i And Prod_Date = @ProdDate and IShift = @Shift_Text and Coveyor = 'D'
		--			Select Top 1 @SKU_Code = SKU_No, @SKU_Desc = SKU_Description, @Model = Model, @Colour = Colour from Bajaj_MEA_ProdData.dbo.SKU_Configuration where SKU_Code = @SKU 
		--			Select @RecordCount2 = Count(*) From Bajaj_MEA_ProdData.dbo.LineProductionPlan where Prod_Date = @ProdDate and IShift = @I_Shift and SEQ_No = @i
		--			If @RecordCount2 > 0
		--			Begin			
		--				Select @IStatus = IStatus From Bajaj_MEA_ProdData.dbo.LineProductionPlan where Prod_Date = @ProdDate and IShift = @I_Shift and SEQ_No = @i
		--				If @IStatus <> 2 and @IStatus <> 3 and  @IStatus <> 4
		--				Begin
		--					Update Bajaj_MEA_ProdData.dbo.LineProductionPlan 
		--					Set SKU = @SKU, SKU_Code = @SKU_Code, Model = @Model, Colour = @Colour, SKU_Desc = @SKU_Desc, WorkOrder = @WorkOrder, Plan_Qyt = @Plan_Qyt
		--					where Prod_Date = @ProdDate and IShift = @I_Shift and SEQ_No = @i
		--				End
		--			End
		--			Else 
		--			Begin
		--				Insert Into Bajaj_MEA_ProdData.dbo.LineProductionPlan (Prod_Date,IShift,SEQ_No,Execution_Priority,SKU,SKU_Code,Model,Colour,SKU_Desc,WorkOrder,Plan_Qyt,In_Line_Qyt,Completed_Qyt,Hold_Qyt,IStatus,[Status],UserName) Values (@ProdDate,@I_Shift,@i,@i,@SKU,@SKU_Code,@Model,@Colour,@SKU_Desc,@WorkOrder,@Plan_Qyt,0,0,0,1,'New Plan','ManualEntry_Admin');
		--			End
		--		End
		--		Set @i = @i+1;
		--	End
		--	Set @O_ProdPlanErrorMsg = ' '
		End
		Else
		Begin
			Set @O_ProdPlanErrorMsg = 'Production Order Not Recieved From Manual Entry For Today' 
		End
	End
	Else If @O_ProductionPlanMethod = 'Excel Upload'
	Begin
		Select @RecordCount = Count(*) From Bajaj_MEA_ProdData.dbo.Excel_ProductionPlan where Prod_Date = @ProdDate and IShift = @Shift_Text and Coveyor = 'D'
		If @RecordCount > 0
		Begin
			Select @MaxSeqNo = max(SEQ_No) FROM Bajaj_MEA_ProdData.dbo.Excel_ProductionPlan where Prod_Date = @ProdDate and IShift = @Shift_Text and Coveyor = 'D'
			Set @i = 1;
			WHILE @i <= @MaxSeqNo
			BEGIN
				Select @RecordCount1 = Count(*) from Bajaj_MEA_ProdData.dbo.Excel_ProductionPlan where SEQ_No = @i And Prod_Date = @ProdDate and IShift = @Shift_Text and Coveyor = 'D'
				If @RecordCount1 > 0
				Begin
					Select Top 1 @SKU = SKU, @WorkOrder = WorkOrder, @Plan_Qyt = Plan_Qyt  from Bajaj_MEA_ProdData.dbo.Excel_ProductionPlan where SEQ_No = @i And Prod_Date = @ProdDate and IShift = @Shift_Text and Coveyor = 'D'
					Select Top 1 @SKU_Code = SKU_No, @SKU_Desc = SKU_Description, @Model = Model, @Colour = Colour from Bajaj_MEA_ProdData.dbo.SKU_Configuration where SKU_Code = @SKU 
					Select @RecordCount2 = Count(*) From Bajaj_MEA_ProdData.dbo.LineProductionPlan where Prod_Date = @ProdDate and IShift = @I_Shift and SEQ_No = @i
					If @RecordCount2 > 0
					Begin			
						Select @IStatus = IStatus From Bajaj_MEA_ProdData.dbo.LineProductionPlan where Prod_Date = @ProdDate and IShift = @I_Shift and SEQ_No = @i
						If @IStatus <> 2 and @IStatus <> 3 and  @IStatus <> 4
						Begin
							Update Bajaj_MEA_ProdData.dbo.LineProductionPlan 
							Set SKU = @SKU, SKU_Code = @SKU_Code, Model = @Model, Colour = @Colour, SKU_Desc = @SKU_Desc, WorkOrder = @WorkOrder, Plan_Qyt = @Plan_Qyt
							where Prod_Date = @ProdDate and IShift = @I_Shift and SEQ_No = @i
						End
					End
					Else 
					Begin
						Insert Into Bajaj_MEA_ProdData.dbo.LineProductionPlan (Prod_Date,IShift,SEQ_No,Execution_Priority,SKU,SKU_Code,Model,Colour,SKU_Desc,WorkOrder,Plan_Qyt,In_Line_Qyt,Completed_Qyt,Hold_Qyt,IStatus,[Status],UserName) Values (@ProdDate,@I_Shift,@i,@i,@SKU,@SKU_Code,@Model,@Colour,@SKU_Desc,@WorkOrder,@Plan_Qyt,0,0,0,1,'New Plan','Excel_Admin');
					End
				End
				Set @i = @i+1;
			End
			Set @O_ProdPlanErrorMsg = ' '
		End
		Else
		Begin
			Set @O_ProdPlanErrorMsg = 'Production Order Not Recieved From Excel Upload For Today' 
		End
	End
	Else
	Begin
		Set @O_ProdPlanErrorMsg = 'Production Plan Method Is Not Configured For Today. Please Configure Production Plan Method.' 
		Set @O_ProductionPlanMethod = 'Not Configured'
	End
	set @O_Query_Complete = 1
END
