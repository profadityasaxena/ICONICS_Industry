USE [BajajMEA]
GO

/****** Object:  Table [dbo].[Maintenance_Part_Life]    Script Date: 25-08-2022 13:04:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Maintenance_Part_Life](
	[uid] [int] IDENTITY(1,1) NOT NULL,
	[sub_unit_id] [int] NOT NULL,
	[part_id] [varchar](50) NOT NULL,
	[part_name] [varchar](50) NOT NULL,
	[part_life_value_estimated] [int] NOT NULL,
	[part_life_value_actual] [int] NULL,
	[part_life_units] [varchar](50) NULL,
	[change_reason] [varchar](50) NULL,
	[remarks] [text] NULL,
	[alert_value_1] [int] NOT NULL,
	[alert_value_2] [int] NOT NULL,
	[line_stop] [int] NULL,
	[sms] [int] NULL,
	[email] [int] NULL,
	[alert_user_1] [varchar](50) NULL,
	[alert_user_2] [varchar](50) NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_on] [datetime] NOT NULL,
	[updated_by] [varchar](50) NOT NULL,
	[updated_on] [datetime] NOT NULL,
 CONSTRAINT [PK_Maintenance_Part_Life] PRIMARY KEY CLUSTERED 
(
	[part_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UC_Unique_Part_ID] UNIQUE NONCLUSTERED 
(
	[part_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Maintenance_Part_Life] ADD  CONSTRAINT [DF_Maintenance_Part_Life_created_on]  DEFAULT (getdate()) FOR [created_on]
GO

ALTER TABLE [dbo].[Maintenance_Part_Life]  WITH CHECK ADD  CONSTRAINT [FK_Maintenance_Part_Life_Config_Sub_Unit] FOREIGN KEY([sub_unit_id])
REFERENCES [dbo].[Config_Sub_Unit] ([sub_unit_id])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[Maintenance_Part_Life] CHECK CONSTRAINT [FK_Maintenance_Part_Life_Config_Sub_Unit]
GO


