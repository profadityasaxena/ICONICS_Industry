USE [BajajMEA]
GO
/****** Object:  Table [dbo].[Rework_and_Reject_Inspection]    Script Date: 07-06-2022 18:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rework_and_Reject_Inspection](
	[uid] [int] IDENTITY(1,1) NOT NULL,
	[inspection_gate] [varchar](50) NOT NULL,
	[inspection_type] [varchar](50) NOT NULL,
	[inspection_name] [varchar](50) NOT NULL,
	[inspection_description] [text] NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_on] [datetime] NOT NULL,
 CONSTRAINT [PK_Rework_and_Reject_Inspection] PRIMARY KEY CLUSTERED 
(
	[inspection_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rework_and_Reject_Defect]    Script Date: 07-06-2022 18:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rework_and_Reject_Defect](
	[uid] [int] IDENTITY(1,1) NOT NULL,
	[inspection_name] [varchar](50) NOT NULL,
	[defect_name] [varchar](50) NOT NULL,
	[defect_description] [text] NOT NULL,
	[q_alert_stage] [varchar](50) NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_on] [datetime] NOT NULL,
 CONSTRAINT [PK_Rework_and_Reject_Defect] PRIMARY KEY CLUSTERED 
(
	[defect_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Rework_and_Reject_Defect]    Script Date: 07-06-2022 18:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Rework_and_Reject_Defect]
AS
SELECT dbo.Rework_and_Reject_Defect.uid, dbo.Rework_and_Reject_Inspection.inspection_gate, dbo.Rework_and_Reject_Inspection.inspection_name, dbo.Rework_and_Reject_Inspection.inspection_description, dbo.Rework_and_Reject_Defect.defect_name, 
             dbo.Rework_and_Reject_Defect.defect_description, dbo.Rework_and_Reject_Defect.q_alert_stage, dbo.Rework_and_Reject_Defect.created_by, dbo.Rework_and_Reject_Defect.created_on
FROM   dbo.Rework_and_Reject_Defect INNER JOIN
             dbo.Rework_and_Reject_Inspection ON dbo.Rework_and_Reject_Defect.inspection_name = dbo.Rework_and_Reject_Inspection.inspection_name
GO
/****** Object:  Table [dbo].[Rework_and_Reject_Quality_Gate]    Script Date: 07-06-2022 18:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rework_and_Reject_Quality_Gate](
	[uid] [int] IDENTITY(1,1) NOT NULL,
	[engine_number] [varchar](50) NOT NULL,
	[model] [varchar](50) NULL,
	[sku] [varchar](50) NULL,
	[inspection_gate] [varchar](50) NOT NULL,
	[inspection_name] [varchar](50) NOT NULL,
	[defect_name] [varchar](50) NOT NULL,
	[defect_status] [int] NULL,
	[remarks] [text] NULL,
	[created_by] [varchar](50) NULL,
	[created_on] [datetime] NOT NULL,
 CONSTRAINT [PK__Rework_a__14B88F3CFD41D6F1] PRIMARY KEY CLUSTERED 
(
	[engine_number] ASC,
	[inspection_gate] ASC,
	[inspection_name] ASC,
	[defect_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Rework_and_Reject_Quality_Gate]    Script Date: 07-06-2022 18:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Rework_and_Reject_Quality_Gate]
AS
SELECT   dbo.Rework_and_Reject_Quality_Gate.uid, dbo.Rework_and_Reject_Inspection.inspection_gate, dbo.Rework_and_Reject_Inspection.inspection_name, dbo.Rework_and_Reject_Inspection.inspection_description, dbo.Rework_and_Reject_Defect.defect_name, dbo.Rework_and_Reject_Defect.defect_description, 
             dbo.Rework_and_Reject_Defect.q_alert_stage, dbo.Rework_and_Reject_Quality_Gate.defect_status, dbo.Rework_and_Reject_Quality_Gate.remarks, dbo.Rework_and_Reject_Quality_Gate.engine_number, dbo.Rework_and_Reject_Quality_Gate.model, dbo.Rework_and_Reject_Quality_Gate.sku, 
             dbo.Rework_and_Reject_Quality_Gate.created_by, dbo.Rework_and_Reject_Quality_Gate.created_on
FROM     dbo.Rework_and_Reject_Inspection INNER JOIN
             dbo.Rework_and_Reject_Defect ON dbo.Rework_and_Reject_Inspection.inspection_name = dbo.Rework_and_Reject_Defect.inspection_name INNER JOIN
             dbo.Rework_and_Reject_Quality_Gate ON dbo.Rework_and_Reject_Inspection.inspection_name = dbo.Rework_and_Reject_Quality_Gate.inspection_name AND dbo.Rework_and_Reject_Defect.defect_name = dbo.Rework_and_Reject_Quality_Gate.defect_name
GO
/****** Object:  Table [dbo].[Rework_and_Reject_Inspection_Gate]    Script Date: 07-06-2022 18:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rework_and_Reject_Inspection_Gate](
	[uid] [int] IDENTITY(1,1) NOT NULL,
	[inspection_gate_name] [varchar](50) NOT NULL,
	[created_on] [datetime] NOT NULL,
 CONSTRAINT [PK_Rework_and_Reject_Inspection_Gate] PRIMARY KEY CLUSTERED 
(
	[inspection_gate_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rework_and_Reject_Rework]    Script Date: 07-06-2022 18:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rework_and_Reject_Rework](
	[uid] [int] IDENTITY(1,1) NOT NULL,
	[engine_number] [varchar](50) NOT NULL,
	[model] [varchar](50) NOT NULL,
	[sku] [varchar](50) NOT NULL,
	[engine_status] [varchar](50) NOT NULL,
	[inspection_name] [varchar](50) NOT NULL,
	[defect_name] [varchar](50) NOT NULL,
	[defect_status] [int] NOT NULL,
	[remarks] [text] NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_on] [datetime] NOT NULL,
 CONSTRAINT [PK_Rework] PRIMARY KEY CLUSTERED 
(
	[engine_number] ASC,
	[inspection_name] ASC,
	[defect_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Rework_and_Reject_Defect] ON 

INSERT [dbo].[Rework_and_Reject_Defect] ([uid], [inspection_name], [defect_name], [defect_description], [q_alert_stage], [created_by], [created_on]) VALUES (6, N'ins name 4', N'def name 4.1', N'def desc 4.1', N'Stage 0', N'Khushi', CAST(N'2022-06-07T11:55:59.863' AS DateTime))
INSERT [dbo].[Rework_and_Reject_Defect] ([uid], [inspection_name], [defect_name], [defect_description], [q_alert_stage], [created_by], [created_on]) VALUES (7, N'ins name 4', N'def name 4.2', N'def desc 4.2', N'Stage 0', N'Khushi', CAST(N'2022-06-07T11:56:14.757' AS DateTime))
INSERT [dbo].[Rework_and_Reject_Defect] ([uid], [inspection_name], [defect_name], [defect_description], [q_alert_stage], [created_by], [created_on]) VALUES (8, N'ins name 4', N'def name 4.3', N'def desc 4.3', N'Stage 0', N'Khushi', CAST(N'2022-06-07T11:56:27.467' AS DateTime))
INSERT [dbo].[Rework_and_Reject_Defect] ([uid], [inspection_name], [defect_name], [defect_description], [q_alert_stage], [created_by], [created_on]) VALUES (3, N'name 3', N'defect 1', N'dec 1', N'Stage 0', N'Khushi', CAST(N'2022-06-06T11:38:03.597' AS DateTime))
INSERT [dbo].[Rework_and_Reject_Defect] ([uid], [inspection_name], [defect_name], [defect_description], [q_alert_stage], [created_by], [created_on]) VALUES (9, N'name', N'defect 2.1', N'dec 2.1', N'Stage 0', N'Khushi', CAST(N'2022-06-07T14:55:36.357' AS DateTime))
INSERT [dbo].[Rework_and_Reject_Defect] ([uid], [inspection_name], [defect_name], [defect_description], [q_alert_stage], [created_by], [created_on]) VALUES (10, N'name 1', N'defect 2.2', N'dec 2.2', N'Stage 0', N'Khushi', CAST(N'2022-06-07T14:57:52.840' AS DateTime))
INSERT [dbo].[Rework_and_Reject_Defect] ([uid], [inspection_name], [defect_name], [defect_description], [q_alert_stage], [created_by], [created_on]) VALUES (5, N'name 3', N'defect 3.2', N'dec 3', N'Stage 0', N'Khushi', CAST(N'2022-06-06T11:38:03.597' AS DateTime))
SET IDENTITY_INSERT [dbo].[Rework_and_Reject_Defect] OFF
GO
SET IDENTITY_INSERT [dbo].[Rework_and_Reject_Inspection] ON 

INSERT [dbo].[Rework_and_Reject_Inspection] ([uid], [inspection_gate], [inspection_type], [inspection_name], [inspection_description], [created_by], [created_on]) VALUES (10, N'gate test 4', N'Data Collection', N'ins name 4', N'ins desc 4', N'Khushi', CAST(N'2022-06-07T11:47:39.180' AS DateTime))
INSERT [dbo].[Rework_and_Reject_Inspection] ([uid], [inspection_gate], [inspection_type], [inspection_name], [inspection_description], [created_by], [created_on]) VALUES (5, N'gate test 2', N'Visual', N'name', N'des 1', N'Khushi', CAST(N'2022-06-06T10:57:12.343' AS DateTime))
INSERT [dbo].[Rework_and_Reject_Inspection] ([uid], [inspection_gate], [inspection_type], [inspection_name], [inspection_description], [created_by], [created_on]) VALUES (8, N'gate test 2', N'Visual', N'name 1', N'des 2', N'Khushi', CAST(N'2022-06-06T10:59:35.310' AS DateTime))
INSERT [dbo].[Rework_and_Reject_Inspection] ([uid], [inspection_gate], [inspection_type], [inspection_name], [inspection_description], [created_by], [created_on]) VALUES (9, N'gate test 1', N'Visual', N'name 3', N'des 3', N'Khushi', CAST(N'2022-06-06T10:59:46.610' AS DateTime))
SET IDENTITY_INSERT [dbo].[Rework_and_Reject_Inspection] OFF
GO
SET IDENTITY_INSERT [dbo].[Rework_and_Reject_Inspection_Gate] ON 

INSERT [dbo].[Rework_and_Reject_Inspection_Gate] ([uid], [inspection_gate_name], [created_on]) VALUES (2, N'gate test 1', CAST(N'2022-06-04T12:56:42.683' AS DateTime))
INSERT [dbo].[Rework_and_Reject_Inspection_Gate] ([uid], [inspection_gate_name], [created_on]) VALUES (3, N'gate test 2', CAST(N'2022-06-04T13:04:38.120' AS DateTime))
INSERT [dbo].[Rework_and_Reject_Inspection_Gate] ([uid], [inspection_gate_name], [created_on]) VALUES (4, N'gate test 3', CAST(N'2022-06-06T10:07:43.100' AS DateTime))
INSERT [dbo].[Rework_and_Reject_Inspection_Gate] ([uid], [inspection_gate_name], [created_on]) VALUES (5, N'gate test 4', CAST(N'2022-06-07T11:46:53.920' AS DateTime))
SET IDENTITY_INSERT [dbo].[Rework_and_Reject_Inspection_Gate] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_Quality_Gate]    Script Date: 07-06-2022 18:14:01 ******/
ALTER TABLE [dbo].[Rework_and_Reject_Quality_Gate] ADD  CONSTRAINT [UC_Quality_Gate] UNIQUE NONCLUSTERED 
(
	[engine_number] ASC,
	[inspection_name] ASC,
	[defect_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Rework_and_Reject_Defect] ADD  CONSTRAINT [DF_Rework_and_Reject_Defect_created_on]  DEFAULT (getdate()) FOR [created_on]
GO
ALTER TABLE [dbo].[Rework_and_Reject_Inspection] ADD  CONSTRAINT [DF_Rework_and_Reject_Inspection_created_on]  DEFAULT (getdate()) FOR [created_on]
GO
ALTER TABLE [dbo].[Rework_and_Reject_Inspection_Gate] ADD  CONSTRAINT [DF_Rework_and_Reject_Inspection_Gate_created_on]  DEFAULT (getdate()) FOR [created_on]
GO
ALTER TABLE [dbo].[Rework_and_Reject_Quality_Gate] ADD  CONSTRAINT [DF_Rework_and_Reject_Quality_Gate_created_on]  DEFAULT (getdate()) FOR [created_on]
GO
ALTER TABLE [dbo].[Rework_and_Reject_Rework] ADD  CONSTRAINT [DF_Rework_and_Reject_Rework_created_on]  DEFAULT (getdate()) FOR [created_on]
GO
ALTER TABLE [dbo].[Rework_and_Reject_Defect]  WITH CHECK ADD  CONSTRAINT [FK_Rework_and_Reject_Defect_Rework_and_Reject_Inspection] FOREIGN KEY([inspection_name])
REFERENCES [dbo].[Rework_and_Reject_Inspection] ([inspection_name])
GO
ALTER TABLE [dbo].[Rework_and_Reject_Defect] CHECK CONSTRAINT [FK_Rework_and_Reject_Defect_Rework_and_Reject_Inspection]
GO
ALTER TABLE [dbo].[Rework_and_Reject_Inspection]  WITH CHECK ADD  CONSTRAINT [FK_Rework_and_Reject_Inspection_Rework_and_Reject_Inspection_Gate] FOREIGN KEY([inspection_gate])
REFERENCES [dbo].[Rework_and_Reject_Inspection_Gate] ([inspection_gate_name])
GO
ALTER TABLE [dbo].[Rework_and_Reject_Inspection] CHECK CONSTRAINT [FK_Rework_and_Reject_Inspection_Rework_and_Reject_Inspection_Gate]
GO
ALTER TABLE [dbo].[Rework_and_Reject_Quality_Gate]  WITH CHECK ADD  CONSTRAINT [FK_Rework_and_Reject_Quality_Gate_Rework_and_Reject_Defect] FOREIGN KEY([defect_name])
REFERENCES [dbo].[Rework_and_Reject_Defect] ([defect_name])
GO
ALTER TABLE [dbo].[Rework_and_Reject_Quality_Gate] CHECK CONSTRAINT [FK_Rework_and_Reject_Quality_Gate_Rework_and_Reject_Defect]
GO
ALTER TABLE [dbo].[Rework_and_Reject_Quality_Gate]  WITH CHECK ADD  CONSTRAINT [FK_Rework_and_Reject_Quality_Gate_Rework_and_Reject_Inspection] FOREIGN KEY([inspection_name])
REFERENCES [dbo].[Rework_and_Reject_Inspection] ([inspection_name])
GO
ALTER TABLE [dbo].[Rework_and_Reject_Quality_Gate] CHECK CONSTRAINT [FK_Rework_and_Reject_Quality_Gate_Rework_and_Reject_Inspection]
GO
/****** Object:  StoredProcedure [dbo].[SP_Defect]    Script Date: 07-06-2022 18:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE     PROCEDURE [dbo].[SP_Defect]
-- Add the parameters for the stored procedure here
@inspection_name           varchar(50),
@defect_name               varchar(50),
@q_alert_stage             varchar(50),
@defect_description        text,
@created_by                varchar(50), --This value is that of the logged_in_user
@ActionOp                  varchar(10)

AS
BEGIN
DECLARE @isExist int    = (select count(1) from[dbo].[Rework_and_Reject_Defect]  WHERE [defect_name]=@defect_name )

-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

--DECLARE @inspection_gate as varchar(50) = (SELECT [inspection_gate_name] from [dbo].[Rework_and_Reject_Inspection_Gate] );

-- Building the Create Statement
IF (@ActionOp= 'Create')
BEGIN
	BEGIN TRY
		INSERT INTO  [dbo].[Rework_and_Reject_Defect] (
	    [inspection_name],[defect_name],[defect_description],[q_alert_stage],[created_by]
        ) VALUES (
	    @inspection_name,@defect_name,@defect_description,@q_alert_stage,@created_by
        );
		SELECT 'Success!' AS Response
	END TRY
	BEGIN CATCH
-- statement to handle errors
        IF  ERROR_NUMBER()=2627
		SELECT '[Error]-Defect Name needs to be unique. This Defect Name already Exists. Please try a different and unique ID. (Detail - You cannot insert this value into the table as there is a primary key/unique key violation or one of the inputs is incorrect).' AS Response
	END CATCH
END
-- Read statement is not required as the SCADA is already reading the data.

-- Building the Update Statement
ELSE IF (@ActionOp = 'Update')
    BEGIN
        if(@isExist > 0)
            BEGIN
				UPDATE [dbo].[Rework_and_Reject_Defect] SET
				[defect_description]=@defect_description,
                [q_alert_stage] = @q_alert_stage
				WHERE [defect_name]=@defect_name
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
				DELETE FROM [dbo].[Rework_and_Reject_Defect]
				WHERE [defect_name]=@defect_name
				select ' Deleted successfully.' AS Response
			END
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Inspection]    Script Date: 07-06-2022 18:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE     PROCEDURE [dbo].[SP_Inspection]
-- Add the parameters for the stored procedure here
@inspection_name           varchar(50),
@inspection_gate           varchar(50),
@inspection_type	       varchar(50),
@inspection_description    text,
@created_by                varchar(50), --This value is that of the logged_in_user
@ActionOp                  varchar(10)

AS
BEGIN
DECLARE @isExist int    = (select count(1) from [dbo].[Rework_and_Reject_Inspection] WHERE [inspection_name]=@inspection_name )

-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

--DECLARE @inspection_gate as varchar(50) = (SELECT [inspection_gate_name] from [dbo].[Rework_and_Reject_Inspection_Gate] );

-- Building the Create Statement
IF (@ActionOp= 'Create')
BEGIN
	BEGIN TRY
		INSERT INTO [dbo].[Rework_and_Reject_Inspection]  (
	    [inspection_gate],[inspection_type],[inspection_name],[inspection_description],[created_by]
        ) VALUES (
	    @inspection_gate,@inspection_type,@inspection_name,@inspection_description,@created_by
        );
		SELECT 'Success!' AS Response
	END TRY
	BEGIN CATCH
-- statement to handle errors
        IF  ERROR_NUMBER()=2627
		SELECT '[Error]-Inspection Name needs to be unique. This Inspection Name already Exists. Please try a different and unique ID. (Detail - You cannot insert this value into the table as there is a primary key/unique key violation or one of the inputs is incorrect).' AS Response
	END CATCH
END
-- Read statement is not required as the SCADA is already reading the data.

-- Building the Update Statement
ELSE IF (@ActionOp = 'Update')
    BEGIN
        if(@isExist > 0)
            BEGIN
				UPDATE[dbo].[Rework_and_Reject_Inspection]  SET
				[inspection_type]=@inspection_gate,
                [inspection_description]=@inspection_description
				WHERE [inspection_name]=@inspection_name
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
				DELETE FROM [dbo].[Rework_and_Reject_Inspection]
				WHERE [inspection_name]=@inspection_name
				select ' Deleted successfully.' AS Response
			END
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Inspection_Gate]    Script Date: 07-06-2022 18:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>

CREATE    PROCEDURE [dbo].[SP_Inspection_Gate]
-- Add the parameters for the stored procedure here

@inspection_gate_name 		   varchar(50),
@ActionOp					   varchar(10)

AS
BEGIN
DECLARE @isExist int    = (select count(1) from [dbo].[Rework_and_Reject_Inspection_Gate] WHERE [inspection_gate_name]=@inspection_gate_name)

-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;


-- Building the Create Statement
IF (@ActionOp= 'Create')
BEGIN
	BEGIN TRY
		INSERT INTO [dbo].[Rework_and_Reject_Inspection_Gate] (
	    [inspection_gate_name]
        ) VALUES (
	    @inspection_gate_name
        );
		SELECT 'Success!' AS Response
	END TRY
	BEGIN CATCH
-- statement to handle errors
        IF  ERROR_NUMBER()=2627
		SELECT '[Error]-Inspection Gate needs to be unique. This Inspection Gate already Exists. Please try a different and unique ID. (Detail - You cannot insert this value into the table as there is a primary key/unique key violation or one of the inputs is incorrect).' AS Response
	END CATCH
END
-- Read statement is not required as the SCADA is already reading the data.


-- Building the Delete Statement
ELSE IF (@ActionOp = 'Delete')
   BEGIN
      if(@isExist>0)
		BEGIN
			DELETE FROM [dbo].[Rework_and_Reject_Inspection_Gate]
			WHERE [inspection_gate_name]=@inspection_gate_name
			select ' Deleted successfully.' AS Response
		END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Quality_Gate]    Script Date: 07-06-2022 18:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_Quality_Gate]
-- Add the parameters for the stored procedure here
@engine_number             varchar(50),
@model                     varchar(50),
@sku                       varchar(50),
@inspection_gate           varchar(50),
@inspection_name           varchar(50),
@defect_name               varchar(50),
@defect_status             varchar(50),
@remarks                   text,
@created_by                varchar(50), --This value is that of the logged_in_user
@ActionOp                  varchar(10)

AS
BEGIN
DECLARE @isExist int    = (select count(1) from [dbo].[Rework_and_Reject_Quality_Gate] WHERE [engine_number]=@engine_number AND [inspection_gate]=@inspection_gate AND inspection_name = @inspection_name AND [defect_name]=@defect_name)

-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

--DECLARE @inspection_gate as varchar(50) = (SELECT [inspection_gate_name] from [dbo].[Rework_and_Reject_Inspection_Gate] );

-- Building the Create Statement
IF (@ActionOp= 'Save')
BEGIN
DECLARE @defect_status_int int

if @defect_status='Ok'
begin
 set @defect_status_int=0
end
else if @defect_status='Not Ok'
begin
 set @defect_status_int=1
end
BEGIN TRY
		INSERT INTO [dbo].[Rework_and_Reject_Quality_Gate] (
	    [engine_number],[model],[sku],[inspection_gate],[inspection_name],[defect_name],[defect_status],[remarks],[created_by]
        ) VALUES (
	    @engine_number,@model,@sku,@inspection_gate,@inspection_name,@defect_name,@defect_status_int,@remarks,@created_by
        );
		SELECT 'Success!' AS Response
END TRY
BEGIN CATCH
-- statement to handle errors
        IF  ERROR_NUMBER()=2627
		SELECT '[Error]-Engine , Inspection and Defect need to be unique. This Combination already Exists. Please try a different and unique ID. (Detail - You cannot insert this value into the table as there is a primary key/unique key violation or one of the inputs is incorrect).' AS Response
END CATCH
		INSERT INTO [dbo].[Rework_and_Reject_Rework] (
	    [engine_number],[model],[sku],[engine_status],[inspection_name],[defect_name],[defect_status],[created_by]
        ) VALUES (
	    @engine_number,@model,@sku,4,@inspection_name,@defect_name,1,@created_by
        );
		SELECT 'Success!' AS Response
		 

        

	       BEGIN
		   begin
		     if @defect_status_int=0
				UPDATE  [dbo].[OrderManagement_Engine_WIP]
				SET
				[engine_status]=4,
                [line]=9
				WHERE [engine_number]=@engine_number
				select ' Modified successfully.' AS Response
			end
			begin
				if @defect_status_int=1
				UPDATE  [dbo].[OrderManagement_Engine_WIP]
				SET
				[engine_status]=2,
                [line]=5
				WHERE [engine_number]=@engine_number
				select ' Modified successfully.' AS Response
		   end

            END

END

ELSE IF (@ActionOp = 'Update')	
BEGIN

if @defect_status='Ok'
begin
 set @defect_status_int=0
end
else if @defect_status='Not Ok'
begin
 set @defect_status_int=1
end
		BEGIN
		UPDATE  [dbo].[Rework_and_Reject_Quality_Gate] SET
				[defect_status]=@defect_status_int,
				[remarks]=@remarks
				WHERE [engine_number]=@engine_number and inspection_name=@inspection_name and defect_name=@defect_name
				select ' Modified successfully.' AS Response

		

	       BEGIN
		   begin
		     if @defect_status_int=0
				UPDATE  [dbo].[OrderManagement_Engine_WIP]
				SET
				[engine_status]=4,
                [line]=9
				WHERE [engine_number]=@engine_number
				select ' Modified successfully.' AS Response
			end
			begin
				if @defect_status_int=1
	
				
				UPDATE  [dbo].[OrderManagement_Engine_WIP]
				SET
				[engine_status]=2,
                [line]=5
				WHERE [engine_number]=@engine_number
				select ' Modified successfully.' AS Response
				end
		   

            END
END
END

---- Building the All OK 
ELSE IF (@ActionOp = 'All_Ok')
    BEGIN
	set @defect_status=0
        BEGIN
		BEGIN TRY
		INSERT INTO [dbo].[Rework_and_Reject_Quality_Gate] (
	    [engine_number],[model],[sku],[inspection_gate],[inspection_name],[defect_name],[defect_status],[remarks],[created_by]
        )  SELECT 
	    @engine_number,@model,@sku,@inspection_gate,@inspection_name,[defect_name],@defect_status,'OK',@created_by
        FROM [dbo].[Rework_and_Reject_Defect] WHERE [inspection_name]=@inspection_name and [defect_name]!= @defect_name;
		SELECT 'Success!' AS Response
		END TRY
		BEGIN CATCH
-- statement to handle errors
        IF  ERROR_NUMBER()=2627
		SELECT '[Error]-Engine , Inspection and Defect need to be unique. This Combination already Exists. Please try a different and unique ID. (Detail - You cannot insert this value into the table as there is a primary key/unique key violation or one of the inputs is incorrect).' AS Response
        END CATCH
        END

		BEGIN
		UPDATE  [dbo].[Rework_and_Reject_Quality_Gate] SET
				[defect_status]=@defect_status,
				[remarks]=@remarks
				WHERE [engine_number]=@engine_number and inspection_name=@inspection_name and defect_name=@defect_name
				select ' Modified successfully.' AS Response
		END
		BEGIN
				UPDATE  [dbo].[OrderManagement_Engine_WIP]SET
				[engine_status]=4,
				 [line]=9
				WHERE [engine_number]=@engine_number
				select ' Modified successfully.' AS Response
            END
        
     END



---- Building the Delete Statement
ELSE IF (@ActionOp = 'Rest_Ok')
    BEGIN
	set @defect_status=0
        BEGIN
		BEGIN TRY
		INSERT INTO [dbo].[Rework_and_Reject_Quality_Gate] (
	    [engine_number],[model],[sku],[inspection_gate],[inspection_name],[defect_name],[defect_status],[remarks],[created_by]
        )  SELECT 
	    @engine_number,@model,@sku,@inspection_gate,@inspection_name,[defect_name],@defect_status,'OK',@created_by
        FROM [dbo].[Rework_and_Reject_Defect] WHERE [inspection_name]=@inspection_name and [defect_name]!= @defect_name;
		SELECT 'Success!' AS Response
		END TRY
		BEGIN CATCH
-- statement to handle errors
        IF  ERROR_NUMBER()=2627
		SELECT '[Error]-Engine , Inspection and Defect need to be unique. This Combination already Exists. Please try a different and unique ID. (Detail - You cannot insert this value into the table as there is a primary key/unique key violation or one of the inputs is incorrect).' AS Response
END CATCH
        END
		BEGIN
				UPDATE  [dbo].[OrderManagement_Engine_WIP]SET
				[engine_status]=4,
				 [line]=9
				WHERE [engine_number]=@engine_number
				select ' Modified successfully.' AS Response
            END
        
     END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Rework]    Script Date: 07-06-2022 18:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Rework]
-- Add the parameters for the stored procedure here
@engine_number             varchar(50),
@model                     varchar(50),
@sku                       varchar(50),
@engine_status             varchar(50),
@inspection_name           varchar(50),
@defect_name               varchar(50),
@defect_status             varchar(50),
@remarks                   text,
@created_by                varchar(50), --This value is that of the logged_in_user
@ActionOp                  varchar(10)

AS
BEGIN
DECLARE @isExist int    = (select count(1) from [dbo].[Rework_and_Reject_Rework] WHERE [engine_number]=@engine_number AND inspection_name = @inspection_name AND [defect_name]=@defect_name)

-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

--DECLARE @inspection_gate as varchar(50) = (SELECT [inspection_gate_name] from [dbo].[Rework_and_Reject_Inspection_Gate] );

-- Building the Create Statement
IF (@ActionOp= 'Update')
begin
DECLARE @defect_status_int int

if @defect_status='Ok'
begin
 set @defect_status_int=0
end
else if @defect_status='Not Ok'
begin
 set @defect_status_int=1
end
 

    BEGIN
	BEGIN 
		UPDATE  [dbo].[Rework_and_Reject_Rework] SET
		        [remarks]=@remarks,
                [created_by]=@created_by,
				[defect_status]=@defect_status_int
				WHERE [engine_number]=@engine_number and [defect_name]=@defect_name and inspection_name=@inspection_name
				select ' Modified successfully.' AS Response  
    END
	BEGIN 
		UPDATE  [dbo].[Rework_and_Reject_Quality_Gate] SET
				[defect_status]=@defect_status_int
				WHERE [engine_number]=@engine_number and [defect_name]=@defect_name and inspection_name=@inspection_name
				select ' Modified successfully.' AS Response  
    END

end
end
---- Building the Update Statement
ELSE IF (@ActionOp = 'Scrap')
    BEGIN
	
 
      BEGIN 
		UPDATE  [dbo].[Rework_and_Reject_Rework] SET
		        [remarks]='Scraped',
                [created_by]=@created_by,
				[defect_status]=@defect_status_int
				WHERE [engine_number]=@engine_number and [defect_name]=@defect_name and inspection_name=@inspection_name
				select ' Modified successfully.' AS Response  
    END
			BEGIN 
		        UPDATE  [dbo].[Rework_and_Reject_Quality_Gate] SET
				[defect_status]=1
				WHERE [engine_number]=@engine_number
				select ' Modified successfully.' AS Response  
             END

			BEGIN 
		        UPDATE [dbo].[OrderManagement_Engine_WIP] SET
				[engine_status]=2,
                [line]=5
				WHERE [engine_number]=@engine_number
				select ' Modified successfully.' AS Response  
             END
        
     END



 --Building the Delete Statement
ELSE IF (@ActionOp = 'Ok')
BEGIN
declare @check_inspection_ok as int =(select count ([defect_name]) from [dbo].[Rework_and_Reject_Quality_Gate]
		                                              where [defect_status]=1 and inspection_name=@inspection_name)
   
                if (@check_inspection_ok=0)
			
				BEGIN 
		UPDATE  [dbo].[Rework_and_Reject_Rework] SET
		        [remarks]='OK',
                [created_by]=@created_by,
				[engine_status]=2,
				[defect_status]=@defect_status_int
				WHERE [engine_number]=@engine_number and [defect_name]=@defect_name and inspection_name=@inspection_name
				select ' Modified successfully.' AS Response  
    END



        else 
		begin
		SELECT 'The Defects of this inspection are Not Ok yet.' AS Response
		end
     
		
			BEGIN 
		        UPDATE  [dbo].[Rework_and_Reject_Quality_Gate] SET
				[defect_status]=0
				WHERE [engine_number]=@engine_number and [inspection_name]=@inspection_name
				select ' Modified successfully.' AS Response  
             END

			BEGIN 
		        UPDATE [dbo].[OrderManagement_Engine_WIP] SET
				[engine_status]=3,
                [line]=9
				WHERE [engine_number]=@engine_number
				select ' Modified successfully.' AS Response  
             END
        
     END
end
	
	--truncate table [dbo].[Rework_and_Reject_Quality_Gate]

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[74] 4[3] 2[4] 3) )"
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
         Begin Table = "Rework_and_Reject_Defect"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 311
               Right = 358
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Rework_and_Reject_Inspection"
            Begin Extent = 
               Top = 32
               Left = 550
               Bottom = 329
               Right = 830
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Rework_and_Reject_Defect'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Rework_and_Reject_Defect'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[74] 4[3] 2[4] 3) )"
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
         Begin Table = "Rework_and_Reject_Defect"
            Begin Extent = 
               Top = 9
               Left = 343
               Bottom = 407
               Right = 591
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Rework_and_Reject_Inspection"
            Begin Extent = 
               Top = 9
               Left = 648
               Bottom = 328
               Right = 928
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Rework_and_Reject_Quality_Gate"
            Begin Extent = 
               Top = 9
               Left = 985
               Bottom = 427
               Right = 1340
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Rework_and_Reject_Quality_Gate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Rework_and_Reject_Quality_Gate'
GO
