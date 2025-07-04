USE [BajajMEA]
GO
/****** Object:  StoredProcedure [dbo].[SP_GenealogyReport_Product_ST01]    Script Date: 2022-09-27 3:02:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   PROCEDURE [dbo].[SP_GenealogyReport_Product_ST01]
	-- Add the parameters for the stored procedure here
	@engine_number As Varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	-- [Determining Virtual Engine Number corresponding to Requested Engine]
    -- Insert statements for procedure here
	DECLARE @virtual_engine_number	As Varchar(50)
	DECLARE @sku_code				As Varchar(50)
	DECLARE @model_code				As Varchar(50)
	DECLARE @model_family			As Varchar(50)
	
	SET @virtual_engine_number		= (SELECT top(1) engine_number FROM [BajajMEA].[dbo].[View_GenealogyLog_Product] WHERE [activity_id] = 234 AND [activity_value] = @engine_number)
	SET @sku_code					= (SELECT [sku] FROM [dbo].[OrderManagement_Engine_WIP] WHERE [engine_number] = @engine_number)
	SET @model_code					= (SELECT [model] FROM [dbo].[OrderManagement_Engine_WIP] WHERE [engine_number] = @engine_number)
	SET @model_family				= (SELECT [model_family] FROM [dbo].[OrderManagement_Engine_WIP] WHERE [engine_number] = @engine_number)

	SELECT [activity_id] as 'Activity ID',
			[activity_description] 'Description',	
			[activity_value_reference_1] as 'Lower Limit',
			[activity_value_reference_2] as 'Upper Limit',
			[activity_value_units] as 'Units',
			[quantity] as 'Quantity',
			[activity_value] as 'Value',
			[status] as 'Status',
			[stage_id],
			[stage_name],
			[line_id],
			[line_name],
			@sku_code as 'SKU Code',
			@model_code as 'Model Code',
			@model_family as 'Family Code'
	FROM [dbo].[View_GenealogyLog_Product]
	WHERE [engine_number] IN (@engine_number, @virtual_engine_number) and stage_id = 1

	SELECT @sku_code As 'SKU Code'

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GenealogyReport_Product_ST02]    Script Date: 2022-09-27 3:02:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_GenealogyReport_Product_ST02]
	-- Add the parameters for the stored procedure here
	@engine_number As Varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	-- [Determining Virtual Engine Number corresponding to Requested Engine]
    -- Insert statements for procedure here
	DECLARE @virtual_engine_number	As Varchar(50)
	DECLARE @sku_code				As Varchar(50)
	DECLARE @model_code				As Varchar(50)
	DECLARE @model_family			As Varchar(50)
	
	SET @virtual_engine_number		= (SELECT top(1) engine_number FROM [BajajMEA].[dbo].[View_GenealogyLog_Product] WHERE [activity_id] = 234 AND [activity_value] = @engine_number)
	SET @sku_code					= (SELECT [sku] FROM [dbo].[OrderManagement_Engine_WIP] WHERE [engine_number] = @engine_number)
	SET @model_code					= (SELECT [model] FROM [dbo].[OrderManagement_Engine_WIP] WHERE [engine_number] = @engine_number)
	SET @model_family				= (SELECT [model_family] FROM [dbo].[OrderManagement_Engine_WIP] WHERE [engine_number] = @engine_number)

	SELECT [activity_id] as 'Activity ID',
			[activity_description] 'Description',	
			[activity_value_reference_1] as 'Lower Limit',
			[activity_value_reference_2] as 'Upper Limit',
			[activity_value_units] as 'Units',
			[quantity] as 'Quantity',
			[activity_value] as 'Value',
			[status] as 'Status',
			[stage_id],
			[stage_name],
			[line_id],
			[line_name],
			@sku_code as 'SKU Code',
			@model_code as 'Model Code',
			@model_family as 'Family Code'
	FROM [dbo].[View_GenealogyLog_Product]
	WHERE [engine_number] IN (@engine_number, @virtual_engine_number) and stage_id = 2

	SELECT @sku_code As 'SKU Code'

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GenealogyReport_Product_ST03]    Script Date: 2022-09-27 3:02:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   PROCEDURE [dbo].[SP_GenealogyReport_Product_ST03]
	-- Add the parameters for the stored procedure here
	@engine_number As Varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	-- [Determining Virtual Engine Number corresponding to Requested Engine]
    -- Insert statements for procedure here
	DECLARE @virtual_engine_number	As Varchar(50)
	DECLARE @sku_code				As Varchar(50)
	DECLARE @model_code				As Varchar(50)
	DECLARE @model_family			As Varchar(50)
	
	SET @virtual_engine_number		= (SELECT top(1) engine_number FROM [BajajMEA].[dbo].[View_GenealogyLog_Product] WHERE [activity_id] = 234 AND [activity_value] = @engine_number)
	SET @sku_code					= (SELECT [sku] FROM [dbo].[OrderManagement_Engine_WIP] WHERE [engine_number] = @engine_number)
	SET @model_code					= (SELECT [model] FROM [dbo].[OrderManagement_Engine_WIP] WHERE [engine_number] = @engine_number)
	SET @model_family				= (SELECT [model_family] FROM [dbo].[OrderManagement_Engine_WIP] WHERE [engine_number] = @engine_number)

	SELECT [activity_id] as 'Activity ID',
			[activity_description] 'Description',	
			[activity_value_reference_1] as 'Lower Limit',
			[activity_value_reference_2] as 'Upper Limit',
			[activity_value_units] as 'Units',
			[quantity] as 'Quantity',
			[activity_value] as 'Value',
			[status] as 'Status',
			[stage_id],
			[stage_name],
			[line_id],
			[line_name],
			@sku_code as 'SKU Code',
			@model_code as 'Model Code',
			@model_family as 'Family Code'
	FROM [dbo].[View_GenealogyLog_Product]
	WHERE [engine_number] IN (@engine_number, @virtual_engine_number) and stage_id = 3

	SELECT @sku_code As 'SKU Code'

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GenealogyReport_Product_ST04]    Script Date: 2022-09-27 3:02:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   PROCEDURE [dbo].[SP_GenealogyReport_Product_ST04]
	-- Add the parameters for the stored procedure here
	@engine_number As Varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	-- [Determining Virtual Engine Number corresponding to Requested Engine]
    -- Insert statements for procedure here
	DECLARE @virtual_engine_number	As Varchar(50)
	DECLARE @sku_code				As Varchar(50)
	DECLARE @model_code				As Varchar(50)
	DECLARE @model_family			As Varchar(50)
	
	SET @virtual_engine_number		= (SELECT top(1) engine_number FROM [BajajMEA].[dbo].[View_GenealogyLog_Product] WHERE [activity_id] = 234 AND [activity_value] = @engine_number)
	SET @sku_code					= (SELECT [sku] FROM [dbo].[OrderManagement_Engine_WIP] WHERE [engine_number] = @engine_number)
	SET @model_code					= (SELECT [model] FROM [dbo].[OrderManagement_Engine_WIP] WHERE [engine_number] = @engine_number)
	SET @model_family				= (SELECT [model_family] FROM [dbo].[OrderManagement_Engine_WIP] WHERE [engine_number] = @engine_number)

	SELECT [activity_id] as 'Activity ID',
			[activity_description] 'Description',	
			[activity_value_reference_1] as 'Lower Limit',
			[activity_value_reference_2] as 'Upper Limit',
			[activity_value_units] as 'Units',
			[quantity] as 'Quantity',
			[activity_value] as 'Value',
			[status] as 'Status',
			[stage_id],
			[stage_name],
			[line_id],
			[line_name],
			@sku_code as 'SKU Code',
			@model_code as 'Model Code',
			@model_family as 'Family Code'
	FROM [dbo].[View_GenealogyLog_Product]
	WHERE [engine_number] IN (@engine_number, @virtual_engine_number) and stage_id = 4

	SELECT @sku_code As 'SKU Code'

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GenealogyReport_Product_ST05]    Script Date: 2022-09-27 3:02:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   PROCEDURE [dbo].[SP_GenealogyReport_Product_ST05]
	-- Add the parameters for the stored procedure here
	@engine_number As Varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	-- [Determining Virtual Engine Number corresponding to Requested Engine]
    -- Insert statements for procedure here
	DECLARE @virtual_engine_number	As Varchar(50)
	DECLARE @sku_code				As Varchar(50)
	DECLARE @model_code				As Varchar(50)
	DECLARE @model_family			As Varchar(50)
	
	SET @virtual_engine_number		= (SELECT top(1) engine_number FROM [BajajMEA].[dbo].[View_GenealogyLog_Product] WHERE [activity_id] = 234 AND [activity_value] = @engine_number)
	SET @sku_code					= (SELECT [sku] FROM [dbo].[OrderManagement_Engine_WIP] WHERE [engine_number] = @engine_number)
	SET @model_code					= (SELECT [model] FROM [dbo].[OrderManagement_Engine_WIP] WHERE [engine_number] = @engine_number)
	SET @model_family				= (SELECT [model_family] FROM [dbo].[OrderManagement_Engine_WIP] WHERE [engine_number] = @engine_number)

	SELECT [activity_id] as 'Activity ID',
			[activity_description] 'Description',	
			[activity_value_reference_1] as 'Lower Limit',
			[activity_value_reference_2] as 'Upper Limit',
			[activity_value_units] as 'Units',
			[quantity] as 'Quantity',
			[activity_value] as 'Value',
			[status] as 'Status',
			[stage_id],
			[stage_name],
			[line_id],
			[line_name],
			@sku_code as 'SKU Code',
			@model_code as 'Model Code',
			@model_family as 'Family Code'
	FROM [dbo].[View_GenealogyLog_Product]
	WHERE [engine_number] IN (@engine_number, @virtual_engine_number) and stage_id = 5

	SELECT @sku_code As 'SKU Code'

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GenealogyReport_Product_ST06]    Script Date: 2022-09-27 3:02:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   PROCEDURE [dbo].[SP_GenealogyReport_Product_ST06]
	-- Add the parameters for the stored procedure here
	@engine_number As Varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	-- [Determining Virtual Engine Number corresponding to Requested Engine]
    -- Insert statements for procedure here
	DECLARE @virtual_engine_number	As Varchar(50)
	DECLARE @sku_code				As Varchar(50)
	DECLARE @model_code				As Varchar(50)
	DECLARE @model_family			As Varchar(50)
	
	SET @virtual_engine_number		= (SELECT top(1) engine_number FROM [BajajMEA].[dbo].[View_GenealogyLog_Product] WHERE [activity_id] = 234 AND [activity_value] = @engine_number)
	SET @sku_code					= (SELECT [sku] FROM [dbo].[OrderManagement_Engine_WIP] WHERE [engine_number] = @engine_number)
	SET @model_code					= (SELECT [model] FROM [dbo].[OrderManagement_Engine_WIP] WHERE [engine_number] = @engine_number)
	SET @model_family				= (SELECT [model_family] FROM [dbo].[OrderManagement_Engine_WIP] WHERE [engine_number] = @engine_number)

	SELECT [activity_id] as 'Activity ID',
			[activity_description] 'Description',	
			[activity_value_reference_1] as 'Lower Limit',
			[activity_value_reference_2] as 'Upper Limit',
			[activity_value_units] as 'Units',
			[quantity] as 'Quantity',
			[activity_value] as 'Value',
			[status] as 'Status',
			[stage_id],
			[stage_name],
			[line_id],
			[line_name],
			@sku_code as 'SKU Code',
			@model_code as 'Model Code',
			@model_family as 'Family Code'
	FROM [dbo].[View_GenealogyLog_Product]
	WHERE [engine_number] IN (@engine_number, @virtual_engine_number) and stage_id = 6

	SELECT @sku_code As 'SKU Code'

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GenealogyReport_Product_ST07]    Script Date: 2022-09-27 3:02:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   PROCEDURE [dbo].[SP_GenealogyReport_Product_ST07]
	-- Add the parameters for the stored procedure here
	@engine_number As Varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	-- [Determining Virtual Engine Number corresponding to Requested Engine]
    -- Insert statements for procedure here
	DECLARE @virtual_engine_number	As Varchar(50)
	DECLARE @sku_code				As Varchar(50)
	DECLARE @model_code				As Varchar(50)
	DECLARE @model_family			As Varchar(50)
	
	SET @virtual_engine_number		= (SELECT top(1) engine_number FROM [BajajMEA].[dbo].[View_GenealogyLog_Product] WHERE [activity_id] = 234 AND [activity_value] = @engine_number)
	SET @sku_code					= (SELECT [sku] FROM [dbo].[OrderManagement_Engine_WIP] WHERE [engine_number] = @engine_number)
	SET @model_code					= (SELECT [model] FROM [dbo].[OrderManagement_Engine_WIP] WHERE [engine_number] = @engine_number)
	SET @model_family				= (SELECT [model_family] FROM [dbo].[OrderManagement_Engine_WIP] WHERE [engine_number] = @engine_number)

	SELECT [activity_id] as 'Activity ID',
			[activity_description] 'Description',	
			[activity_value_reference_1] as 'Lower Limit',
			[activity_value_reference_2] as 'Upper Limit',
			[activity_value_units] as 'Units',
			[quantity] as 'Quantity',
			[activity_value] as 'Value',
			[status] as 'Status',
			[stage_id],
			[stage_name],
			[line_id],
			[line_name],
			@sku_code as 'SKU Code',
			@model_code as 'Model Code',
			@model_family as 'Family Code'
	FROM [dbo].[View_GenealogyLog_Product]
	WHERE [engine_number] IN (@engine_number, @virtual_engine_number) and stage_id = 7

	SELECT @sku_code As 'SKU Code'

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GenealogyReport_Product_ST08]    Script Date: 2022-09-27 3:02:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   PROCEDURE [dbo].[SP_GenealogyReport_Product_ST08]
	-- Add the parameters for the stored procedure here
	@engine_number As Varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	-- [Determining Virtual Engine Number corresponding to Requested Engine]
    -- Insert statements for procedure here
	DECLARE @virtual_engine_number	As Varchar(50)
	DECLARE @sku_code				As Varchar(50)
	DECLARE @model_code				As Varchar(50)
	DECLARE @model_family			As Varchar(50)
	
	SET @virtual_engine_number		= (SELECT top(1) engine_number FROM [BajajMEA].[dbo].[View_GenealogyLog_Product] WHERE [activity_id] = 234 AND [activity_value] = @engine_number)
	SET @sku_code					= (SELECT [sku] FROM [dbo].[OrderManagement_Engine_WIP] WHERE [engine_number] = @engine_number)
	SET @model_code					= (SELECT [model] FROM [dbo].[OrderManagement_Engine_WIP] WHERE [engine_number] = @engine_number)
	SET @model_family				= (SELECT [model_family] FROM [dbo].[OrderManagement_Engine_WIP] WHERE [engine_number] = @engine_number)

	SELECT [activity_id] as 'Activity ID',
			[activity_description] 'Description',	
			[activity_value_reference_1] as 'Lower Limit',
			[activity_value_reference_2] as 'Upper Limit',
			[activity_value_units] as 'Units',
			[quantity] as 'Quantity',
			[activity_value] as 'Value',
			[status] as 'Status',
			[stage_id],
			[stage_name],
			[line_id],
			[line_name],
			@sku_code as 'SKU Code',
			@model_code as 'Model Code',
			@model_family as 'Family Code'
	FROM [dbo].[View_GenealogyLog_Product]
	WHERE [engine_number] IN (@engine_number, @virtual_engine_number) and stage_id = 8

	SELECT @sku_code As 'SKU Code'

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GenealogyReport_Product_ST09]    Script Date: 2022-09-27 3:02:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   PROCEDURE [dbo].[SP_GenealogyReport_Product_ST09]
	-- Add the parameters for the stored procedure here
	@engine_number As Varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	-- [Determining Virtual Engine Number corresponding to Requested Engine]
    -- Insert statements for procedure here
	DECLARE @virtual_engine_number	As Varchar(50)
	DECLARE @sku_code				As Varchar(50)
	DECLARE @model_code				As Varchar(50)
	DECLARE @model_family			As Varchar(50)
	
	SET @virtual_engine_number		= (SELECT top(1) engine_number FROM [BajajMEA].[dbo].[View_GenealogyLog_Product] WHERE [activity_id] = 234 AND [activity_value] = @engine_number)
	SET @sku_code					= (SELECT [sku] FROM [dbo].[OrderManagement_Engine_WIP] WHERE [engine_number] = @engine_number)
	SET @model_code					= (SELECT [model] FROM [dbo].[OrderManagement_Engine_WIP] WHERE [engine_number] = @engine_number)
	SET @model_family				= (SELECT [model_family] FROM [dbo].[OrderManagement_Engine_WIP] WHERE [engine_number] = @engine_number)

	SELECT [activity_id] as 'Activity ID',
			[activity_description] 'Description',	
			[activity_value_reference_1] as 'Lower Limit',
			[activity_value_reference_2] as 'Upper Limit',
			[activity_value_units] as 'Units',
			[quantity] as 'Quantity',
			[activity_value] as 'Value',
			[status] as 'Status',
			[stage_id],
			[stage_name],
			[line_id],
			[line_name],
			@sku_code as 'SKU Code',
			@model_code as 'Model Code',
			@model_family as 'Family Code'
	FROM [dbo].[View_GenealogyLog_Product]
	WHERE [engine_number] IN (@engine_number, @virtual_engine_number) and stage_id = 9

	SELECT @sku_code As 'SKU Code'

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GenealogyReport_Product_ST10]    Script Date: 2022-09-27 3:02:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   PROCEDURE [dbo].[SP_GenealogyReport_Product_ST10]
	-- Add the parameters for the stored procedure here
	@engine_number As Varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	-- [Determining Virtual Engine Number corresponding to Requested Engine]
    -- Insert statements for procedure here
	DECLARE @virtual_engine_number	As Varchar(50)
	DECLARE @sku_code				As Varchar(50)
	DECLARE @model_code				As Varchar(50)
	DECLARE @model_family			As Varchar(50)
	
	SET @virtual_engine_number		= (SELECT top(1) engine_number FROM [BajajMEA].[dbo].[View_GenealogyLog_Product] WHERE [activity_id] = 234 AND [activity_value] = @engine_number)
	SET @sku_code					= (SELECT [sku] FROM [dbo].[OrderManagement_Engine_WIP] WHERE [engine_number] = @engine_number)
	SET @model_code					= (SELECT [model] FROM [dbo].[OrderManagement_Engine_WIP] WHERE [engine_number] = @engine_number)
	SET @model_family				= (SELECT [model_family] FROM [dbo].[OrderManagement_Engine_WIP] WHERE [engine_number] = @engine_number)

	SELECT [activity_id] as 'Activity ID',
			[activity_description] 'Description',	
			[activity_value_reference_1] as 'Lower Limit',
			[activity_value_reference_2] as 'Upper Limit',
			[activity_value_units] as 'Units',
			[quantity] as 'Quantity',
			[activity_value] as 'Value',
			[status] as 'Status',
			[stage_id],
			[stage_name],
			[line_id],
			[line_name],
			@sku_code as 'SKU Code',
			@model_code as 'Model Code',
			@model_family as 'Family Code'
	FROM [dbo].[View_GenealogyLog_Product]
	WHERE [engine_number] IN (@engine_number, @virtual_engine_number) and stage_id = 10

	SELECT @sku_code As 'SKU Code'

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GenealogyReport_Product_ST11]    Script Date: 2022-09-27 3:02:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_GenealogyReport_Product_ST11]
	-- Add the parameters for the stored procedure here
	@engine_number As Varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	-- [Determining Virtual Engine Number corresponding to Requested Engine]
    -- Insert statements for procedure here
	DECLARE @virtual_engine_number	As Varchar(50)
	DECLARE @sku_code				As Varchar(50)
	DECLARE @model_code				As Varchar(50)
	DECLARE @model_family			As Varchar(50)
	
	SET @virtual_engine_number		= (SELECT top(1) engine_number FROM [BajajMEA].[dbo].[View_GenealogyLog_Product] WHERE [activity_id] = 234 AND [activity_value] = @engine_number)
	SET @sku_code					= (SELECT [sku] FROM [dbo].[OrderManagement_Engine_WIP] WHERE [engine_number] = @engine_number)
	SET @model_code					= (SELECT [model] FROM [dbo].[OrderManagement_Engine_WIP] WHERE [engine_number] = @engine_number)
	SET @model_family				= (SELECT [model_family] FROM [dbo].[OrderManagement_Engine_WIP] WHERE [engine_number] = @engine_number)

	SELECT [activity_id] as 'Activity ID',
			[activity_description] 'Description',	
			[activity_value_reference_1] as 'Lower Limit',
			[activity_value_reference_2] as 'Upper Limit',
			[activity_value_units] as 'Units',
			[quantity] as 'Quantity',
			[activity_value] as 'Value',
			[status] as 'Status',
			[stage_id],
			[stage_name],
			[line_id],
			[line_name],
			@sku_code as 'SKU Code',
			@model_code as 'Model Code',
			@model_family as 'Family Code'
	FROM [dbo].[View_GenealogyLog_Product]
	WHERE [engine_number] IN (@engine_number, @virtual_engine_number) and stage_id = 11

	SELECT @sku_code As 'SKU Code'

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GenealogyReport_Product_ST12]    Script Date: 2022-09-27 3:02:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create   PROCEDURE [dbo].[SP_GenealogyReport_Product_ST12]
	-- Add the parameters for the stored procedure here
	@engine_number As Varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	-- [Determining Virtual Engine Number corresponding to Requested Engine]
    -- Insert statements for procedure here
	DECLARE @virtual_engine_number	As Varchar(50)
	DECLARE @sku_code				As Varchar(50)
	DECLARE @model_code				As Varchar(50)
	DECLARE @model_family			As Varchar(50)
	
	SET @virtual_engine_number		= (SELECT top(1) engine_number FROM [BajajMEA].[dbo].[View_GenealogyLog_Product] WHERE [activity_id] = 234 AND [activity_value] = @engine_number)
	SET @sku_code					= (SELECT [sku] FROM [dbo].[OrderManagement_Engine_WIP] WHERE [engine_number] = @engine_number)
	SET @model_code					= (SELECT [model] FROM [dbo].[OrderManagement_Engine_WIP] WHERE [engine_number] = @engine_number)
	SET @model_family				= (SELECT [model_family] FROM [dbo].[OrderManagement_Engine_WIP] WHERE [engine_number] = @engine_number)

	SELECT [activity_id] as 'Activity ID',
			[activity_description] 'Description',	
			[activity_value_reference_1] as 'Lower Limit',
			[activity_value_reference_2] as 'Upper Limit',
			[activity_value_units] as 'Units',
			[quantity] as 'Quantity',
			[activity_value] as 'Value',
			[status] as 'Status',
			[stage_id],
			[stage_name],
			[line_id],
			[line_name],
			@sku_code as 'SKU Code',
			@model_code as 'Model Code',
			@model_family as 'Family Code'
	FROM [dbo].[View_GenealogyLog_Product]
	WHERE [engine_number] IN (@engine_number, @virtual_engine_number) and  stage_id = 12

	SELECT @sku_code As 'SKU Code'

END
GO
