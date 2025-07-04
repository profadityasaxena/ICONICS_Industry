USE [BajajMEA]
GO
/****** Object:  Table [dbo].[Maintenance_Checklist]    Script Date: 02-06-2022 15:13:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maintenance_Checklist](
	[uid] [int] IDENTITY(1,1) NOT NULL,
	[checklist_id] [int] NOT NULL,
	[checklist_name] [varchar](50) NOT NULL,
	[checklist_type] [varchar](50) NOT NULL,
	[stage_id] [int] NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_on] [datetime] NOT NULL,
 CONSTRAINT [PK_Maintenance_Checklist] PRIMARY KEY CLUSTERED 
(
	[checklist_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Maintenance_Checklist]    Script Date: 02-06-2022 15:13:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Maintenance_Checklist]
AS
SELECT dbo.Maintenance_Checklist.uid, dbo.Config_Shop.shop_name, dbo.Config_Plant.plant_name, dbo.Config_Line.line_id, dbo.Config_Line.line_name, dbo.Config_Stage.stage_id, dbo.Config_Stage.stage_name, dbo.Maintenance_Checklist.checklist_id, 
             dbo.Maintenance_Checklist.checklist_name, dbo.Maintenance_Checklist.checklist_type, dbo.Maintenance_Checklist.created_by, dbo.Maintenance_Checklist.created_on
FROM   dbo.Config_Line INNER JOIN
             dbo.Config_Shop ON dbo.Config_Line.shop_name = dbo.Config_Shop.shop_name INNER JOIN
             dbo.Config_Plant ON dbo.Config_Shop.plant_name = dbo.Config_Plant.plant_name INNER JOIN
             dbo.Config_Stage ON dbo.Config_Line.line_id = dbo.Config_Stage.line_id INNER JOIN
             dbo.Maintenance_Checklist ON dbo.Config_Stage.stage_id = dbo.Maintenance_Checklist.stage_id
GO
/****** Object:  Table [dbo].[Maintenance_Checkpoint]    Script Date: 02-06-2022 15:13:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maintenance_Checkpoint](
	[checkpoint_id] [int] IDENTITY(1,1) NOT NULL,
	[checklist_id] [int] NOT NULL,
	[checkpoint_name] [varchar](50) NOT NULL,
	[checkpoint_method] [varchar](50) NOT NULL,
	[process] [text] NULL,
	[value_lower_limit] [float] NULL,
	[value_upper_limit] [float] NULL,
	[value_units] [varchar](50) NULL,
	[estimated_completion_time_in_minutes] [int] NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_on] [datetime] NOT NULL,
 CONSTRAINT [PK_Maintenance_Checkpoint] PRIMARY KEY CLUSTERED 
(
	[checkpoint_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Maintenance_Checkpoint]    Script Date: 02-06-2022 15:13:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Maintenance_Checkpoint]
AS
SELECT dbo.Maintenance_Checkpoint.checkpoint_id, dbo.Config_Plant.plant_name, dbo.Config_Shop.shop_name, dbo.Config_Line.line_id, dbo.Config_Line.line_name, dbo.Config_Stage.stage_id, dbo.Config_Stage.stage_name, dbo.Maintenance_Checklist.checklist_id, 
             dbo.Maintenance_Checklist.checklist_name, dbo.Maintenance_Checklist.checklist_type, dbo.Maintenance_Checkpoint.checkpoint_name, dbo.Maintenance_Checkpoint.checkpoint_method, dbo.Maintenance_Checkpoint.process, dbo.Maintenance_Checkpoint.value_lower_limit, 
             dbo.Maintenance_Checkpoint.value_upper_limit, dbo.Maintenance_Checkpoint.value_units, dbo.Maintenance_Checkpoint.estimated_completion_time_in_minutes, dbo.Maintenance_Checkpoint.created_by, dbo.Maintenance_Checkpoint.created_on
FROM   dbo.Config_Line INNER JOIN
             dbo.Config_Shop ON dbo.Config_Line.shop_name = dbo.Config_Shop.shop_name INNER JOIN
             dbo.Config_Plant ON dbo.Config_Shop.plant_name = dbo.Config_Plant.plant_name INNER JOIN
             dbo.Config_Stage ON dbo.Config_Line.line_id = dbo.Config_Stage.line_id INNER JOIN
             dbo.Maintenance_Checklist ON dbo.Config_Stage.stage_id = dbo.Maintenance_Checklist.stage_id INNER JOIN
             dbo.Maintenance_Checkpoint ON dbo.Maintenance_Checklist.checklist_id = dbo.Maintenance_Checkpoint.checklist_id
GO
/****** Object:  Table [dbo].[Maintenance_Schedule]    Script Date: 02-06-2022 15:13:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maintenance_Schedule](
	[uid] [int] IDENTITY(1,1) NOT NULL,
	[checklist_id] [int] NOT NULL,
	[frequency_type] [varchar](50) NOT NULL,
	[frequency] [int] NOT NULL,
	[start_date] [date] NOT NULL,
	[alert_in_days] [int] NOT NULL,
	[status] [int] NULL,
	[completed_on] [date] NULL,
	[due_date] [date] NULL,
	[days_left] [int] NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_on] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Maintenance_Schedule]    Script Date: 02-06-2022 15:13:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Maintenance_Schedule]
AS
SELECT dbo.Maintenance_Schedule.uid, dbo.Config_Plant.plant_name, dbo.Config_Shop.shop_name, dbo.Config_Line.line_id, dbo.Config_Line.line_name, dbo.Config_Stage.stage_id, dbo.Config_Stage.stage_name, dbo.Maintenance_Checklist.checklist_id, 
             dbo.Maintenance_Checklist.checklist_name, dbo.Maintenance_Checklist.checklist_type, dbo.Maintenance_Checkpoint.checkpoint_id, dbo.Maintenance_Checkpoint.checkpoint_name, dbo.Maintenance_Checkpoint.checkpoint_method, dbo.Maintenance_Schedule.frequency_type, 
             dbo.Maintenance_Schedule.frequency, dbo.Maintenance_Schedule.start_date, dbo.Maintenance_Schedule.alert_in_days, dbo.Maintenance_Schedule.created_by, dbo.Maintenance_Schedule.created_on, dbo.Maintenance_Schedule.status, 
             dbo.Maintenance_Schedule.completed_on, dbo.Maintenance_Schedule.due_date, dbo.Maintenance_Schedule.days_left
FROM   dbo.Config_Line INNER JOIN
             dbo.Config_Shop ON dbo.Config_Line.shop_name = dbo.Config_Shop.shop_name INNER JOIN
             dbo.Config_Plant ON dbo.Config_Shop.plant_name = dbo.Config_Plant.plant_name INNER JOIN
             dbo.Config_Stage ON dbo.Config_Line.line_id = dbo.Config_Stage.line_id INNER JOIN
             dbo.Maintenance_Checklist ON dbo.Config_Stage.stage_id = dbo.Maintenance_Checklist.stage_id INNER JOIN
             dbo.Maintenance_Checkpoint ON dbo.Maintenance_Checklist.checklist_id = dbo.Maintenance_Checkpoint.checklist_id INNER JOIN
             dbo.Maintenance_Schedule ON dbo.Maintenance_Checklist.checklist_id = dbo.Maintenance_Schedule.checklist_id
GO
/****** Object:  View [dbo].[View_Maintenance_Status_Monitor]    Script Date: 02-06-2022 15:13:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Maintenance_Status_Monitor]
AS
SELECT dbo.Maintenance_Schedule.uid, dbo.Config_Plant.plant_name, dbo.Config_Shop.shop_name, dbo.Config_Line.line_id, dbo.Config_Line.line_name, dbo.Config_Stage.stage_id, dbo.Config_Stage.stage_name, dbo.Maintenance_Checklist.checklist_id, 
             dbo.Maintenance_Checklist.checklist_name, dbo.Maintenance_Schedule.due_date, dbo.Maintenance_Schedule.completed_on, dbo.Maintenance_Schedule.days_left, dbo.Maintenance_Schedule.status, dbo.Maintenance_Schedule.created_by, 
             dbo.Maintenance_Schedule.created_on
FROM   dbo.Config_Line INNER JOIN
             dbo.Config_Shop ON dbo.Config_Line.shop_name = dbo.Config_Shop.shop_name INNER JOIN
             dbo.Config_Plant ON dbo.Config_Shop.plant_name = dbo.Config_Plant.plant_name INNER JOIN
             dbo.Config_Stage ON dbo.Config_Line.line_id = dbo.Config_Stage.line_id INNER JOIN
             dbo.Maintenance_Checklist ON dbo.Config_Stage.stage_id = dbo.Maintenance_Checklist.stage_id INNER JOIN
             dbo.Maintenance_Schedule ON dbo.Maintenance_Checklist.checklist_id = dbo.Maintenance_Schedule.checklist_id
GO
/****** Object:  Table [dbo].[Maintenance_Checkpoint_History]    Script Date: 02-06-2022 15:13:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maintenance_Checkpoint_History](
	[uid] [int] IDENTITY(1,1) NOT NULL,
	[checklist_id] [int] NOT NULL,
	[checkpoint_name] [varchar](50) NOT NULL,
	[actual_value] [float] NULL,
	[checkpoint_status] [varchar](50) NULL,
	[time_taken_in_minutes] [int] NULL,
	[remarks] [text] NULL,
	[created_by] [varchar](50) NULL,
	[created_on] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Maintenance_Execution]    Script Date: 02-06-2022 15:13:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Maintenance_Execution]
AS
SELECT dbo.Maintenance_Checkpoint_History.uid, dbo.Config_Plant.plant_name, dbo.Config_Shop.shop_name, dbo.Config_Line.line_id, dbo.Config_Line.line_name, dbo.Config_Stage.stage_id, dbo.Config_Stage.stage_name, dbo.Maintenance_Checklist.checklist_id, 
             dbo.Maintenance_Checkpoint_History.checkpoint_name, dbo.Maintenance_Checkpoint_History.actual_value, dbo.Maintenance_Checkpoint_History.checkpoint_status, dbo.Maintenance_Checkpoint_History.time_taken_in_minutes, dbo.Maintenance_Checkpoint_History.remarks, 
             dbo.Maintenance_Checkpoint_History.created_by, dbo.Maintenance_Checkpoint_History.created_on
FROM   dbo.Config_Line INNER JOIN
             dbo.Config_Shop ON dbo.Config_Line.shop_name = dbo.Config_Shop.shop_name INNER JOIN
             dbo.Config_Plant ON dbo.Config_Shop.plant_name = dbo.Config_Plant.plant_name INNER JOIN
             dbo.Config_Stage ON dbo.Config_Line.line_id = dbo.Config_Stage.line_id INNER JOIN
             dbo.Maintenance_Checklist ON dbo.Config_Stage.stage_id = dbo.Maintenance_Checklist.stage_id INNER JOIN
             dbo.Maintenance_Checkpoint_History ON dbo.Maintenance_Checklist.checklist_id = dbo.Maintenance_Checkpoint_History.checklist_id
GO
/****** Object:  Table [dbo].[Maintenance_Checklist_History]    Script Date: 02-06-2022 15:13:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maintenance_Checklist_History](
	[uid] [int] IDENTITY(1,1) NOT NULL,
	[checklist_id] [int] NOT NULL,
	[due_date] [date] NOT NULL,
	[start_datetime] [datetime] NOT NULL,
	[complete_datetime] [datetime] NOT NULL,
	[completed_by] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Maintenance_Checklist] ON 

INSERT [dbo].[Maintenance_Checklist] ([uid], [checklist_id], [checklist_name], [checklist_type], [stage_id], [created_by], [created_on]) VALUES (1, 1, N'checklist test 1', N'Preventive Maintenance', 1, N'Khushi', CAST(N'2022-05-31T12:43:41.227' AS DateTime))
INSERT [dbo].[Maintenance_Checklist] ([uid], [checklist_id], [checklist_name], [checklist_type], [stage_id], [created_by], [created_on]) VALUES (6, 2, N'checklist test 2', N'JH Activity', 1, N'Khushi', CAST(N'2022-06-01T12:24:00.020' AS DateTime))
INSERT [dbo].[Maintenance_Checklist] ([uid], [checklist_id], [checklist_name], [checklist_type], [stage_id], [created_by], [created_on]) VALUES (11, 3, N'checklist 3', N'Preventive Maintenance', 2, N'Khushi', CAST(N'2022-06-01T13:38:12.460' AS DateTime))
INSERT [dbo].[Maintenance_Checklist] ([uid], [checklist_id], [checklist_name], [checklist_type], [stage_id], [created_by], [created_on]) VALUES (12, 4, N'checklist 4', N'Preventive Maintenance', 2, N'Khushi', CAST(N'2022-06-01T17:16:29.043' AS DateTime))
SET IDENTITY_INSERT [dbo].[Maintenance_Checklist] OFF
GO
SET IDENTITY_INSERT [dbo].[Maintenance_Checklist_History] ON 

INSERT [dbo].[Maintenance_Checklist_History] ([uid], [checklist_id], [due_date], [start_datetime], [complete_datetime], [completed_by]) VALUES (1, 2, CAST(N'2022-05-31' AS Date), CAST(N'2022-05-26T00:00:00.000' AS DateTime), CAST(N'2022-05-25T00:00:00.000' AS DateTime), N'Khushi')
INSERT [dbo].[Maintenance_Checklist_History] ([uid], [checklist_id], [due_date], [start_datetime], [complete_datetime], [completed_by]) VALUES (2, 2, CAST(N'2022-06-16' AS Date), CAST(N'2022-05-20T00:00:00.000' AS DateTime), CAST(N'2022-06-02T00:00:00.000' AS DateTime), N'Khushi')
INSERT [dbo].[Maintenance_Checklist_History] ([uid], [checklist_id], [due_date], [start_datetime], [complete_datetime], [completed_by]) VALUES (3, 2, CAST(N'2022-06-16' AS Date), CAST(N'2022-06-01T00:00:00.000' AS DateTime), CAST(N'2022-06-02T00:00:00.000' AS DateTime), N'Khushi')
SET IDENTITY_INSERT [dbo].[Maintenance_Checklist_History] OFF
GO
SET IDENTITY_INSERT [dbo].[Maintenance_Checkpoint] ON 

INSERT [dbo].[Maintenance_Checkpoint] ([checkpoint_id], [checklist_id], [checkpoint_name], [checkpoint_method], [process], [value_lower_limit], [value_upper_limit], [value_units], [estimated_completion_time_in_minutes], [created_by], [created_on]) VALUES (1, 1, N'checkpoint name test 1', N'method test 1', N'process 1', 1, 10, N'metre', 10, N'Khushi', CAST(N'2022-06-01T12:34:48.317' AS DateTime))
INSERT [dbo].[Maintenance_Checkpoint] ([checkpoint_id], [checklist_id], [checkpoint_name], [checkpoint_method], [process], [value_lower_limit], [value_upper_limit], [value_units], [estimated_completion_time_in_minutes], [created_by], [created_on]) VALUES (2, 2, N'checkpoint 2', N'method 2', N'process 2', 4, 6, N'Second', 5, N'Khushi', CAST(N'2022-06-01T12:35:31.803' AS DateTime))
INSERT [dbo].[Maintenance_Checkpoint] ([checkpoint_id], [checklist_id], [checkpoint_name], [checkpoint_method], [process], [value_lower_limit], [value_upper_limit], [value_units], [estimated_completion_time_in_minutes], [created_by], [created_on]) VALUES (3, 1, N'chp name 2', N'method', N'filename', 10, 20, N'metre', 10, N'Khushi', CAST(N'2022-06-01T17:20:32.763' AS DateTime))
SET IDENTITY_INSERT [dbo].[Maintenance_Checkpoint] OFF
GO
SET IDENTITY_INSERT [dbo].[Maintenance_Checkpoint_History] ON 

INSERT [dbo].[Maintenance_Checkpoint_History] ([uid], [checklist_id], [checkpoint_name], [actual_value], [checkpoint_status], [time_taken_in_minutes], [remarks], [created_by], [created_on]) VALUES (31, 2, N'checkpoint 2', 12, N'Not Ok', 12, N'12', N'Khushi', CAST(N'2022-06-02T15:08:08.377' AS DateTime))
SET IDENTITY_INSERT [dbo].[Maintenance_Checkpoint_History] OFF
GO
SET IDENTITY_INSERT [dbo].[Maintenance_Schedule] ON 

INSERT [dbo].[Maintenance_Schedule] ([uid], [checklist_id], [frequency_type], [frequency], [start_date], [alert_in_days], [status], [completed_on], [due_date], [days_left], [created_by], [created_on]) VALUES (1, 1, N'Day', 6, CAST(N'2022-05-26' AS Date), 5, 3, CAST(N'2022-05-25' AS Date), CAST(N'2022-05-31' AS Date), -2, N'Khushi', CAST(N'2022-06-01T12:36:46.750' AS DateTime))
INSERT [dbo].[Maintenance_Schedule] ([uid], [checklist_id], [frequency_type], [frequency], [start_date], [alert_in_days], [status], [completed_on], [due_date], [days_left], [created_by], [created_on]) VALUES (2, 2, N'Week', 2, CAST(N'2022-05-20' AS Date), 6, 1, CAST(N'2022-06-02' AS Date), CAST(N'2022-06-16' AS Date), 14, N'Khushi', CAST(N'2022-06-01T12:37:14.970' AS DateTime))
INSERT [dbo].[Maintenance_Schedule] ([uid], [checklist_id], [frequency_type], [frequency], [start_date], [alert_in_days], [status], [completed_on], [due_date], [days_left], [created_by], [created_on]) VALUES (3, 2, N'Week', 2, CAST(N'2022-06-01' AS Date), 4, 1, CAST(N'2022-06-02' AS Date), CAST(N'2022-06-16' AS Date), 14, N'Khushi', CAST(N'2022-06-01T17:22:13.060' AS DateTime))
SET IDENTITY_INSERT [dbo].[Maintenance_Schedule] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_Checklist_name]    Script Date: 02-06-2022 15:13:29 ******/
ALTER TABLE [dbo].[Maintenance_Checklist] ADD  CONSTRAINT [UC_Checklist_name] UNIQUE NONCLUSTERED 
(
	[checklist_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_Checkpoint_Name]    Script Date: 02-06-2022 15:13:29 ******/
ALTER TABLE [dbo].[Maintenance_Checkpoint_History] ADD  CONSTRAINT [UC_Checkpoint_Name] UNIQUE NONCLUSTERED 
(
	[checkpoint_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Maintenance_Checklist] ADD  CONSTRAINT [DF_Maintenance_Checklist_created_on]  DEFAULT (getdate()) FOR [created_on]
GO
ALTER TABLE [dbo].[Maintenance_Checkpoint] ADD  CONSTRAINT [DF_Maintenance_Checkpoint_created_on]  DEFAULT (getdate()) FOR [created_on]
GO
ALTER TABLE [dbo].[Maintenance_Checkpoint_History] ADD  CONSTRAINT [DF_Maintenance_Execution_created_on]  DEFAULT (getdate()) FOR [created_on]
GO
ALTER TABLE [dbo].[Maintenance_Schedule] ADD  CONSTRAINT [DF_Maintenance_Schedule_created_on]  DEFAULT (getdate()) FOR [created_on]
GO
ALTER TABLE [dbo].[Maintenance_Checklist]  WITH CHECK ADD  CONSTRAINT [FK_Maintenance_Checklist_Config_Stage] FOREIGN KEY([stage_id])
REFERENCES [dbo].[Config_Stage] ([stage_id])
GO
ALTER TABLE [dbo].[Maintenance_Checklist] CHECK CONSTRAINT [FK_Maintenance_Checklist_Config_Stage]
GO
ALTER TABLE [dbo].[Maintenance_Checkpoint]  WITH CHECK ADD  CONSTRAINT [FK_Maintenance_Checkpoint_Maintenance_Checklist] FOREIGN KEY([checklist_id])
REFERENCES [dbo].[Maintenance_Checklist] ([checklist_id])
GO
ALTER TABLE [dbo].[Maintenance_Checkpoint] CHECK CONSTRAINT [FK_Maintenance_Checkpoint_Maintenance_Checklist]
GO
ALTER TABLE [dbo].[Maintenance_Checkpoint_History]  WITH CHECK ADD  CONSTRAINT [FK_Maintenance_History_Maintenance_Checklist] FOREIGN KEY([checklist_id])
REFERENCES [dbo].[Maintenance_Checklist] ([checklist_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Maintenance_Checkpoint_History] CHECK CONSTRAINT [FK_Maintenance_History_Maintenance_Checklist]
GO
ALTER TABLE [dbo].[Maintenance_Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Maintenance_Schedule_Maintenance_Checklist] FOREIGN KEY([checklist_id])
REFERENCES [dbo].[Maintenance_Checklist] ([checklist_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Maintenance_Schedule] CHECK CONSTRAINT [FK_Maintenance_Schedule_Maintenance_Checklist]
GO
/****** Object:  StoredProcedure [dbo].[SP_Maintenance_Checklist]    Script Date: 02-06-2022 15:13:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Maintenance_Checklist]
-- Add the parameters for the stored procedure here

@checklist_id			int,
@checklist_name		    varchar(50),
@checklist_type         varchar(50),
@stage_name				varchar(50),
@line_name              varchar(50),
@created_by				varchar(50), --This value is that of the logged_in_user
@ActionOp				varchar(10)

AS
BEGIN

DECLARE @stage_id as int=(SELECT stage_id FROM Config_Stage WHERE stage_name=@stage_name AND line_id = (SELECT line_id from Config_Line WHERE line_name = @line_name))

DECLARE @isExist int = (select count(1) from[dbo].[Maintenance_Checklist] WHERE [checklist_id]=@checklist_id )
 
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

    -- Building the Create Statement
IF (@ActionOp= 'Create')
 BEGIN
 	BEGIN TRY
		INSERT INTO [dbo].[Maintenance_Checklist](
		--[user_id] field is not needed since this is an auto-increment column. Rest fields have been added.
		 [checklist_id],[checklist_name],[checklist_type],[stage_id],[created_by]
		) VALUES (
		--@user_id field is not needed since this is an auto-increment column. Rest fields have been added
		 @checklist_id,@checklist_name,@checklist_type,@stage_id,@created_by
		);

		SELECT 'Inserted Successfully' AS Response
 
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
			UPDATE  [dbo].[Maintenance_Checklist]SET
			[checklist_name]=@checklist_name,
            [checklist_type]=@checklist_type
			WHERE [checklist_id]=@checklist_id
			SELECT ' Modified successfully.' AS Response
          END
       else
          BEGIN
                SELECT '[Error]-You cannot modified this value. The key does not exist. Please try again. Thank You.' AS Response
          END
    END

-- Building the Delete Statement
ELSE IF (@ActionOp = 'Delete')
BEGIN
      if(@isExist>0)
        BEGIN
			DELETE FROM [dbo].[Maintenance_Checklist]
			WHERE [checklist_id]=@checklist_id
			SELECT ' Deleted successfully.' AS Response
		END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Maintenance_Checkpoint]    Script Date: 02-06-2022 15:13:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Maintenance_Checkpoint]
-- Add the parameters for the stored procedure here
@checkpoint_id          int,
@checklist_id			int,
@checkpoint_name		varchar(50),
@checkpoint_method      varchar(50),
@process				text,
@value_lower_limit      float,
@value_upper_limit      float,
@value_units            varchar(50),
@estimated_time         int,
@created_by				varchar(50), --This value is that of the logged_in_user
@ActionOp				varchar(10)

AS
BEGIN

--DECLARE @stage_id as int		= (SELECT distinct stage_id from Config_Stage where stage_name = @stage_name )

DECLARE @isExist int			= (select count(1) from [dbo].[Maintenance_Checkpoint] WHERE [checkpoint_id]=@checkpoint_id  )
 
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

    -- Building the Create Statement
IF (@ActionOp= 'Create')
 BEGIN
 	BEGIN TRY
		INSERT INTO [dbo].[Maintenance_Checkpoint] (
		--[user_id] field is not needed since this is an auto-increment column. Rest fields have been added.
		 [checklist_id],[checkpoint_name],[checkpoint_method],[process],[value_lower_limit],[value_upper_limit],[value_units],[estimated_completion_time_in_minutes],[created_by]
		) VALUES (
		--@user_id field is not needed since this is an auto-increment column. Rest fields have been added
		 @checklist_id,@checkpoint_name,@checkpoint_method,@process,@value_lower_limit,@value_upper_limit,@value_units,@estimated_time,@created_by
		);

		SELECT 'Inserted Successfully' AS Response
 
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
			UPDATE [dbo].[Maintenance_Checkpoint] SET
			[checkpoint_name]=@checkpoint_name,
            [checkpoint_method]=@checkpoint_method,
            [process]=@process,
            [value_lower_limit]=@value_lower_limit,
            [value_upper_limit]=@value_upper_limit,
            [estimated_completion_time_in_minutes]=@estimated_time
			WHERE [checkpoint_id]=@checkpoint_id 
			SELECT ' Modified successfully.' AS Response
          END
       else
          BEGIN
                SELECT '[Error]-You cannot modified this value. The key does not exist. Please try again. Thank You.' AS Response
          END
    END

-- Building the Delete Statement
ELSE IF (@ActionOp = 'Delete')
BEGIN
      if(@isExist>0)
        BEGIN
			DELETE FROM [dbo].[Maintenance_Checkpoint]
			WHERE [checkpoint_id]=@checkpoint_id
			SELECT ' Deleted successfully.' AS Response
		END
    END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Maintenance_Execution_Complete]    Script Date: 02-06-2022 15:13:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Exec [dbo].[SP_Maintenance_Execution_Complete] '2','Khushi'
--select * from [dbo].[Maintenance_Schedule]
--select * from [dbo].[Maintenance_Checklist_History]
CREATE PROCEDURE [dbo].[SP_Maintenance_Execution_Complete] 
@checklist_id int,
@completed_by varchar(50)
AS
BEGIN
declare @uid int
declare @FrequencyType varchar(50)
declare @Frequency int
declare @StartDate date
declare @Alert int
declare @DueDate date
declare @CompletedDate date
declare @Status int
declare @FrequencyAsInt int
declare @WarningDate date
declare @CurrentDate date
declare @DaysLeft int


set @CurrentDate = cast(GETDATE() as date)

declare UpdatePreventive cursor for
select [uid],[frequency_type],[Frequency],[start_date],[alert_in_days],[due_date],[completed_on],[days_left],[status] from [dbo].[Maintenance_Schedule]

open UpdatePreventive

fetch next from UpdatePreventive into @uid,@FrequencyType,@Frequency,@StartDate,@Alert,@DueDate,@CompletedDate,@DaysLeft,@Status

while @@FETCH_STATUS = 0

begin
if @FrequencyType = 'Day'
	set @FrequencyAsInt = @Frequency
else if @FrequencyType = 'Week'
	set @FrequencyAsInt = 7*@Frequency
else if @FrequencyType = 'Month'
	set @FrequencyAsInt = 30*@Frequency
else if @FrequencyType = 'Year'
	set @FrequencyAsInt = 365*@Frequency

--set @CompletedDate = cast(GETDATE() as date)



if @Status = 1
begin
	if @DueDate is null or @DueDate = ''
	begin
		update[dbo].[Maintenance_Schedule] set[due_date]  = DATEADD(DAY,@FrequencyAsInt,@StartDate) where [uid]=@uid
		set @DueDate = DATEADD(DAY,@FrequencyAsInt,@StartDate)
	end
end

if @CompletedDate is null or @CompletedDate = ''
begin
set nocount on;
end
else
begin
update[dbo].[Maintenance_Schedule] set[due_date]  = DATEADD(DAY,@FrequencyAsInt,@CompletedDate) where [uid]=@uid
		set @DueDate = DATEADD(DAY,@FrequencyAsInt,@CompletedDate)

end
--update [dbo].[Maintenance_Schedule] set [completed_on] = @CompletedDate where [uid]=@uid

INSERT INTO [dbo].[Maintenance_Checklist_History] (
		--[user_id] field is not needed since this is an auto-increment column. Rest fields have been added.
		 [checklist_id],[due_date],[start_datetime],[complete_datetime],[completed_by]
		) VALUES (
		--@user_id field is not needed since this is an auto-increment column. Rest fields have been added
		 @checklist_id,@DueDate,@StartDate,@CompletedDate,@completed_by
		);

set @WarningDate =  dateadd(DAY,(-1*@Alert),@DueDate)
if @CurrentDate < @WarningDate
	update[Maintenance_Schedule] set [status]  = 1 where  [uid]=@uid
else if @CurrentDate >= @WarningDate and @CurrentDate < @DueDate
	update [Maintenance_Schedule] set [status] = 2 where  [uid]=@uid
else if @CurrentDate >= @DueDate
	update [Maintenance_Schedule] set [status] = 3 where  [uid]=@uid
else
	update [Maintenance_Schedule] set [status] = 99 where [uid]=@uid


set @DaysLeft = DATEDIFF(DAY,cast(getdate() as date),@DueDate)
update [Maintenance_Schedule] set  [days_left]= @DaysLeft where[uid]=@uid


fetch next from UpdatePreventive into @uid,@FrequencyType,@Frequency,@StartDate,@Alert,@DueDate,@CompletedDate,@DaysLeft,@Status
end

close UpdatePreventive
deallocate UpdatePreventive
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Maintenance_Execution_CompleteDate]    Script Date: 02-06-2022 15:13:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Exec [dbo].[SP_Maintenance_Execution_CompleteDate] '2','Khushi'
--select * from [dbo].[Maintenance_Schedule]
--select * from [dbo].[Maintenance_Checklist_History]
CREATE PROCEDURE [dbo].[SP_Maintenance_Execution_CompleteDate] 
@checklist_id int
AS
BEGIN
declare @CompletedDate date
--declare @uid int = (Select [uid] from Maintenance_Schedule)
begin
	set @CompletedDate = cast(GETDATE() as date)
	update [dbo].[Maintenance_Schedule] set [completed_on] = @CompletedDate where checklist_id= @checklist_id
end
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Maintenance_Execution_Midnight]    Script Date: 02-06-2022 15:13:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Exec [dbo].[SP_Maintenance_Execution_Complete] '2','Khushi'
--select * from [dbo].[Maintenance_Schedule]
create PROCEDURE [dbo].[SP_Maintenance_Execution_Midnight] 

AS
BEGIN
declare @uid int
declare @FrequencyType varchar(50)
declare @Frequency int
declare @StartDate date
declare @Alert int
declare @DueDate date
declare @CompletedDate date
declare @Status int
declare @FrequencyAsInt int
declare @WarningDate date
declare @CurrentDate date
declare @DaysLeft int


set @CurrentDate = cast(GETDATE() as date)

declare UpdatePreventive cursor for
select [uid],[frequency_type],[Frequency],[start_date],[alert_in_days],[due_date],[completed_on],[days_left],[status] from [dbo].[Maintenance_Schedule]

open UpdatePreventive

fetch next from UpdatePreventive into @uid,@FrequencyType,@Frequency,@StartDate,@Alert,@DueDate,@CompletedDate,@DaysLeft,@Status

while @@FETCH_STATUS = 0

begin
if @FrequencyType = 'Day'
	set @FrequencyAsInt = @Frequency
else if @FrequencyType = 'Week'
	set @FrequencyAsInt = 7*@Frequency
else if @FrequencyType = 'Month'
	set @FrequencyAsInt = 30*@Frequency
else if @FrequencyType = 'Year'
	set @FrequencyAsInt = 365*@Frequency

--set @CompletedDate = cast(GETDATE() as date)


if @Status = 1
begin
	if @DueDate is null or @DueDate = ''
	begin
		update[dbo].[Maintenance_Schedule] set[due_date]  = DATEADD(DAY,@FrequencyAsInt,@StartDate) where [uid]=@uid
		set @DueDate = DATEADD(DAY,@FrequencyAsInt,@StartDate)
	end
end

if @CompletedDate is null or @CompletedDate = ''
begin
set nocount on;
end
else
begin
update[dbo].[Maintenance_Schedule] set[due_date]  = DATEADD(DAY,@FrequencyAsInt,@CompletedDate) where [uid]=@uid
		set @DueDate = DATEADD(DAY,@FrequencyAsInt,@CompletedDate)

end
--update [dbo].[Maintenance_Schedule] set [completed_on] = @CompletedDate where [uid]=@uid



set @WarningDate =  dateadd(DAY,(-1*@Alert),@DueDate)
if @CurrentDate < @WarningDate
	update[Maintenance_Schedule] set [status]  = 1 where  [uid]=@uid
else if @CurrentDate >= @WarningDate and @CurrentDate < @DueDate
	update [Maintenance_Schedule] set [status] = 2 where  [uid]=@uid
else if @CurrentDate >= @DueDate
	update [Maintenance_Schedule] set [status] = 3 where  [uid]=@uid
else
	update [Maintenance_Schedule] set [status] = 99 where [uid]=@uid


set @DaysLeft = DATEDIFF(DAY,cast(getdate() as date),@DueDate)
update [Maintenance_Schedule] set  [days_left]= @DaysLeft where[uid]=@uid


fetch next from UpdatePreventive into @uid,@FrequencyType,@Frequency,@StartDate,@Alert,@DueDate,@CompletedDate,@DaysLeft,@Status
end

close UpdatePreventive
deallocate UpdatePreventive
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Maintenance_Execution_Save]    Script Date: 02-06-2022 15:13:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE    PROCEDURE [dbo].[SP_Maintenance_Execution_Save]
-- Add the parameters for the stored procedure here
@checklist_id			int,
@checkpoint_name		varchar(50),
@actual_value           varchar(50),
@checkpoint_status	    varchar(50),
@time_taken				int,
@remarks				text,
@created_by				varchar(50), --This value is that of the logged_in_user
@ActionOp				varchar(10)


AS
BEGIN
declare @value_ul as varchar(20)=(select[value_upper_limit] from  [dbo].[Maintenance_Checkpoint] where [checkpoint_name]=@checkpoint_name)
declare @value_ll as varchar(20)=(select[value_lower_limit] from [dbo].[Maintenance_Checkpoint] where [checkpoint_name]=@checkpoint_name)


-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;



    -- Building the Create Statement
IF (@ActionOp= 'Save')
BEGIN
If( (@value_ul >= @actual_value) and (@actual_value > @value_ll))

set @checkpoint_status='Ok'
else  set @checkpoint_status='Not Ok'

		INSERT INTO [dbo].[Maintenance_Checkpoint_History] (
		[checklist_id],[checkpoint_name],[actual_value],[checkpoint_status],[time_taken_in_minutes],[remarks],[created_by]
		) VALUES (
		@checklist_id,@checkpoint_name,@actual_value,@checkpoint_status,@time_taken,@remarks,@created_by
		);
		SELECT 'Success!' AS Response
	
        
END

    
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Maintenance_Schedule]    Script Date: 02-06-2022 15:13:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Maintenance_Schedule]
-- Add the parameters for the stored procedure here

@checklist_id			int,
@frequency_type		    varchar(50),
@frequency              int,
@start_date				date,
@alert                  int,
@status                 int,
@created_by				varchar(50), --This value is that of the logged_in_user
@ActionOp				varchar(10)

AS
BEGIN

--DECLARE @stage_id as int		= (SELECT distinct stage_id from Config_Stage where stage_name = @stage_name )

DECLARE @isExist int			= (select count(1) from[dbo].[Maintenance_Schedule]  WHERE [checklist_id]=@checklist_id  )
 
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

    -- Building the Create Statement
IF (@ActionOp= 'Create')
 BEGIN
 	BEGIN TRY
		INSERT INTO [dbo].[Maintenance_Schedule] (
		--[user_id] field is not needed since this is an auto-increment column. Rest fields have been added.
		 [checklist_id],[frequency_type],[frequency],[start_date],[alert_in_days],[status],[created_by]
		) VALUES (
		--@user_id field is not needed since this is an auto-increment column. Rest fields have been added
		 @checklist_id,@frequency_type,@frequency,@start_date,@alert,@status,@created_by
		);

		SELECT 'Inserted Successfully' AS Response
 
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
			UPDATE[dbo].[Maintenance_Schedule] SET
			[frequency_type]=@frequency_type,
            [frequency]=@frequency,
            [start_date]=@start_date,
            [alert_in_days]=@alert
			WHERE [checklist_id]=@checklist_id
			SELECT ' Modified successfully.' AS Response
          END
       else
          BEGIN
                SELECT '[Error]-You cannot modified this value. The key does not exist. Please try again. Thank You.' AS Response
          END
    END

-- Building the Delete Statement
ELSE IF (@ActionOp = 'Delete')
BEGIN
      if(@isExist>0)
        BEGIN
			DELETE FROM [dbo].[Maintenance_Schedule]
			WHERE [checklist_id]=@checklist_id
			SELECT ' Deleted successfully.' AS Response
		END
    END
END

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[79] 4[3] 2[3] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Config_Line"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 265
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Config_Plant"
            Begin Extent = 
               Top = 9
               Left = 336
               Bottom = 214
               Right = 558
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Config_Shop"
            Begin Extent = 
               Top = 9
               Left = 615
               Bottom = 235
               Right = 837
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Config_Stage"
            Begin Extent = 
               Top = 9
               Left = 894
               Bottom = 265
               Right = 1116
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Maintenance_Checklist"
            Begin Extent = 
               Top = 288
               Left = 235
               Bottom = 558
               Right = 457
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Maintenance_Checklist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Maintenance_Checklist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Maintenance_Checklist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[88] 4[3] 2[3] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Config_Line"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Config_Plant"
            Begin Extent = 
               Top = 9
               Left = 336
               Bottom = 206
               Right = 558
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Config_Shop"
            Begin Extent = 
               Top = 9
               Left = 615
               Bottom = 206
               Right = 837
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Config_Stage"
            Begin Extent = 
               Top = 9
               Left = 894
               Bottom = 206
               Right = 1116
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Maintenance_Checklist"
            Begin Extent = 
               Top = 207
               Left = 57
               Bottom = 514
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Maintenance_Checkpoint"
            Begin Extent = 
               Top = 207
               Left = 336
               Bottom = 592
               Right = 748
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Maintenance_Checkpoint'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Maintenance_Checkpoint'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Maintenance_Checkpoint'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[80] 4[3] 2[2] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Config_Line"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Config_Shop"
            Begin Extent = 
               Top = 9
               Left = 615
               Bottom = 206
               Right = 837
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Config_Plant"
            Begin Extent = 
               Top = 9
               Left = 336
               Bottom = 206
               Right = 558
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Config_Stage"
            Begin Extent = 
               Top = 9
               Left = 894
               Bottom = 206
               Right = 1116
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Maintenance_Checkpoint_History"
            Begin Extent = 
               Top = 190
               Left = 745
               Bottom = 535
               Right = 1025
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Maintenance_Checklist"
            Begin Extent = 
               Top = 207
               Left = 57
               Bottom = 538
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin Column' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Maintenance_Execution'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'Widths = 11
         Column = 1440
         Alias = 870
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1390
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Maintenance_Execution'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Maintenance_Execution'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[84] 4[3] 2[3] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Config_Line"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Config_Shop"
            Begin Extent = 
               Top = 9
               Left = 615
               Bottom = 206
               Right = 837
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Config_Plant"
            Begin Extent = 
               Top = 9
               Left = 336
               Bottom = 206
               Right = 558
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Config_Stage"
            Begin Extent = 
               Top = 9
               Left = 894
               Bottom = 206
               Right = 1116
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Maintenance_Checklist"
            Begin Extent = 
               Top = 207
               Left = 57
               Bottom = 491
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Maintenance_Checkpoint"
            Begin Extent = 
               Top = 209
               Left = 308
               Bottom = 607
               Right = 720
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Maintenance_Schedule"
            Begin Extent = 
               Top = 226
               Left = 853
               Bottom = 606
               Right' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Maintenance_Schedule'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' = 1077
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Maintenance_Schedule'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Maintenance_Schedule'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[59] 4[13] 2[25] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Config_Line"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Config_Shop"
            Begin Extent = 
               Top = 9
               Left = 615
               Bottom = 206
               Right = 837
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Config_Plant"
            Begin Extent = 
               Top = 9
               Left = 336
               Bottom = 206
               Right = 558
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Config_Stage"
            Begin Extent = 
               Top = 9
               Left = 894
               Bottom = 206
               Right = 1116
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Maintenance_Checklist"
            Begin Extent = 
               Top = 260
               Left = 80
               Bottom = 561
               Right = 302
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Maintenance_Schedule"
            Begin Extent = 
               Top = 191
               Left = 588
               Bottom = 667
               Right = 812
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Maintenance_Status_Monitor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Maintenance_Status_Monitor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Maintenance_Status_Monitor'
GO
